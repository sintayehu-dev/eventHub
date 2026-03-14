import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/repositories/event_discovery_repository.dart';
import 'package:eventhub/features/attendee/event_discovery/infrastructure/datasources/firebase_event_discovery_data_source.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

@Injectable(as: EventDiscoveryRepository)
class EventDiscoveryRepositoryImpl implements EventDiscoveryRepository {
  final FirebaseEventDiscoveryDataSource _firebaseDataSource;

  EventDiscoveryRepositoryImpl(this._firebaseDataSource);

  @override
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getUpcomingEvents({
    int? limit,
    String? lastEventId,
  }) async {
    try {
      final events = await _firebaseDataSource.getUpcomingEvents(
        limit: limit,
        lastEventId: lastEventId,
      );
      return right(events);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> searchEvents({
    required EventSearchFilters filters,
    int? limit,
  }) async {
    try {
      final events = await _firebaseDataSource.searchEvents(
        filters: filters,
        limit: limit,
      );
      return right(events);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getEventsByCategory({
    required EventCategory category,
    int? limit,
  }) async {
    try {
      final events = await _firebaseDataSource.getEventsByCategory(
        category: category,
        limit: limit,
      );
      return right(events);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, EventDiscoveryEntity>> getEventDetails({
    required String eventId,
    String? userId,
  }) async {
    try {
      final event = await _firebaseDataSource.getEventDetails(
        eventId: eventId,
        userId: userId,
      );
      return right(event);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getFeaturedEvents({
    int? limit,
  }) async {
    try {
      final events = await _firebaseDataSource.getFeaturedEvents(
        limit: limit,
      );
      return right(events);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getNearbyEvents({
    required double latitude,
    required double longitude,
    double? radiusKm,
    int? limit,
  }) async {
    try {
      final events = await _firebaseDataSource.getNearbyEvents(
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
        limit: limit,
      );
      return right(events);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, bool>> toggleEventFavorite({
    required String userId,
    required String eventId,
  }) async {
    try {
      final isFavorited = await _firebaseDataSource.toggleEventFavorite(
        userId: userId,
        eventId: eventId,
      );
      return right(isFavorited);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventDiscoveryEntity>>> getFavoriteEvents({
    required String userId,
  }) async {
    try {
      final events = await _firebaseDataSource.getFavoriteEvents(
        userId: userId,
      );
      return right(events);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Stream<Either<NetworkExceptions, List<EventDiscoveryEntity>>> watchUpcomingEvents() {
    try {
      return _firebaseDataSource
          .watchUpcomingEvents()
          .map((events) => right<NetworkExceptions, List<EventDiscoveryEntity>>(events))
          .handleError((error) {
        return Stream.value(left<NetworkExceptions, List<EventDiscoveryEntity>>(
          NetworkExceptions.getDioException(error),
        ));
      });
    } catch (e) {
      return Stream.value(left<NetworkExceptions, List<EventDiscoveryEntity>>(
        NetworkExceptions.getDioException(e),
      ));
    }
  }
}