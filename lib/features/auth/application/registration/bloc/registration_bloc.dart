import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_event.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_state.dart';
import 'package:eventhub/features/auth/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

  RegistrationBloc(this._authRepository, this._userService)
      : super(const RegistrationState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<UserRoleChanged>(_onUserRoleChanged);
    on<ToggleShowPassword>(_onToggleShowPassword);
    on<RegistrationSubmitted>(_onRegistrationSubmitted);
  }
  
  final AuthRepository _authRepository;
  final UserService _userService;

  void _onEmailChanged(EmailChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      email: EmailAddress(event.email.trim()),
      showErrorMessages: false,
      isRegistrationError: false,
        isRegistrationSuccessful: false,
    ),);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegistrationState> emit) {
    final password = event.password.trim();    
   
    emit(state.copyWith(
        password: Password(password),
      showErrorMessages: false,
      isRegistrationError: false,
        isRegistrationSuccessful: false,
    ),);
  }

  void _onUserRoleChanged(
      UserRoleChanged event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        userRole: UserRole(event.role),
        showErrorMessages: false,
        isRegistrationError: false,
        isRegistrationSuccessful: false,
      ),
    );
  }

  void _onToggleShowPassword(ToggleShowPassword event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
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
    
    // Check if required fields are provided and valid
    if (state.email == null || !state.email!.isValid()) {
      emit(state.copyWith(showErrorMessages: true));
      return;
    }

    if (state.password == null || !state.password!.isValid()) {
      emit(state.copyWith(showErrorMessages: true));
      return;
    }

    if (state.userRole == null || !state.userRole!.isValid()) {
      emit(state.copyWith(
        showErrorMessages: true,
        isRegistrationError: true,
        errorMessage: 'Please select your role.',
      ));
      return;
    }
    
    emit(state.copyWith(isLoading: true));
    
    // Extract email and password from value objects
    final email = state.email!.value.getOrElse(() => '');
    final password = state.password!.value.getOrElse(() => '');
    final role = state.userRole!.value.getOrElse(() => '');

    final result =
        await _authRepository.registerWithEmailAndPassword(email, password);

    await result.fold((failure) async {
      if (!emit.isDone) {
        emit(state.copyWith(
            isRegistrationError: true, 
            errorMessage: NetworkExceptions.getRawErrorMessage(failure),
            isLoading: false
            ));
      }
    }, (firebaseUser) async {
      // Create user profile for Firestore
      final userProfile = UserProfileEntity.fromFirebaseUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        displayName: firebaseUser.displayName,
        photoURL: firebaseUser.photoUrl,
        isEmailVerified: firebaseUser.emailVerified,
        role: role,
      );

      // Save to Firestore
      await _userService.createUserProfile(userProfile);

      // Save Firebase user data locally
      await _userService.saveUserData(firebaseUser);

      // Determine route based on role
      String routeName;
      switch (role.toLowerCase()) {
        case 'attendee':
          routeName = RouteName.attendeeHome;
          break;
        case 'organizer':
          routeName = RouteName.organizerHome;
          break;
        case 'staff':
          routeName = RouteName.staffScanner;
          break;
        default:
          routeName = RouteName.attendeeHome;
          break;
      }

      if (!emit.isDone) {
        emit(state.copyWith(
          isRegistrationError: false,
          errorMessage: '', 
          isLoading: false,
          isRegistrationSuccessful: true,
          routeName: routeName,
        ));
      }
    }
    );
  }
}
