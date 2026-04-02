import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/organizer/staff_management/domain/entities/staff_member_entity.dart';
import 'package:eventhub/features/organizer/staff_management/domain/repositories/staff_management_repository.dart';

part 'staff_management_event.dart';
part 'staff_management_state.dart';
part 'staff_management_bloc.freezed.dart';

@injectable
class StaffManagementBloc extends Bloc<StaffManagementEvent, StaffManagementState> {
  final StaffManagementRepository _repository;

  StaffManagementBloc(this._repository) : super(StaffManagementState.initial()) {
    on<_LoadEventStaff>(_onLoadEventStaff);
    on<_LoadOrganizerStaff>(_onLoadOrganizerStaff);
    on<_SearchStaff>(_onSearchStaff);
    on<_LoadStaffDetails>(_onLoadStaffDetails);
    on<_InviteStaff>(_onInviteStaff);
    on<_UpdateStaffRole>(_onUpdateStaffRole);
    on<_AssignStaffToEvent>(_onAssignStaffToEvent);
    on<_RemoveStaffFromEvent>(_onRemoveStaffFromEvent);
    on<_UpdateStaffPermissions>(_onUpdateStaffPermissions);
    on<_DeactivateStaff>(_onDeactivateStaff);
    on<_RefreshStaff>(_onRefreshStaff);
    on<_ClearError>(_onClearError);
  }

  Future<void> _onLoadEventStaff(
    _LoadEventStaff event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getEventStaff(
      eventId: event.eventId,
      role: event.role,
      limit: event.limit,
      lastStaffId: event.lastStaffId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (staff) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        staffMembers: staff,
        selectedEventId: event.eventId,
        filterRole: event.role,
      )),
    );
  }

  Future<void> _onLoadOrganizerStaff(
    _LoadOrganizerStaff event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getOrganizerStaff(
      organizerId: event.organizerId,
      status: event.status,
      limit: event.limit,
      lastStaffId: event.lastStaffId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (staff) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        staffMembers: staff,
        organizerId: event.organizerId,
        filterStatus: event.status,
      )),
    );
  }

  Future<void> _onSearchStaff(
    _SearchStaff event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: true, 
      hasError: false, 
      errorMessage: '',
      searchQuery: event.query,
    ));

    final result = await _repository.searchStaff(
      query: event.query,
      organizerId: event.organizerId,
      eventId: event.eventId,
      role: event.role,
      status: event.status,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (staff) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        staffMembers: staff,
      )),
    );
  }

  Future<void> _onLoadStaffDetails(
    _LoadStaffDetails event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getStaffDetails(
      staffId: event.staffId,
      organizerId: event.organizerId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (staff) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        selectedStaff: staff,
      )),
    );
  }

  Future<void> _onInviteStaff(
    _InviteStaff event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isInviting: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isInviting: true, hasError: false, errorMessage: ''));

    final result = await _repository.inviteStaff(
      organizerId: event.organizerId,
      email: event.email,
      role: event.role,
      permissions: event.permissions,
      eventIds: event.eventIds,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isInviting: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (invitation) => emit(state.copyWith(
        isInviting: false,
        hasError: false,
        errorMessage: '',
        pendingInvitation: invitation,
      )),
    );
  }

  Future<void> _onUpdateStaffRole(
    _UpdateStaffRole event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isUpdating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true, hasError: false, errorMessage: ''));

    final result = await _repository.updateStaffRole(
      staffId: event.staffId,
      organizerId: event.organizerId,
      newRole: event.newRole,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (updatedStaff) {
        final updatedStaffList = state.staffMembers.map((s) => 
          s.id == updatedStaff.id ? updatedStaff : s
        ).toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          staffMembers: updatedStaffList,
          selectedStaff: updatedStaff,
        ));
      },
    );
  }

  Future<void> _onAssignStaffToEvent(
    _AssignStaffToEvent event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isUpdating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true, hasError: false, errorMessage: ''));

    final result = await _repository.assignStaffToEvent(
      staffId: event.staffId,
      eventId: event.eventId,
      role: event.role,
      permissions: event.permissions,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (assignment) => emit(state.copyWith(
        isUpdating: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onRemoveStaffFromEvent(
    _RemoveStaffFromEvent event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isUpdating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true, hasError: false, errorMessage: ''));

    final result = await _repository.removeStaffFromEvent(
      staffId: event.staffId,
      eventId: event.eventId,
      reason: event.reason,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (_) {
        final updatedStaffList = state.staffMembers.where((s) => 
          !(s.id == event.staffId && s.currentEventId == event.eventId)
        ).toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          staffMembers: updatedStaffList,
        ));
      },
    );
  }

  Future<void> _onUpdateStaffPermissions(
    _UpdateStaffPermissions event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isUpdating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true, hasError: false, errorMessage: ''));

    final result = await _repository.updateStaffPermissions(
      staffId: event.staffId,
      organizerId: event.organizerId,
      permissions: event.permissions,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (updatedStaff) {
        final updatedStaffList = state.staffMembers.map((s) => 
          s.id == updatedStaff.id ? updatedStaff : s
        ).toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          staffMembers: updatedStaffList,
          selectedStaff: updatedStaff,
        ));
      },
    );
  }

  Future<void> _onDeactivateStaff(
    _DeactivateStaff event,
    Emitter<StaffManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isUpdating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true, hasError: false, errorMessage: ''));

    final result = await _repository.deactivateStaff(
      staffId: event.staffId,
      organizerId: event.organizerId,
      reason: event.reason,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (_) {
        final updatedStaffList = state.staffMembers.where((s) => 
          s.id != event.staffId
        ).toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          staffMembers: updatedStaffList,
          selectedStaff: state.selectedStaff?.id == event.staffId ? null : state.selectedStaff,
        ));
      },
    );
  }

  Future<void> _onRefreshStaff(
    _RefreshStaff event,
    Emitter<StaffManagementState> emit,
  ) async {
    if (state.selectedEventId != null) {
      add(StaffManagementEvent.loadEventStaff(
        eventId: state.selectedEventId!,
        role: state.filterRole,
      ));
    } else if (state.organizerId != null) {
      add(StaffManagementEvent.loadOrganizerStaff(
        organizerId: state.organizerId!,
        status: state.filterStatus,
      ));
    }
  }

  void _onClearError(
    _ClearError event,
    Emitter<StaffManagementState> emit,
  ) {
    emit(state.copyWith(hasError: false, errorMessage: ''));
  }
}