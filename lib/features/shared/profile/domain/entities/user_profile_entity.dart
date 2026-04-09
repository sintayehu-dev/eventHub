import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

@freezed
class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    String? phone,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    @Default(UserProfileStatus.active) UserProfileStatus status,
    @Default(UserPreferences()) UserPreferences preferences,
    // Role-specific data
    StaffProfileData? staffData,
    OrganizerProfileData? organizerData,
    AttendeeProfileData? attendeeData,
  }) = _UserProfileEntity;
}

@freezed
class StaffProfileData with _$StaffProfileData {
  const factory StaffProfileData({
    CurrentEventAssignment? currentEvent,
    @Default([]) List<String> specializations,
    @Default(0) int totalEventsWorked,
    @Default(0) int totalCheckIns,
    @Default(0.0) double averageRating,
    @Default(0) int totalHoursWorked,
  }) = _StaffProfileData;
}

@freezed
class OrganizerProfileData with _$OrganizerProfileData {
  const factory OrganizerProfileData({
    String? organizationName,
    String? website,
    String? description,
    @Default(0) int totalEventsCreated,
    @Default(0) int totalAttendeesServed,
    @Default(0.0) double averageEventRating,
    @Default(false) bool isVerified,
  }) = _OrganizerProfileData;
}

@freezed
class AttendeeProfileData with _$AttendeeProfileData {
  const factory AttendeeProfileData({
    @Default([]) List<String> interests,
    @Default(0) int totalEventsAttended,
    @Default([]) List<String> favoriteEventTypes,
    String? dateOfBirth,
    String? emergencyContact,
    String? emergencyContactPhone,
  }) = _AttendeeProfileData;
}

@freezed
class CurrentEventAssignment with _$CurrentEventAssignment {
  const factory CurrentEventAssignment({
    required String eventId,
    required String eventTitle,
    required String eventLocation,
    required DateTime eventDate,
    required String assignedRole,
    String? assignedGate,
    DateTime? shiftStart,
    DateTime? shiftEnd,
    @Default(EventAssignmentStatus.active) EventAssignmentStatus status,
    String? notes,
  }) = _CurrentEventAssignment;
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default(true) bool notificationsEnabled,
    @Default(true) bool emailNotifications,
    @Default(true) bool pushNotifications,
    @Default(false) bool soundEnabled,
    @Default(false) bool vibrationEnabled,
    @Default('en') String language,
    @Default('system') String theme, // system, light, dark
  }) = _UserPreferences;
}

enum UserRole {
  staff,
  organizer,
  attendee,
  admin;

  String get displayName {
    switch (this) {
      case UserRole.staff:
        return 'Staff';
      case UserRole.organizer:
        return 'Organizer';
      case UserRole.attendee:
        return 'Attendee';
      case UserRole.admin:
        return 'Admin';
    }
  }
}

enum UserProfileStatus {
  active,
  inactive,
  suspended,
  pending,
  banned;

  String get displayName {
    switch (this) {
      case UserProfileStatus.active:
        return 'Active';
      case UserProfileStatus.inactive:
        return 'Inactive';
      case UserProfileStatus.suspended:
        return 'Suspended';
      case UserProfileStatus.pending:
        return 'Pending';
      case UserProfileStatus.banned:
        return 'Banned';
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