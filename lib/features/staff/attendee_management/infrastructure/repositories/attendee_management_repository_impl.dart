import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/staff/attendee_management/domain/repositories/attendee_management_repository.dart';
import 'package:eventhub/features/staff/attendee_management/infrastructure/datasources/firebase_attendee_management_data_source.dart';

@LazySingleton(as: AttendeeManagementRepository)
class AttendeeManagementRepositoryImpl implements AttendeeManagementRepository {
  final FirebaseAttendeeManagementDataSource _dataSource;

  AttendeeManagementRepositoryImpl({
    required FirebaseAttendeeManagementDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<NetworkExceptions, AttendeeSearchResult>> getEventAttendees({
    required String eventId,
    required String staffId,
    AttendeeStatus? status,
    String? searchQuery,
    int limit = 20,
    String? cursor,
  }) async {
    try {
      final result = await _dataSource.getEventAttendees(
        eventId: eventId,
        staffId: staffId,
        status: status,
        searchQuery: searchQuery,
        limit: limit,
        cursor: cursor,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, AttendeeEntity>> getAttendeeById({
    required String attendeeId,
    required String eventId,
    required String staffId,
  }) async {
    try {
      final result = await _dataSource.getAttendeeById(
        attendeeId: attendeeId,
        eventId: eventId,
        staffId: staffId,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, AttendeeSearchResult>> searchAttendees({
    required String eventId,
    required String staffId,
    required String query,
    AttendeeStatus? status,
    int limit = 20,
  }) async {
    try {
      final result = await _dataSource.getEventAttendees(
        eventId: eventId,
        staffId: staffId,
        status: status,
        searchQuery: query,
        limit: limit,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, AttendeeEntity>> updateAttendeeStatus({
    required String attendeeId,
    required String eventId,
    required String staffId,
    required AttendeeStatus status,
    String? notes,
  }) async {
    try {
      final result = await _dataSource.updateAttendeeStatus(
        attendeeId: attendeeId,
        eventId: eventId,
        staffId: staffId,
        status: status,
        notes: notes,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, AttendeeStats>> getAttendeeStats({
    required String eventId,
    required String staffId,
  }) async {
    try {
      final result = await _dataSource.getAttendeeStats(
        eventId: eventId,
        staffId: staffId,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, AttendeeEntity>> manualCheckIn({
    required String attendeeId,
    required String eventId,
    required String staffId,
    String? notes,
  }) async {
    try {
      final result = await _dataSource.manualCheckIn(
        attendeeId: attendeeId,
        eventId: eventId,
        staffId: staffId,
        notes: notes,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }
}