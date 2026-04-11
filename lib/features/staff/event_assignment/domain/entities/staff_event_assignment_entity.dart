import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_event_assignment_entity.freezed.dart';

@freezed
class StaffEventAssignmentEntity with _$StaffEventAssignmentEntity {
  const factory StaffEventAssignmentEntity({
    required String id,
    required String staffId,
    required String eventId,
    required String eventTitle,
    required String eventLocation,
    required DateTime eventDateTime,
    required StaffRole role,
    required List<StaffPermission> permissions,
    required String assignedBy,
    required DateTime assignedAt,
    String? eventBannerUrl,
    bool? isActive,
  }) = _StaffEventAssignmentEntity;
}

enum StaffRole {
  staff,
}

enum StaffPermission {
  scan,
  viewAttendees,
  manualCheckIn,
  viewReports,
  manageStaff,
}

extension StaffRoleExtension on StaffRole {
  String get displayName {
    switch (this) {
      case StaffRole.staff:
        return 'Staff';
    }
  }

  List<StaffPermission> get defaultPermissions {
    switch (this) {
      case StaffRole.staff:
        return [StaffPermission.scan, StaffPermission.viewAttendees];
    }
  }
}

extension StaffPermissionExtension on StaffPermission {
  String get displayName {
    switch (this) {
      case StaffPermission.scan:
        return 'Scan Tickets';
      case StaffPermission.viewAttendees:
        return 'View Attendees';
      case StaffPermission.manualCheckIn:
        return 'Manual Check-in';
      case StaffPermission.viewReports:
        return 'View Reports';
      case StaffPermission.manageStaff:
        return 'Manage Staff';
    }
  }
}