import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    on<FullNameChanged>(_onFullNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<UserRoleChanged>(_onUserRoleChanged);
    on<ToggleShowPassword>(_onToggleShowPassword);
    on<RegistrationSubmitted>(_onRegistrationSubmitted);
  }
  
  final AuthRepository _authRepository;
  final UserService _userService;

  void _onFullNameChanged(
      FullNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      fullName: FullName(event.fullName.trim()),
      showErrorMessages: false,
      isRegistrationError: false,
      isRegistrationSuccessful: false,
    ));
  }

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
    if (state.fullName == null || !state.fullName!.isValid()) {
      emit(state.copyWith(showErrorMessages: true));
      return;
    }

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
    
    // Extract values from value objects
    final fullName = state.fullName!.value.getOrElse(() => '');
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
      // Update Firebase user display name
      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          await currentUser.updateDisplayName(fullName);
          await currentUser.reload(); // Reload to get updated user data
        }
      } catch (e) {
        print('Failed to update display name: $e');
        // Continue with registration even if display name update fails
      }

      // Create user profile for Firestore
      final userProfile = UserProfileEntity.fromFirebaseUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        displayName: fullName, // Use the full name from the form
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
