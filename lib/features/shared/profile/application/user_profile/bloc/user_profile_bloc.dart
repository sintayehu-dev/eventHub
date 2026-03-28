import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/shared/profile/domain/repositories/user_profile_repository.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';
part 'user_profile_bloc.freezed.dart';

@injectable
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepository _repository;

  UserProfileBloc(this._repository) : super(const UserProfileState.initial()) {
    on<_LoadUserProfile>(_onLoadUserProfile);
    on<_UpdateUserProfile>(_onUpdateUserProfile);
    on<_UpdateUserPreferences>(_onUpdateUserPreferences);
    on<_UpdateProfileImage>(_onUpdateProfileImage);
    on<_UpdateUserStatus>(_onUpdateUserStatus);
    on<_LoadCurrentEventAssignment>(_onLoadCurrentEventAssignment);
    on<_UpdateStaffData>(_onUpdateStaffData);
    on<_UpdateOrganizerData>(_onUpdateOrganizerData);
    on<_UpdateAttendeeData>(_onUpdateAttendeeData);
    on<_RefreshProfile>(_onRefreshProfile);
  }

  Future<void> _onLoadUserProfile(
    _LoadUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.getUserProfile(userId: event.userId);

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (profile) => emit(UserProfileState.loaded(profile: profile)),
    );
  }

  Future<void> _onUpdateUserProfile(
    _UpdateUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateUserProfile(
      userId: event.userId,
      profile: event.profile,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (profile) => emit(UserProfileState.profileUpdated(profile: profile)),
    );
  }

  Future<void> _onUpdateUserPreferences(
    _UpdateUserPreferences event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateUserPreferences(
      userId: event.userId,
      preferences: event.preferences,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (preferences) => emit(UserProfileState.preferencesUpdated(preferences: preferences)),
    );
  }

  Future<void> _onUpdateProfileImage(
    _UpdateProfileImage event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateProfileImage(
      userId: event.userId,
      imagePath: event.imagePath,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (imageUrl) => emit(UserProfileState.profileImageUpdated(imageUrl: imageUrl)),
    );
  }

  Future<void> _onUpdateUserStatus(
    _UpdateUserStatus event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateUserStatus(
      userId: event.userId,
      status: event.status,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (_) => emit(const UserProfileState.statusUpdated()),
    );
  }

  Future<void> _onLoadCurrentEventAssignment(
    _LoadCurrentEventAssignment event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.getCurrentEventAssignment(
      staffId: event.staffId,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (assignment) => emit(UserProfileState.eventAssignmentLoaded(assignment: assignment)),
    );
  }

  Future<void> _onUpdateStaffData(
    _UpdateStaffData event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateStaffData(
      userId: event.userId,
      staffData: event.staffData,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (staffData) => emit(UserProfileState.staffDataUpdated(staffData: staffData)),
    );
  }

  Future<void> _onUpdateOrganizerData(
    _UpdateOrganizerData event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateOrganizerData(
      userId: event.userId,
      organizerData: event.organizerData,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (organizerData) => emit(UserProfileState.organizerDataUpdated(organizerData: organizerData)),
    );
  }

  Future<void> _onUpdateAttendeeData(
    _UpdateAttendeeData event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(const UserProfileState.loading());

    final result = await _repository.updateAttendeeData(
      userId: event.userId,
      attendeeData: event.attendeeData,
    );

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (attendeeData) => emit(UserProfileState.attendeeDataUpdated(attendeeData: attendeeData)),
    );
  }

  Future<void> _onRefreshProfile(
    _RefreshProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    final result = await _repository.getUserProfile(userId: event.userId);

    result.fold(
      (failure) => emit(UserProfileState.error(message: NetworkExceptions.getRawErrorMessage(failure))),
      (profile) => emit(UserProfileState.profileRefreshed(profile: profile)),
    );
  }
}