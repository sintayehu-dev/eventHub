import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/shared/profile/domain/repositories/user_profile_repository.dart';
import 'package:eventhub/features/shared/profile/infrastructure/datasources/firebase_user_profile_data_source.dart';

@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final FirebaseUserProfileDataSource _dataSource;

  UserProfileRepositoryImpl(this._dataSource);

  @override
  Future<Either<NetworkExceptions, UserProfileEntity>> getUserProfile({
    required String userId,
  }) async {
    try {
      final profile = await _dataSource.getUserProfile(userId: userId);
      return Right(profile);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, UserProfileEntity>> updateUserProfile({
    required String userId,
    required UserProfileEntity profile,
  }) async {
    try {
      final updatedProfile = await _dataSource.updateUserProfile(
        userId: userId,
        profile: profile,
      );
      return Right(updatedProfile);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, UserPreferences>> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  }) async {
    try {
      final updatedPreferences = await _dataSource.updateUserPreferences(
        userId: userId,
        preferences: preferences,
      );
      return Right(updatedPreferences);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> updateProfileImage({
    required String userId,
    required String imagePath,
  }) async {
    try {
      final imageUrl = await _dataSource.updateProfileImage(
        userId: userId,
        imagePath: imagePath,
      );
      return Right(imageUrl);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, void>> updateUserStatus({
    required String userId,
    required UserProfileStatus status,
  }) async {
    try {
      await _dataSource.updateUserStatus(
        userId: userId,
        status: status,
      );
      return const Right(null);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, CurrentEventAssignment?>> getCurrentEventAssignment({
    required String staffId,
  }) async {
    try {
      final assignment = await _dataSource.getCurrentEventAssignment(
        staffId: staffId,
      );
      return Right(assignment);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, StaffProfileData>> updateStaffData({
    required String userId,
    required StaffProfileData staffData,
  }) async {
    try {
      final updatedStaffData = await _dataSource.updateStaffData(
        userId: userId,
        staffData: staffData,
      );
      return Right(updatedStaffData);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, OrganizerProfileData>> updateOrganizerData({
    required String userId,
    required OrganizerProfileData organizerData,
  }) async {
    try {
      final updatedOrganizerData = await _dataSource.updateOrganizerData(
        userId: userId,
        organizerData: organizerData,
      );
      return Right(updatedOrganizerData);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, AttendeeProfileData>> updateAttendeeData({
    required String userId,
    required AttendeeProfileData attendeeData,
  }) async {
    try {
      final updatedAttendeeData = await _dataSource.updateAttendeeData(
        userId: userId,
        attendeeData: attendeeData,
      );
      return Right(updatedAttendeeData);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }
}