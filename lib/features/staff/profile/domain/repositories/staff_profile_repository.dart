import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/profile/domain/entities/staff_profile_entity.dart';

part 'staff_profile_repository.freezed.dart';

abstract class StaffProfileRepository {
  /// Get staff profile by ID
  Future<Either<NetworkExceptions, StaffProfileEntity>> getStaffProfile({
    required String staffId,
  });

  /// Update staff profile information
  Future<Either<NetworkExceptions, StaffProfileEntity>> updateStaffProfile({
    required String staffId,
    required StaffProfileEntity profile,
  });

  /// Update staff preferences
  Future<Either<NetworkExceptions, StaffPreferences>> updateStaffPreferences({
    required String staffId,
    required StaffPreferences preferences,
  });

  /// Get current event assignment for staff
  Future<Either<NetworkExceptions, CurrentEventAssignment?>> getCurrentEventAssignment({
    required String staffId,
  });

  /// Update staff profile image
  Future<Either<NetworkExceptions, String>> updateProfileImage({
    required String staffId,
    required String imagePath,
  });

  /// Get staff statistics (events worked, check-ins, etc.)
  Future<Either<NetworkExceptions, StaffStatistics>> getStaffStatistics({
    required String staffId,
  });

  /// Update staff status
  Future<Either<NetworkExceptions, void>> updateStaffStatus({
    required String staffId,
    required StaffProfileStatus status,
  });
}

@freezed
class StaffStatistics with _$StaffStatistics {
  const factory StaffStatistics({
    required int totalEventsWorked,
    required int totalCheckIns,
    required double averageRating,
    required int totalHoursWorked,
    required DateTime lastActiveDate,
    required List<String> recentEvents,
  }) = _StaffStatistics;
}