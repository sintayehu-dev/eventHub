import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/navigation/navigation_service.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_event.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_state.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

@injectable
class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  AuthStatusBloc(this._authRepository, this._userService) : super(const AuthStatusState()) {
    on<AuthStateChanged>(_onAuthStateChanged);
    on<SignOut>(_onSignOut);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    
    // Listen to Firebase auth state changes
    _authStateSubscription = _authRepository.authStateChanges.listen(
      (user) => add(AuthStatusEvent.authStateChanged(user)),
    );
  }

  final AuthRepository _authRepository;
  final UserService _userService;
  StreamSubscription? _authStateSubscription;

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }

  void _onAuthStateChanged(AuthStateChanged event, Emitter<AuthStatusState> emit) {
    if (event.user != null) {
      emit(state.copyWith(
        user: event.user,
        status: AuthStatus.authenticated,
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(
        user: null,
        status: AuthStatus.unauthenticated,
        isLoading: false,
      ));
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthStatusState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    final result = await _authRepository.signOut();
    
    await result.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(state.copyWith(
            isLoading: false,
            errorMessage: NetworkExceptions.getRawErrorMessage(failure),
          ));
        }
      },
      (_) async {
        await _userService.logout();
        if (!emit.isDone) {
          emit(state.copyWith(
            user: null,
            status: AuthStatus.unauthenticated,
            isLoading: false,
            errorMessage: '',
          ));
          
          // Navigate to login page after successful sign out
          _navigateToLogin();
        }
      },
    );
  }

  void _navigateToLogin() {
    final context = NavigationService.navigatorKey.currentContext;
    if (context != null) {
      context.go('/${RouteName.login}');
    }
  }

  Future<void> _onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthStatusState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    final result = await _authRepository.getCurrentUser();
    
    await result.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(state.copyWith(
            status: AuthStatus.unauthenticated,
            isLoading: false,
            errorMessage: NetworkExceptions.getRawErrorMessage(failure),
          ));
        }
      },
      (user) async {
        if (user != null) {
          await _userService.saveUserData(user);
          if (!emit.isDone) {
            emit(state.copyWith(
              user: user,
              status: AuthStatus.authenticated,
              isLoading: false,
              errorMessage: '',
            ));
          }
        } else {
          if (!emit.isDone) {
            emit(state.copyWith(
              user: null,
              status: AuthStatus.unauthenticated,
              isLoading: false,
              errorMessage: '',
            ));
          }
        }
      },
    );
  }
}