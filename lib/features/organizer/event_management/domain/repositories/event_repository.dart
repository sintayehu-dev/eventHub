import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';

abstract class EventRepository {
  /// Create a new event
  Future<Either<NetworkExceptions, EventEntity>> createEvent({
    required UniqueId organizerId,
    required CreateEventRequest request,
  });

  /// Get event by ID
  Future<Either<NetworkExceptions, EventEntity>> getEventById(UniqueId eventId);

  /// Get all events for an organizer
  Future<Either<NetworkExceptions, List<EventEntity>>> getOrganizerEvents({
    required UniqueId organizerId,
    EventStatus? status,
    int? limit,
    UniqueId? lastEventId,
  });

  /// Update an existing event
  Future<Either<NetworkExceptions, EventEntity>> updateEvent({
    required UniqueId eventId,
    required UniqueId organizerId,
    required UpdateEventRequest request,
  });

  /// Delete an event
  Future<Either<NetworkExceptions, Unit>> deleteEvent({
    required UniqueId eventId,
    required UniqueId organizerId,
  });

  /// Cancel an event
  Future<Either<NetworkExceptions, EventEntity>> cancelEvent({
    required UniqueId eventId,
    required UniqueId organizerId,
    required String cancellationReason,
  });

  /// Upload event banner image
  Future<Either<NetworkExceptions, String>> uploadEventBanner({
    required UniqueId eventId,
    required String imagePath,
  });

  /// Delete event banner image
  Future<Either<NetworkExceptions, Unit>> deleteEventBanner({
    required UniqueId eventId,
    required String bannerUrl,
  });

  /// Get events by status
  Future<Either<NetworkExceptions, List<EventEntity>>> getEventsByStatus({
    required UniqueId organizerId,
    required EventStatus status,
    int? limit,
  });

  /// Search events
  Future<Either<NetworkExceptions, List<EventEntity>>> searchEvents({
    required UniqueId organizerId,
    required String query,
    EventStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  });

  /// Duplicate an event
  Future<Either<NetworkExceptions, EventEntity>> duplicateEvent({
    required UniqueId eventId,
    required UniqueId organizerId,
    required EventTitle newTitle,
    required DateTime newDateTime,
  });

  /// Get event statistics
  Future<Either<NetworkExceptions, EventStatistics>> getEventStatistics({
    required UniqueId eventId,
    required UniqueId organizerId,
  });

  /// Stream event updates (real-time)
  Stream<Either<NetworkExceptions, EventEntity>> watchEvent(UniqueId eventId);

  /// Stream organizer events (real-time)
  Stream<Either<NetworkExceptions, List<EventEntity>>> watchOrganizerEvents({
    required UniqueId organizerId,
    EventStatus? status,
  });
}