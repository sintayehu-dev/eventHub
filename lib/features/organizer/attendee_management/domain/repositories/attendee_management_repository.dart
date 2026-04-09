import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/attendee_entity.dart';

abstract class AttendeeManagementRepository {
  /// Get attendees for a specific event
  Future<Either<NetworkExceptions, List<AttendeeEntity>>> getEventAttendees({
    required String eventId,
    AttendeeStatus? status,
    int? limit,
    String? lastAttendeeId,
  });

  /// Get all attendees for an organizer (across all events)
  Future<Either<NetworkExceptions, List<AttendeeEntity>>> getOrganizerAttendees({
    required String organizerId,
    int? limit,
    String? lastAttendeeId,
  });

  /// Search attendees with filters
  Future<Either<NetworkExceptions, List<AttendeeEntity>>> searchAttendees({
    required String query,
    String? eventId,
    String? organizerId,
    AttendeeStatus? status,
    int? limit,
  });

  /// Get detailed information about a specific attendee
  Future<Either<NetworkExceptions, AttendeeEntity>> getAttendeeDetails({
    required String attendeeId,
    required String eventId,
  });

  /// Update attendee status (e.g., check-in, cancel, etc.)
  Future<Either<NetworkExceptions, AttendeeEntity>> updateAttendeeStatus({
    required String attendeeId,
    required String eventId,
    required AttendeeStatus status,
    String? reason,
  });

  /// Send message to a specific attendee
  Future<Either<NetworkExceptions, void>> sendMessageToAttendee({
    required String attendeeId,
    required String eventId,
    required String message,
    required MessageType messageType,
  });

  /// Send bulk message to multiple attendees
  Future<Either<NetworkExceptions, void>> sendBulkMessage({
    required List<String> attendeeIds,
    required String eventId,
    required String message,
    required MessageType messageType,
  });

  /// Export attendee list in various formats
  Future<Either<NetworkExceptions, String>> exportAttendeeList({
    required String eventId,
    required ExportFormat format,
    bool includePersonalInfo = false,
  });

  /// Get attendee statistics for an event
  Future<Either<NetworkExceptions, AttendeeStatistics>> getAttendeeStatistics({
    required String eventId,
  });

  /// Watch real-time attendee updates for an event
  Stream<Either<NetworkExceptions, List<AttendeeEntity>>> watchEventAttendees({
    required String eventId,
  });
}

class AttendeeStatistics {
  final int totalAttendees;
  final int confirmedAttendees;
  final int checkedInAttendees;
  final int cancelledAttendees;
  final int noShowAttendees;
  final double totalRevenue;
  final double averageTicketPrice;
  final Map<String, int> attendeesByTicketType;
  final Map<String, int> attendeesByStatus;

  const AttendeeStatistics({
    required this.totalAttendees,
    required this.confirmedAttendees,
    required this.checkedInAttendees,
    required this.cancelledAttendees,
    required this.noShowAttendees,
    required this.totalRevenue,
    required this.averageTicketPrice,
    required this.attendeesByTicketType,
    required this.attendeesByStatus,
  });

  double get checkInRate => 
      totalAttendees > 0 ? checkedInAttendees / totalAttendees : 0.0;

  double get cancellationRate => 
      totalAttendees > 0 ? cancelledAttendees / totalAttendees : 0.0;

  double get noShowRate => 
      totalAttendees > 0 ? noShowAttendees / totalAttendees : 0.0;
}