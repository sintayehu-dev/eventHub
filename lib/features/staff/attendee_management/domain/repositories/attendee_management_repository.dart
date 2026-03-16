import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';

abstract class AttendeeManagementRepository {
  /// Get all attendees for an event
  Future<Either<NetworkExceptions, AttendeeSearchResult>> getEventAttendees({
    required String eventId,
    required String staffId,
    AttendeeStatus? status,
    String? searchQuery,
    int limit = 20,
    String? cursor,
  });

  /// Get attendee by ID
  Future<Either<NetworkExceptions, AttendeeEntity>> getAttendeeById({
    required String attendeeId,
    required String eventId,
    required String staffId,
  });

  /// Search attendees by name, email, or ticket ID
  Future<Either<NetworkExceptions, AttendeeSearchResult>> searchAttendees({
    required String eventId,
    required String staffId,
    required String query,
    AttendeeStatus? status,
    int limit = 20,
  });

  /// Update attendee status
  Future<Either<NetworkExceptions, AttendeeEntity>> updateAttendeeStatus({
    required String attendeeId,
    required String eventId,
    required String staffId,
    required AttendeeStatus status,
    String? notes,
  });

  /// Get attendee statistics for an event
  Future<Either<NetworkExceptions, AttendeeStats>> getAttendeeStats({
    required String eventId,
    required String staffId,
  });

  /// Manual check-in attendee
  Future<Either<NetworkExceptions, AttendeeEntity>> manualCheckIn({
    required String attendeeId,
    required String eventId,
    required String staffId,
    String? notes,
  });
}