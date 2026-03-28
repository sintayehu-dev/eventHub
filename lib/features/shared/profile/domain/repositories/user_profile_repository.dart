import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';

abstract class UserProfileRepository {
  /// Get user profile by ID
  Future<Either<NetworkExceptions, UserProfileEntity>> getUserProfile({
    required String userId,
  });

  /// Update user profile information
  Future<Either<NetworkExceptions, UserProfileEntity>> updateUserProfile({
    required String userId,
    required UserProfileEntity profile,
  });

  /// Update user preferences
  Future<Either<NetworkExceptions, UserPreferences>> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  });

  /// Update profile image
  Future<Either<NetworkExceptions, String>> updateProfileImage({
    required String userId,
    required String imagePath,
  });

  /// Update user status
  Future<Either<NetworkExceptions, void>> updateUserStatus({
    required String userId,
    required UserProfileStatus status,
  });

  /// Get current event assignment for staff
  Future<Either<NetworkExceptions, CurrentEventAssignment?>> getCurrentEventAssignment({
    required String staffId,
  });

  /// Update staff-specific data
  Future<Either<NetworkExceptions, StaffProfileData>> updateStaffData({
    required String userId,
    required StaffProfileData staffData,
  });

  /// Update organizer-specific data
  Future<Either<NetworkExceptions, OrganizerProfileData>> updateOrganizerData({
    required String userId,
    required OrganizerProfileData organizerData,
  });

  /// Update attendee-specific data
  Future<Either<NetworkExceptions, AttendeeProfileData>> updateAttendeeData({
    required String userId,
    required AttendeeProfileData attendeeData,
  });
}