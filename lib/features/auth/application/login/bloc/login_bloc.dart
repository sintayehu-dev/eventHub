import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_event.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_state.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc(this._authRepository, this._userService)
      : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ToggleShowPassword>(_onToggleShowPassword);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<GoogleSignInSubmitted>(_onGoogleSignInSubmitted);
    on<PasswordResetRequested>(_onPasswordResetRequested);
  }
  
  final AuthRepository _authRepository;
  final UserService _userService;

  String _getRouteNameForRole(String? role) {
    if (role == null) return RouteName.attendeeHome;

    switch (role.toLowerCase()) {
      case 'attendee':
        return RouteName.attendeeHome;
      case 'organizer':
        return RouteName.organizerHome;
      case 'staff':
        return RouteName.staffScanner;
      default:
        return RouteName.attendeeHome;
    }
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: EmailAddress(event.email.trim()),
        isLoginError: false,
        errorMessage: '',
        isPasswordResetSent: false,
        successMessage: '',
        isLoginSuccessful: false,
    ),);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: Password(event.password.trim()),
        isLoginError: false,
        errorMessage: '',
        isLoginSuccessful: false,
    ),);
  }

  void _onToggleShowPassword(ToggleShowPassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (connected) {
      // Check if email and password are provided and valid
      if (state.email == null || !state.email!.isValid()) {
        emit(state.copyWith(showErrorMessages: true));
        return;
      }
      
      if (state.password == null || !state.password!.isValid()) {
        emit(state.copyWith(showErrorMessages: true));
        return;
      }
      
      emit(state.copyWith(isLoading: true));
      
      // Extract email and password from value objects
      final email = state.email!.value.getOrElse(() => '');
      final password = state.password!.value.getOrElse(() => '');
      
      final result =
          await _authRepository.signInWithEmailAndPassword(email, password);
      
      await result.fold(
        (failure) async {
          // Extract just the error message
          final errorMessage = NetworkExceptions.getRawErrorMessage(failure);
          
          emit(state.copyWith(
            isLoading: false,
            isLoginError: true,
            errorMessage: errorMessage,
          ));
        },
        (firebaseUser) async {
          try {
            // Store Firebase user data
            await _userService.saveUserData(firebaseUser);

            // Get user profile to determine role-based routing
            final userProfile =
                await _userService.getUserProfile(firebaseUser.uid);

            final routeName = _getRouteNameForRole(userProfile?.role);

            if (!emit.isDone) {
              emit(state.copyWith(
                isLoading: false,
                isLoginError: false,
                isLoginSuccessful: true,
                routeName: routeName,
              ));
            }
          } catch (e) {
            // Handle any errors during user profile retrieval
            final errorMessage = e.toString().contains('permission-denied')
                ? 'Access denied. Please contact support.'
                : 'Failed to load user profile: ${e.toString()}';

            if (!emit.isDone) {
              emit(state.copyWith(
                isLoading: false,
                isLoginError: true,
                errorMessage: errorMessage,
              ));
            }
          }
        },
      );
    } else {
      emit(state.copyWith(
        isLoading: false,
        isLoginError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
    }
  }

  Future<void> _onGoogleSignInSubmitted(GoogleSignInSubmitted event, Emitter<LoginState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (connected) {
      emit(state.copyWith(isLoading: true));
      
      final result = await _authRepository.signInWithGoogle();

      await result.fold(
        (failure) async {
          final errorMessage = NetworkExceptions.getRawErrorMessage(failure);
          emit(state.copyWith(
            isLoading: false,
            isLoginError: true,
            errorMessage: errorMessage,
          ));
        },
        (firebaseUser) async {
          try {
            // Store Firebase user data
            await _userService.saveUserData(firebaseUser);

            // Get user profile to determine role-based routing
            final userProfile =
                await _userService.getUserProfile(firebaseUser.uid);

            final routeName = _getRouteNameForRole(userProfile?.role);

            if (!emit.isDone) {
              emit(state.copyWith(
                isLoading: false,
                isLoginError: false,
                isLoginSuccessful: true,
                routeName: routeName,
              ));
            }
          } catch (e) {
            // Handle any errors during user profile retrieval
            final errorMessage = e.toString().contains('permission-denied')
                ? 'Access denied. Please contact support.'
                : 'Failed to load user profile: ${e.toString()}';

            if (!emit.isDone) {
              emit(state.copyWith(
                isLoading: false,
                isLoginError: true,
                errorMessage: errorMessage,
              ));
            }
          }
        },
      );
    } else {
      emit(state.copyWith(
        isLoading: false,
        isLoginError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
    }
  }

  Future<void> _onPasswordResetRequested(
      PasswordResetRequested event, Emitter<LoginState> emit) async {
    final connected = await AppConnectivity.connectivity();

    if (!connected) {
      emit(state.copyWith(
        isLoginError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
      return;
    }

    if (state.email == null || !state.email!.isValid()) {
      emit(state.copyWith(
        showErrorMessages: true,
        isLoginError: true,
        errorMessage: "Please enter a valid email address.",
      ));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final email = state.email!.value.getOrElse(() => '');
    final result = await _authRepository.sendPasswordResetEmail(email);

    result.fold(
      (failure) {
        final errorMessage = NetworkExceptions.getRawErrorMessage(failure);
        emit(state.copyWith(
          isLoading: false,
          isLoginError: true,
          errorMessage: errorMessage,
        ));
      },
      (_) {
        emit(state.copyWith(
          isLoading: false,
          isLoginError: false,
          isPasswordResetSent: true,
          successMessage: "Password reset email sent. Please check your inbox.",
        ));
      },
    );
  }
}
