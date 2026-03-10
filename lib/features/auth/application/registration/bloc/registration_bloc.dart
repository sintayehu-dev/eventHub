import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_event.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_state.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

  RegistrationBloc(this._authRepository) 
    : super(RegistrationState(
        firstName: Name(''),
        lastName: Name(''),
        email: EmailAddress(''),
        password: Password(''),
        confirmPassword: ConfirmPassword('', ''),
        termsAcceptance: TermsAcceptance(false),
        profilePhoto: ProfilePhoto(null),
      )) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<TermsAcceptedChanged>(_onTermsAcceptedChanged);
    on<ProfilePhotoChanged>(_onProfilePhotoChanged);
    on<ToggleShowPassword>(_onToggleShowPassword);
    on<ToggleShowConfirmPassword>(_onToggleShowConfirmPassword);
    on<RegistrationSubmitted>(_onRegistrationSubmitted);
  }
  final AuthRepository _authRepository;

  void _onFirstNameChanged(FirstNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      firstName: Name(event.firstName.trim()),
      showErrorMessages: false,
      isRegistrationError: false,
    ),);
  }

  void _onLastNameChanged(LastNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      lastName: Name(event.lastName.trim()),
      showErrorMessages: false,
      isRegistrationError: false,
    ),);
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      email: EmailAddress(event.email.trim()),
      showErrorMessages: false,
      isRegistrationError: false,
    ),);
  }

  void _onProfilePhotoChanged(ProfilePhotoChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      profilePhoto: ProfilePhoto(event.photoPath),
      showErrorMessages: false,
      isRegistrationError: false,
    ),);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegistrationState> emit) {
    final password = event.password.trim();    
   
    
    emit(state.copyWith(
      password: Password(password),
      confirmPassword: ConfirmPassword(
        state.confirmPassword.value.getOrElse(() => ''), 
        password,
      ),
      showErrorMessages: false,
      isRegistrationError: false,
    ),);
  }

  void _onConfirmPasswordChanged(ConfirmPasswordChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      confirmPassword: ConfirmPassword(
        event.confirmPassword.trim(), 
        state.password.value.getOrElse(() => ''),
      ),
      showErrorMessages: false,
      isRegistrationError: false,
      ),
    );
  }

  void _onTermsAcceptedChanged(TermsAcceptedChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      termsAcceptance: TermsAcceptance(event.accepted),
      showErrorMessages: false,
      isRegistrationError: false,
    ),);
  }

  void _onToggleShowPassword(ToggleShowPassword event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void _onToggleShowConfirmPassword(ToggleShowConfirmPassword event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }

  Future<void> _onRegistrationSubmitted(RegistrationSubmitted event, Emitter<RegistrationState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (!connected) {
      emit(state.copyWith(
        isRegistrationError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ),);
      return;
    }
    
    if (!state.isFormValid) {
      emit(state.copyWith(showErrorMessages: true));
      return;
    }
    
    emit(state.copyWith(isLoading: true));
    
    final registration = RegistrationRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
      termsAcceptance: state.termsAcceptance,
      profilePhoto: state.profilePhoto,
    );
    
    final result = await _authRepository.register(registration);
    result.fold(
      (l) => emit(state.copyWith(
        isRegistrationError: true, 
        errorMessage: NetworkExceptions.getRawErrorMessage(l),
        isLoading: false
      )), 
      (r) => emit(state.copyWith(
        isRegistrationError: false, 
        errorMessage: '',
        isLoading: false
      ))
    );
  }
} 
