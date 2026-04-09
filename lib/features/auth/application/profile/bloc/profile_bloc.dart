import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/application/profile/bloc/profile_event.dart';
import 'package:eventhub/features/auth/application/profile/bloc/profile_state.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._authRepository, this._userService) : super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateDisplayName>(_onUpdateDisplayName);
    on<UpdateProfilePhoto>(_onUpdateProfilePhoto);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<DeleteAccount>(_onDeleteAccount);
    on<RefreshProfile>(_onRefreshProfile);
  }

  final AuthRepository _authRepository;
  final UserService _userService;

  Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final currentUser = _userService.getCurrentUser();
      if (currentUser != null) {
        emit(state.copyWith(
          user: currentUser,
          isLoading: false,
          isError: false,
        ));
      } else {
        // Try to get current user from Firebase
        final result = await _authRepository.getCurrentUser();
        result.fold(
          (failure) => emit(state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: NetworkExceptions.getRawErrorMessage(failure),
          )),
          (firebaseUser) async {
            if (firebaseUser != null) {
              await _userService.saveUserData(firebaseUser);
              emit(state.copyWith(
                user: firebaseUser,
                isLoading: false,
                isError: false,
              ));
            } else {
              emit(state.copyWith(
                isLoading: false,
                isError: true,
                errorMessage: 'No user found',
              ));
            }
          },
        );
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: 'Failed to load profile: $e',
      ));
    }
  }

  Future<void> _onUpdateDisplayName(UpdateDisplayName event, Emitter<ProfileState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (!connected) {
      emit(state.copyWith(
        isError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
      return;
    }

    if (event.displayName.trim().isEmpty) {
      emit(state.copyWith(
        isError: true,
        errorMessage: "Display name cannot be empty.",
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true));

    try {
      // Update the local user data
      if (state.user != null) {
        final updatedUser = state.user!.copyWith(displayName: event.displayName.trim());
        await _userService.saveUserData(updatedUser);
        
        emit(state.copyWith(
          user: updatedUser,
          isUpdating: false,
          successMessage: "Display name updated successfully.",
          isError: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isUpdating: false,
        isError: true,
        errorMessage: "Failed to update display name: $e",
      ));
    }
  }

  Future<void> _onUpdateProfilePhoto(UpdateProfilePhoto event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isUpdating: true));

    try {
      if (state.user != null) {
        final updatedUser = state.user!.copyWith(photoUrl: event.photoPath);
        await _userService.saveUserData(updatedUser);
        
        emit(state.copyWith(
          user: updatedUser,
          isUpdating: false,
          successMessage: "Profile photo updated successfully.",
          isError: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isUpdating: false,
        isError: true,
        errorMessage: "Failed to update profile photo: $e",
      ));
    }
  }

  Future<void> _onUpdateEmail(UpdateEmail event, Emitter<ProfileState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (!connected) {
      emit(state.copyWith(
        isError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true));

    // Note: Email updates in Firebase require re-authentication
    // This is a simplified implementation
    emit(state.copyWith(
      isUpdating: false,
      isError: true,
      errorMessage: "Email updates require re-authentication. Please contact support.",
    ));
  }

  Future<void> _onUpdatePassword(UpdatePassword event, Emitter<ProfileState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (!connected) {
      emit(state.copyWith(
        isError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true));

    // Note: Password updates in Firebase require re-authentication
    // This is a simplified implementation
    emit(state.copyWith(
      isUpdating: false,
      isError: true,
      errorMessage: "Password updates require re-authentication. Please use forgot password.",
    ));
  }

  Future<void> _onDeleteAccount(DeleteAccount event, Emitter<ProfileState> emit) async {
    final connected = await AppConnectivity.connectivity();
    
    if (!connected) {
      emit(state.copyWith(
        isError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true));

    // Note: Account deletion in Firebase requires re-authentication
    // This is a simplified implementation
    emit(state.copyWith(
      isUpdating: false,
      isError: true,
      errorMessage: "Account deletion requires re-authentication. Please contact support.",
    ));
  }

  Future<void> _onRefreshProfile(RefreshProfile event, Emitter<ProfileState> emit) async {
    add(const ProfileEvent.loadProfile());
  }
}