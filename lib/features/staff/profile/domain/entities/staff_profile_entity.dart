import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_profile_entity.freezed.dart';

@freezed
class StaffProfileEntity with _$StaffProfileEntity {
  const factory StaffProfileEntity({
    required String id,
    required String email,
    required String name,
    String? phone,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    @Default(StaffProfileStatus.active) StaffProfileStatus status,
    CurrentEventAssignment? currentEvent,
    @Default(StaffPreferences()) StaffPreferences preferences,
    @Default([]) List<String> specializations,
    @Default(0) int totalEventsWorked,
    @Default(0) int totalCheckIns,
    @Default(0.0) double averageRating,
  }) = _StaffProfileEntity;
}

@freezed
class CurrentEventAssignment with _$CurrentEventAssignment {
  const factory CurrentEventAssignment({
    required String eventId,
    required String eventTitle,
    required String eventLocation,
    required DateTime eventDate,
    required String assignedRole,
    required String assignedGate,
    required DateTime shiftStart,
    required DateTime shiftEnd,
    @Default(EventAssignmentStatus.active) EventAssignmentStatus status,
    String? notes,
  }) = _CurrentEventAssignment;
}

@freezed
class StaffPreferences with _$StaffPreferences {
  const factory StaffPreferences({
    @Default(true) bool notificationsEnabled,
    @Default(true) bool shiftReminders,
    @Default(true) bool eventUpdates,
    @Default(false) bool soundEnabled,
    @Default(false) bool vibrationEnabled,
    @Default('en') String language,
    @Default('light') String theme,
  }) = _StaffPreferences;
}

enum StaffProfileStatus {
  active,
  inactive,
  suspended,
  onLeave;

  String get displayName {
    switch (this) {
      case StaffProfileStatus.active:
        return 'Active';
      case StaffProfileStatus.inactive:
        return 'Inactive';
      case StaffProfileStatus.suspended:
        return 'Suspended';
      case StaffProfileStatus.onLeave:
        return 'On Leave';
    }
  }
}

enum EventAssignmentStatus {
  active,
  completed,
  cancelled,
  pending;

  String get displayName {
    switch (this) {
      case EventAssignmentStatus.active:
        return 'Active';
      case EventAssignmentStatus.completed:
        return 'Completed';
      case EventAssignmentStatus.cancelled:
        return 'Cancelled';
      case EventAssignmentStatus.pending:
        return 'Pending';
    }
  }
}