import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/staff_management/domain/entities/staff_member_entity.dart';

abstract class StaffManagementRepository {
  /// Get staff members for a specific event
  Future<Either<NetworkExceptions, List<StaffMemberEntity>>> getEventStaff({
    required String eventId,
    StaffRole? role,
    int? limit,
    String? lastStaffId,
  });

  /// Get all staff members for an organizer
  Future<Either<NetworkExceptions, List<StaffMemberEntity>>> getOrganizerStaff({
    required String organizerId,
    StaffStatus? status,
    int? limit,
    String? lastStaffId,
  });

  /// Search staff members with filters
  Future<Either<NetworkExceptions, List<StaffMemberEntity>>> searchStaff({
    required String query,
    required String organizerId,
    String? eventId,
    StaffRole? role,
    StaffStatus? status,
    int? limit,
  });

  /// Get detailed information about a specific staff member
  Future<Either<NetworkExceptions, StaffMemberEntity>> getStaffDetails({
    required String staffId,
    required String organizerId,
  });

  /// Invite a new staff member
  Future<Either<NetworkExceptions, StaffInvitation>> inviteStaff({
    required String organizerId,
    required String email,
    required StaffRole role,
    required List<String> permissions,
    List<String>? eventIds,
  });

  /// Update staff member role
  Future<Either<NetworkExceptions, StaffMemberEntity>> updateStaffRole({
    required String staffId,
    required String organizerId,
    required StaffRole newRole,
  });

  /// Assign staff member to an event
  Future<Either<NetworkExceptions, StaffEventAssignment>> assignStaffToEvent({
    required String staffId,
    required String eventId,
    StaffRole? role,
    List<String>? permissions,
  });

  /// Remove staff member from an event
  Future<Either<NetworkExceptions, void>> removeStaffFromEvent({
    required String staffId,
    required String eventId,
    String? reason,
  });

  /// Update staff member permissions
  Future<Either<NetworkExceptions, StaffMemberEntity>> updateStaffPermissions({
    required String staffId,
    required String organizerId,
    required List<String> permissions,
  });

  /// Deactivate staff member
  Future<Either<NetworkExceptions, void>> deactivateStaff({
    required String staffId,
    required String organizerId,
    String? reason,
  });

  /// Get staff statistics for an organizer
  Future<Either<NetworkExceptions, StaffStatistics>> getStaffStatistics({
    required String organizerId,
    String? eventId,
  });

  /// Watch real-time staff updates for an event
  Stream<Either<NetworkExceptions, List<StaffMemberEntity>>> watchEventStaff({
    required String eventId,
  });

  /// Accept staff invitation
  Future<Either<NetworkExceptions, StaffMemberEntity>> acceptInvitation({
    required String inviteToken,
    required String userId,
  });

  /// Decline staff invitation
  Future<Either<NetworkExceptions, void>> declineInvitation({
    required String inviteToken,
  });
}

class StaffEventAssignment {
  final String id;
  final String staffId;
  final String eventId;
  final StaffRole role;
  final List<String> permissions;
  final DateTime assignedAt;
  final DateTime? unassignedAt;
  final bool isActive;

  const StaffEventAssignment({
    required this.id,
    required this.staffId,
    required this.eventId,
    required this.role,
    required this.permissions,
    required this.assignedAt,
    this.unassignedAt,
    required this.isActive,
  });
}

class StaffStatistics {
  final int totalStaff;
  final int activeStaff;
  final int inactiveStaff;
  final int pendingInvitations;
  final Map<StaffRole, int> staffByRole;
  final Map<StaffStatus, int> staffByStatus;
  final Map<String, int> staffByEvent;
  final double averageHoursWorked;
  final int totalHoursWorked;

  const StaffStatistics({
    required this.totalStaff,
    required this.activeStaff,
    required this.inactiveStaff,
    required this.pendingInvitations,
    required this.staffByRole,
    required this.staffByStatus,
    required this.staffByEvent,
    required this.averageHoursWorked,
    required this.totalHoursWorked,
  });

  double get activeStaffPercentage => 
      totalStaff > 0 ? activeStaff / totalStaff : 0.0;

  double get pendingInvitationRate => 
      totalStaff > 0 ? pendingInvitations / totalStaff : 0.0;
}