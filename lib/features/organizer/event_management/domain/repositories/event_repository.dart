import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';

abstract class EventRepository {
  /// Create a new event
  Future<Either<NetworkExceptions, EventEntity>> createEvent({
    required String organizerId,
    required CreateEventRequest request,
  });

  /// Get event by ID
  Future<Either<NetworkExceptions, EventEntity>> getEventById(String eventId);

  /// Get all events for an organizer
  Future<Either<NetworkExceptions, List<EventEntity>>> getOrganizerEvents({
    required String organizerId,
    EventStatus? status,
    int? limit,
    String? lastEventId,
  });

  /// Update an existing event
  Future<Either<NetworkExceptions, EventEntity>> updateEvent({
    required String eventId,
    required String organizerId,
    required UpdateEventRequest request,
  });

  /// Delete an event
  Future<Either<NetworkExceptions, Unit>> deleteEvent({
    required String eventId,
    required String organizerId,
  });

  /// Cancel an event
  Future<Either<NetworkExceptions, EventEntity>> cancelEvent({
    required String eventId,
    required String organizerId,
    required String cancellationReason,
  });

  /// Upload event banner image
  Future<Either<NetworkExceptions, String>> uploadEventBanner({
    required String eventId,
    required String imagePath,
  });

  /// Delete event banner image
  Future<Either<NetworkExceptions, Unit>> deleteEventBanner({
    required String eventId,
    required String bannerUrl,
  });

  /// Get events by status
  Future<Either<NetworkExceptions, List<EventEntity>>> getEventsByStatus({
    required String organizerId,
    required EventStatus status,
    int? limit,
  });

  /// Search events
  Future<Either<NetworkExceptions, List<EventEntity>>> searchEvents({
    required String organizerId,
    required String query,
    EventStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  });

  /// Duplicate an event
  Future<Either<NetworkExceptions, EventEntity>> duplicateEvent({
    required String eventId,
    required String organizerId,
    required String newTitle,
    required DateTime newDateTime,
  });

  /// Get event statistics
  Future<Either<NetworkExceptions, EventStatistics>> getEventStatistics({
    required String eventId,
    required String organizerId,
  });

  /// Stream event updates (real-time)
  Stream<Either<NetworkExceptions, EventEntity>> watchEvent(String eventId);

  /// Stream organizer events (real-time)
  Stream<Either<NetworkExceptions, List<EventEntity>>> watchOrganizerEvents({
    required String organizerId,
    EventStatus? status,
  });
}