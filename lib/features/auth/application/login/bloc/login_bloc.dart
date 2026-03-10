import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_event.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_state.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_request.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc(this._authRepository) : super(
    LoginState(
      email: EmailAddress(''),
      password: Password(''),
    ),
  ) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ToggleShowPassword>(_onToggleShowPassword);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<GoogleSignInSubmitted>(_onGoogleSignInSubmitted);
  }
  final AuthRepository _authRepository;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '633714128030-5o8oa06g6o2naskp0d68v3dlipgqnehl.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: EmailAddress(event.email.trim()),
    ),);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: Password(event.password.trim()),
    ),);
  }

  void _onToggleShowPassword(ToggleShowPassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (connected) {
      if (!state.email.isValid()) {
        emit(state.copyWith(showErrorMessages: true));
        return;
      }
      
      if (!state.password.isValid()) {
        emit(state.copyWith(showErrorMessages: true));
        return;
      }
      
      emit(state.copyWith(isLoading: true));
      
      // Extract email from email for API compatibility
      final email = state.email.value.getOrElse(() => '');
      final password = state.password.value.getOrElse(() => '');
      
      final result = await _authRepository.login(LoginRequest(email: email, password: password));
      
      await result.fold(
        (failure) async {
          // Extract just the error message
          final errorMessage = NetworkExceptions.getRawErrorMessage(failure);
          
          // For debugging
          print('Error message: $errorMessage');
          
          emit(state.copyWith(
            isLoading: false,
            isLoginError: true,
            errorMessage: errorMessage,
          ));
        },
        (success) async {
          // Store tokens
          await LocalStorage.instance.setAccessToken(success.access_token);
          await LocalStorage.instance.setRefreshToken(success.refresh_token);
          
          // Store user data
          await LocalStorage.instance.setUserData(success.user.toJson());
          
          if (!emit.isDone) {
            emit(state.copyWith(
              isLoading: false,
              isLoginError: false,
            ));
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
      
      try {
        // Attempt to sign in with Google
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          // User canceled the sign-in flow
          emit(state.copyWith(
            isLoading: false,
            isLoginError: true,
            errorMessage: 'Google sign-in was canceled',
          ));
          return;
        }
        
        // Get Google authentication
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        
        // Get the ID token
        final String? idToken = googleAuth.idToken;
        
        if (idToken == null) {
          emit(state.copyWith(
            isLoading: false,
            isLoginError: true,
            errorMessage: 'Failed to get Google authentication token',
          ));
          return;
        }
        
        // Send token to backend for verification and login
        final result = await _authRepository.googleLogin(idToken);
        
        await result.fold(
          (failure) async {
            final errorMessage = NetworkExceptions.getRawErrorMessage(failure);
            emit(state.copyWith(
              isLoading: false,
              isLoginError: true,
              errorMessage: errorMessage,
            ));
          },
          (success) async {
            // Store tokens
            await LocalStorage.instance.setAccessToken(success.access_token);
            await LocalStorage.instance.setRefreshToken(success.refresh_token);
            
            // Store user data
            await LocalStorage.instance.setUserData(success.user.toJson());
            
            if (!emit.isDone) {
              emit(state.copyWith(
                isLoading: false,
                isLoginError: false,
              ));
            }
          },
        );
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          isLoginError: true,
          errorMessage: 'Google sign-in failed: ${e.toString()}',
        ));
      }
    } else {
      emit(state.copyWith(
        isLoading: false,
        isLoginError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
    }
  }
}
