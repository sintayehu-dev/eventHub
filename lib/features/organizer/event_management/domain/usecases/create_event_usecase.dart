import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/repositories/event_repository.dart';

class CreateEventUseCase {
  final EventRepository repository;

  CreateEventUseCase(this.repository);

  Future<Either<NetworkExceptions, EventEntity>> call(CreateEventParams params) async {
    // Validate the request data
    final validationResult = _validateCreateEventRequest(params.request);
    if (validationResult.isLeft()) {
      return left(validationResult.fold((error) => error, (r) => throw Exception()));
    }

    // Create the event
    return await repository.createEvent(
      organizerId: params.organizerId,
      request: params.request,
    );
  }

  Either<NetworkExceptions, Unit> _validateCreateEventRequest(CreateEventRequest request) {
    // Validate title
    if (!request.title.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate description
    if (!request.description.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate location
    if (!request.location.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate capacity
    if (!request.maxCapacity.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate date is in the future
    if (request.dateTime.isBefore(DateTime.now())) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate ticket types
    if (request.ticketTypes.isEmpty) {
      return left(const NetworkExceptions.badRequest());
    }

    for (final ticketType in request.ticketTypes) {
      if (!ticketType.name.isValid()) {
        return left(const NetworkExceptions.badRequest());
      }
      if (!ticketType.price.isValid()) {
        return left(const NetworkExceptions.badRequest());
      }
      if (!ticketType.quantity.isValid()) {
        return left(const NetworkExceptions.badRequest());
      }
    }

    return right(unit);
  }
}

class CreateEventParams {
  final UniqueId organizerId;
  final CreateEventRequest request;

  CreateEventParams({
    required this.organizerId,
    required this.request,
  });
}

class GetEventByIdUseCase {
  final EventRepository repository;

  GetEventByIdUseCase(this.repository);

  Future<Either<NetworkExceptions, EventEntity>> call(GetEventByIdParams params) async {
    return await repository.getEventById(params.eventId);
  }
}

class GetEventByIdParams {
  final UniqueId eventId;

  GetEventByIdParams({required this.eventId});
}

class GetOrganizerEventsUseCase {
  final EventRepository repository;

  GetOrganizerEventsUseCase(this.repository);

  Future<Either<NetworkExceptions, List<EventEntity>>> call(GetOrganizerEventsParams params) async {
    return await repository.getOrganizerEvents(
      organizerId: params.organizerId,
      status: params.status,
      limit: params.limit,
      lastEventId: params.lastEventId,
    );
  }
}

class GetOrganizerEventsParams {
  final UniqueId organizerId;
  final EventStatus? status;
  final int? limit;
  final UniqueId? lastEventId;

  GetOrganizerEventsParams({
    required this.organizerId,
    this.status,
    this.limit,
    this.lastEventId,
  });
}

class UpdateEventUseCase {
  final EventRepository repository;

  UpdateEventUseCase(this.repository);

  Future<Either<NetworkExceptions, EventEntity>> call(UpdateEventParams params) async {
    // Validate the request data
    final validationResult = _validateUpdateEventRequest(params.request);
    if (validationResult.isLeft()) {
      return left(validationResult.fold((error) => error, (r) => throw Exception()));
    }

    return await repository.updateEvent(
      eventId: params.eventId,
      organizerId: params.organizerId,
      request: params.request,
    );
  }

  Either<NetworkExceptions, Unit> _validateUpdateEventRequest(UpdateEventRequest request) {
    // Validate title if provided
    if (request.title != null && !request.title!.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate description if provided
    if (request.description != null && !request.description!.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate location if provided
    if (request.location != null && !request.location!.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate capacity if provided
    if (request.maxCapacity != null && !request.maxCapacity!.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate date is in the future if provided
    if (request.dateTime != null && request.dateTime!.isBefore(DateTime.now())) {
      return left(const NetworkExceptions.badRequest());
    }

    // Validate ticket types if provided
    if (request.ticketTypes != null) {
      for (final ticketType in request.ticketTypes!) {
        if (ticketType.name != null && !ticketType.name!.isValid()) {
          return left(const NetworkExceptions.badRequest());
        }
        if (ticketType.price != null && !ticketType.price!.isValid()) {
          return left(const NetworkExceptions.badRequest());
        }
        if (ticketType.quantity != null && !ticketType.quantity!.isValid()) {
          return left(const NetworkExceptions.badRequest());
        }
      }
    }

    return right(unit);
  }
}

class UpdateEventParams {
  final UniqueId eventId;
  final UniqueId organizerId;
  final UpdateEventRequest request;

  UpdateEventParams({
    required this.eventId,
    required this.organizerId,
    required this.request,
  });
}

class DeleteEventUseCase {
  final EventRepository repository;

  DeleteEventUseCase(this.repository);

  Future<Either<NetworkExceptions, Unit>> call(DeleteEventParams params) async {
    return await repository.deleteEvent(
      eventId: params.eventId,
      organizerId: params.organizerId,
    );
  }
}

class DeleteEventParams {
  final UniqueId eventId;
  final UniqueId organizerId;

  DeleteEventParams({
    required this.eventId,
    required this.organizerId,
  });
}

class CancelEventUseCase {
  final EventRepository repository;

  CancelEventUseCase(this.repository);

  Future<Either<NetworkExceptions, EventEntity>> call(CancelEventParams params) async {
    if (params.cancellationReason.trim().isEmpty) {
      return left(const NetworkExceptions.badRequest());
    }

    return await repository.cancelEvent(
      eventId: params.eventId,
      organizerId: params.organizerId,
      cancellationReason: params.cancellationReason,
    );
  }
}

class CancelEventParams {
  final UniqueId eventId;
  final UniqueId organizerId;
  final String cancellationReason;

  CancelEventParams({
    required this.eventId,
    required this.organizerId,
    required this.cancellationReason,
  });
}

class GetEventStatisticsUseCase {
  final EventRepository repository;

  GetEventStatisticsUseCase(this.repository);

  Future<Either<NetworkExceptions, EventStatistics>> call(GetEventStatisticsParams params) async {
    return await repository.getEventStatistics(
      eventId: params.eventId,
      organizerId: params.organizerId,
    );
  }
}

class GetEventStatisticsParams {
  final UniqueId eventId;
  final UniqueId organizerId;

  GetEventStatisticsParams({
    required this.eventId,
    required this.organizerId,
  });
}