import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/repositories/event_repository.dart';
import 'package:eventhub/features/organizer/event_management/infrastructure/datasources/firebase_event_data_source.dart';

@Injectable(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final FirebaseEventDataSource _firebaseDataSource;

  EventRepositoryImpl(this._firebaseDataSource);

  @override
  Future<Either<NetworkExceptions, EventEntity>> createEvent({
    required String organizerId,
    required CreateEventRequest request,
  }) async {
    try {
      final event = await _firebaseDataSource.createEvent(
        organizerId: organizerId,
        request: request,
      );
      return right(event);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, EventEntity>> getEventById(String eventId) async {
    try {
      final event = await _firebaseDataSource.getEventById(eventId);
      return right(event);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventEntity>>> getOrganizerEvents({
    required String organizerId,
    EventStatus? status,
    int? limit,
    String? lastEventId,
  }) async {
    try {
      final events = await _firebaseDataSource.getOrganizerEvents(
        organizerId: organizerId,
        status: status,
        limit: limit,
        lastEventId: lastEventId,
      );
      return right(events);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, EventEntity>> updateEvent({
    required String eventId,
    required String organizerId,
    required UpdateEventRequest request,
  }) async {
    try {
      final event = await _firebaseDataSource.updateEvent(
        eventId: eventId,
        organizerId: organizerId,
        request: request,
      );
      return right(event);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, Unit>> deleteEvent({
    required String eventId,
    required String organizerId,
  }) async {
    try {
      await _firebaseDataSource.deleteEvent(
        eventId: eventId,
        organizerId: organizerId,
      );
      return right(unit);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, EventEntity>> cancelEvent({
    required String eventId,
    required String organizerId,
    required String cancellationReason,
  }) async {
    try {
      final event = await _firebaseDataSource.cancelEvent(
        eventId: eventId,
        organizerId: organizerId,
        cancellationReason: cancellationReason,
      );
      return right(event);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> uploadEventBanner({
    required String eventId,
    required String imagePath,
  }) async {
    try {
      final bannerUrl = await _firebaseDataSource.uploadEventBanner(
        eventId: eventId,
        imagePath: imagePath,
      );
      return right(bannerUrl);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, Unit>> deleteEventBanner({
    required String eventId,
    required String bannerUrl,
  }) async {
    try {
      await _firebaseDataSource.deleteEventBanner(
        eventId: eventId,
        bannerUrl: bannerUrl,
      );
      return right(unit);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventEntity>>> getEventsByStatus({
    required String organizerId,
    required EventStatus status,
    int? limit,
  }) async {
    try {
      final events = await _firebaseDataSource.getEventsByStatus(
        organizerId: organizerId,
        status: status,
        limit: limit,
      );
      return right(events);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<EventEntity>>> searchEvents({
    required String organizerId,
    required String query,
    EventStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    try {
      final events = await _firebaseDataSource.searchEvents(
        organizerId: organizerId,
        query: query,
        status: status,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
      );
      return right(events);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, EventEntity>> duplicateEvent({
    required String eventId,
    required String organizerId,
    required String newTitle,
    required DateTime newDateTime,
  }) async {
    try {
      final event = await _firebaseDataSource.duplicateEvent(
        eventId: eventId,
        organizerId: organizerId,
        newTitle: newTitle,
        newDateTime: newDateTime,
      );
      return right(event);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, EventStatistics>> getEventStatistics({
    required String eventId,
    required String organizerId,
  }) async {
    try {
      final statistics = await _firebaseDataSource.getEventStatistics(
        eventId: eventId,
        organizerId: organizerId,
      );
      return right(statistics);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Stream<Either<NetworkExceptions, EventEntity>> watchEvent(String eventId) {
    return _firebaseDataSource.watchEvent(eventId)
        .map<Either<NetworkExceptions, EventEntity>>((event) => right(event))
        .handleError((error) {
      if (error is FirebaseException) {
        return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(error)));
      }
      return left(NetworkExceptions.defaultError(error.toString()));
    });
  }

  @override
  Stream<Either<NetworkExceptions, List<EventEntity>>> watchOrganizerEvents({
    required String organizerId,
    EventStatus? status,
  }) {
    return _firebaseDataSource.watchOrganizerEvents(
      organizerId: organizerId,
      status: status,
    )
        .map<Either<NetworkExceptions, List<EventEntity>>>((events) => right(events))
        .handleError((error) {
      if (error is FirebaseException) {
        return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(error)));
      }
      return left(NetworkExceptions.defaultError(error.toString()));
    });
  }

  String _getFirebaseErrorMessage(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'not-found':
      case 'event-not-found':
        return 'Event not found.';
      case 'already-exists':
        return 'Event already exists.';
      case 'invalid-argument':
        return 'Invalid data provided.';
      case 'failed-precondition':
        return 'Operation failed due to current state.';
      case 'aborted':
        return 'Operation was aborted due to a conflict.';
      case 'out-of-range':
        return 'Operation was attempted past the valid range.';
      case 'unimplemented':
        return 'Operation is not implemented or supported.';
      case 'internal':
        return 'Internal server error occurred.';
      case 'unavailable':
        return 'Service is currently unavailable. Please try again later.';
      case 'data-loss':
        return 'Unrecoverable data loss or corruption.';
      case 'unauthenticated':
        return 'Authentication required to perform this action.';
      case 'deadline-exceeded':
        return 'Operation timed out. Please try again.';
      case 'resource-exhausted':
        return 'Resource quota exceeded. Please try again later.';
      case 'cancelled':
        return 'Operation was cancelled.';
      case 'unknown':
        return 'An unknown error occurred.';
      
      // Firebase Storage specific errors
      case 'storage/object-not-found':
      case 'object-not-found':
        return 'File not found.';
      case 'storage/bucket-not-found':
        return 'Storage bucket not found.';
      case 'storage/project-not-found':
        return 'Storage project not found.';
      case 'storage/quota-exceeded':
        return 'Storage quota exceeded.';
      case 'storage/unauthenticated':
        return 'Authentication required for file operations.';
      case 'storage/unauthorized':
        return 'Not authorized to perform file operations.';
      case 'storage/retry-limit-exceeded':
        return 'Maximum retry time exceeded. Please try again.';
      case 'storage/invalid-checksum':
        return 'File upload failed due to checksum mismatch.';
      case 'storage/canceled':
        return 'File operation was cancelled.';
      case 'storage/invalid-event-name':
        return 'Invalid event name provided.';
      case 'storage/invalid-url':
        return 'Invalid file URL provided.';
      case 'storage/invalid-argument':
        return 'Invalid argument provided for file operation.';
      case 'storage/no-default-bucket':
        return 'No default storage bucket configured.';
      case 'storage/cannot-slice-blob':
        return 'File processing error occurred.';
      case 'storage/server-file-wrong-size':
        return 'File size mismatch on server.';
      
      // Custom event-specific errors
      case 'file-not-found':
        return 'Selected file not found.';
      case 'invalid-ticket-type':
        return 'Invalid ticket type configuration.';
      case 'event-not-editable':
        return 'This event cannot be edited in its current state.';
      case 'event-already-cancelled':
        return 'Event is already cancelled.';
      case 'tickets-already-sold':
        return 'Cannot modify event with sold tickets.';
      case 'invalid-event-date':
        return 'Event date must be in the future.';
      case 'capacity-exceeded':
        return 'Event capacity cannot exceed maximum limit.';
      case 'invalid-capacity':
        return 'Event capacity must be greater than sold tickets.';
      
      default:
        return e.message ?? 'An unexpected error occurred. Please try again.';
    }
  }
}