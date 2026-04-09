import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

abstract class EventDiscoveryRepository {
  /// Get all upcoming events
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getUpcomingEvents({
    int? limit,
    String? lastEventId,
  });

  /// Search events with filters
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> searchEvents({
    required EventSearchFilters filters,
    int? limit,
  });

  /// Get events by category
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getEventsByCategory({
    required EventCategory category,
    int? limit,
  });

  /// Get event details for attendee view
  Future<Either<NetworkExceptions, EventDiscoveryEntity>> getEventDetails({
    required String eventId,
    String? userId, // For favorite status
  });

  /// Get featured/popular events
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getFeaturedEvents({
    int? limit,
  });

  /// Get nearby events (if location is available)
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getNearbyEvents({
    required double latitude,
    required double longitude,
    double? radiusKm,
    int? limit,
  });

  /// Add/remove event from favorites
  Future<Either<NetworkExceptions, bool>> toggleEventFavorite({
    required String userId,
    required String eventId,
  });

  /// Get user's favorite events
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getFavoriteEvents({
    required String userId,
  });

  /// Stream upcoming events (real-time)
  Stream<Either<NetworkExceptions, List<EventDiscoveryEntity>>> watchUpcomingEvents();
}