import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/services/cloudinary_service.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';

abstract class FirebaseEventDataSource {
  Future<EventEntity> createEvent({
    required String organizerId,
    required CreateEventRequest request,
  });

  Future<EventEntity> getEventById(String eventId);

  Future<List<EventEntity>> getOrganizerEvents({
    required String organizerId,
    EventStatus? status,
    int? limit,
    String? lastEventId,
  });

  Future<EventEntity> updateEvent({
    required String eventId,
    required String organizerId,
    required UpdateEventRequest request,
  });

  Future<void> deleteEvent({
    required String eventId,
    required String organizerId,
  });

  Future<EventEntity> cancelEvent({
    required String eventId,
    required String organizerId,
    required String cancellationReason,
  });

  Future<String> uploadEventBanner({
    required String eventId,
    required String imagePath,
  });

  Future<void> deleteEventBanner({
    required String eventId,
    required String bannerUrl,
  });

  Future<List<EventEntity>> getEventsByStatus({
    required String organizerId,
    required EventStatus status,
    int? limit,
  });

  Future<List<EventEntity>> searchEvents({
    required String organizerId,
    required String query,
    EventStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  });

  Future<EventEntity> duplicateEvent({
    required String eventId,
    required String organizerId,
    required String newTitle,
    required DateTime newDateTime,
  });

  Future<EventStatistics> getEventStatistics({
    required String eventId,
    required String organizerId,
  });

  Stream<EventEntity> watchEvent(String eventId);

  Stream<List<EventEntity>> watchOrganizerEvents({
    required String organizerId,
    EventStatus? status,
  });
}

@Injectable(as: FirebaseEventDataSource)
class FirebaseEventDataSourceImpl implements FirebaseEventDataSource {
  final FirebaseFirestore _firestore;
  final CloudinaryService _cloudinaryService;
  final Random _random = Random();

  FirebaseEventDataSourceImpl(this._firestore, this._cloudinaryService);

  static const String _eventsCollection = 'events';

  /// Generate a simple unique ID using timestamp and random number
  String _generateId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = _random.nextInt(999999);
    return '${timestamp}_$randomNum';
  }

  @override
  Future<EventEntity> createEvent({
    required String organizerId,
    required CreateEventRequest request,
  }) async {
    try {
      final eventId = _generateId();
      final now = DateTime.now();
      
      // Upload banner to Cloudinary if provided
      String? bannerUrl;
      if (request.bannerImagePath != null) {
        try {
          bannerUrl = await uploadEventBanner(
            eventId: eventId,
            imagePath: request.bannerImagePath!,
          );
        } catch (e) {
          print('Cloudinary: Upload failed, continuing without banner: $e');
          // Continue without banner - don't fail the entire event creation
          bannerUrl = null;
        }
      }

      // Create ticket types with IDs
      final ticketTypes = request.ticketTypes.map((ticketType) {
        return TicketTypeEntity(
          id: _generateId(),
          name: ticketType.name,
          description: ticketType.description,
          price: ticketType.price,
          quantity: ticketType.quantity,
          availableQuantity: ticketType.quantity,
          isActive: true,
          saleStartDate: ticketType.saleStartDate,
          saleEndDate: ticketType.saleEndDate,
          metadata: ticketType.metadata,
        );
      }).toList();

      final event = EventEntity(
        id: eventId,
        organizerId: organizerId,
        title: request.title,
        description: request.description,
        bannerUrl: bannerUrl,
        location: request.location,
        dateTime: request.dateTime,
        category: request.category,
        ticketTypes: ticketTypes,
        maxCapacity: request.maxCapacity,
        status: EventStatus.active,
        createdAt: now,
        updatedAt: now,
        metadata: request.metadata,
      );

      await _firestore
          .collection(_eventsCollection)
          .doc(eventId)
          .set(event.toFirestoreData());

      return event;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to create event: $e',
      );
    }
  }

  @override
  Future<EventEntity> getEventById(String eventId) async {
    try {
      final doc = await _firestore
          .collection(_eventsCollection)
          .doc(eventId)
          .get();

      if (!doc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Event not found',
        );
      }

      return EventEntity.fromFirestoreData(doc.data()!);
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get event: $e',
      );
    }
  }
  @override
  Future<List<EventEntity>> getOrganizerEvents({
    required String organizerId,
    EventStatus? status,
    int? limit,
    String? lastEventId,
  }) async {
    try {
      Query query = _firestore
          .collection(_eventsCollection)
          .where('organizerId', isEqualTo: organizerId);

      // For now, let's not order by createdAt to avoid index requirement
      // We'll sort in memory instead
      if (limit != null) {
        query = query.limit(limit * 2); // Get more to account for filtering
      }

      if (lastEventId != null) {
        final lastDoc = await _firestore
            .collection(_eventsCollection)
            .doc(lastEventId)
            .get();
        if (lastDoc.exists) {
          query = query.startAfterDocument(lastDoc);
        }
      }

      final querySnapshot = await query.get();
      var events = querySnapshot.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data() as Map<String, dynamic>))
          .toList();

      // Filter by status in memory if specified
      if (status != null) {
        events = events.where((event) => event.status == status).toList();
      }

      // Sort by createdAt in memory
      events.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      // Apply limit after filtering and sorting
      if (limit != null && events.length > limit) {
        events = events.take(limit).toList();
      }

      return events;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get organizer events: $e',
      );
    }
  }

  @override
  Future<EventEntity> updateEvent({
    required String eventId,
    required String organizerId,
    required UpdateEventRequest request,
  }) async {
    try {
      final eventRef = _firestore
          .collection(_eventsCollection)
          .doc(eventId);

      // Get current event to verify ownership
      final currentDoc = await eventRef.get();
      if (!currentDoc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Event not found',
        );
      }

      final currentEvent = EventEntity.fromFirestoreData(currentDoc.data()!);
      if (currentEvent.organizerId != organizerId) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Unauthorized: Not the event organizer',
        );
      }

      // Handle banner upload if provided
      String? bannerUrl = currentEvent.bannerUrl;
      if (request.bannerImagePath != null) {
        // Delete old banner if exists
        if (bannerUrl != null) {
          await deleteEventBanner(eventId: eventId, bannerUrl: bannerUrl);
        }
        // Upload new banner
        bannerUrl = await uploadEventBanner(
          eventId: eventId,
          imagePath: request.bannerImagePath!,
        );
      }

      // Update ticket types if provided
      List<TicketTypeEntity> updatedTicketTypes = currentEvent.ticketTypes;
      if (request.ticketTypes != null) {
        updatedTicketTypes = request.ticketTypes!.map((updateRequest) {
          final existingTicketType = currentEvent.ticketTypes
              .firstWhere((t) => t.id == updateRequest.id);
          
          return existingTicketType.copyWith(
            name: updateRequest.name ?? existingTicketType.name,
            description: updateRequest.description ?? existingTicketType.description,
            price: updateRequest.price ?? existingTicketType.price,
            quantity: updateRequest.quantity ?? existingTicketType.quantity,
            isActive: updateRequest.isActive ?? existingTicketType.isActive,
            saleStartDate: updateRequest.saleStartDate ?? existingTicketType.saleStartDate,
            saleEndDate: updateRequest.saleEndDate ?? existingTicketType.saleEndDate,
            metadata: updateRequest.metadata ?? existingTicketType.metadata,
          );
        }).toList();
      }

      final updatedEvent = currentEvent.copyWith(
        title: request.title ?? currentEvent.title,
        description: request.description ?? currentEvent.description,
        bannerUrl: bannerUrl,
        location: request.location ?? currentEvent.location,
        dateTime: request.dateTime ?? currentEvent.dateTime,
        category: request.category ?? currentEvent.category,
        ticketTypes: updatedTicketTypes,
        maxCapacity: request.maxCapacity ?? currentEvent.maxCapacity,
        status: request.status ?? currentEvent.status,
        cancellationReason: request.cancellationReason ?? currentEvent.cancellationReason,
        metadata: request.metadata ?? currentEvent.metadata,
        updatedAt: DateTime.now(),
      );

      await eventRef.update(updatedEvent.toFirestoreData());
      return updatedEvent;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to update event: $e',
      );
    }
  }

  @override
  Future<void> deleteEvent({
    required String eventId,
    required String organizerId,
  }) async {
    try {
      final eventRef = _firestore
          .collection(_eventsCollection)
          .doc(eventId);

      // Verify ownership before deletion
      final doc = await eventRef.get();
      if (!doc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Event not found',
        );
      }

      final event = EventEntity.fromFirestoreData(doc.data()!);
      if (event.organizerId != organizerId) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Unauthorized: Not the event organizer',
        );
      }

      // Delete banner if exists
      if (event.bannerUrl != null) {
        await deleteEventBanner(eventId: eventId, bannerUrl: event.bannerUrl!);
      }

      await eventRef.delete();
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to delete event: $e',
      );
    }
  }

  @override
  Future<EventEntity> cancelEvent({
    required String eventId,
    required String organizerId,
    required String cancellationReason,
  }) async {
    try {
      final updateRequest = UpdateEventRequest(
        status: EventStatus.cancelled,
        cancellationReason: cancellationReason,
      );

      return await updateEvent(
        eventId: eventId,
        organizerId: organizerId,
        request: updateRequest,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to cancel event: $e',
      );
    }
  }

  @override
  Future<String> uploadEventBanner({
    required String eventId,
    required String imagePath,
  }) async {
    try {
      print('Cloudinary: Starting upload for eventId: $eventId');
      print('Cloudinary: Image path: $imagePath');
      
      // Upload to Cloudinary
      final bannerUrl = await _cloudinaryService.uploadImage(
        imagePath: imagePath,
        folder: 'eventhub/event_banners',
        publicId: 'event_$eventId',
      );
      
      print('Cloudinary: Upload successful: $bannerUrl');
      return bannerUrl;
    } catch (e) {
      print('Cloudinary: Upload failed: $e');
      throw Exception('Failed to upload event banner: $e');
    }
  }

  @override
  Future<void> deleteEventBanner({
    required String eventId,
    required String bannerUrl,
  }) async {
    try {
      final publicId = _cloudinaryService.extractPublicId(bannerUrl);
      if (publicId != null) {
        await _cloudinaryService.deleteImage(publicId);
        print('Cloudinary: Banner deleted successfully');
      }
    } catch (e) {
      // Log error but don't throw - banner deletion is not critical
      print('Cloudinary: Failed to delete banner: $e');
    }
  }

  @override
  Future<List<EventEntity>> getEventsByStatus({
    required String organizerId,
    required EventStatus status,
    int? limit,
  }) async {
    return getOrganizerEvents(
      organizerId: organizerId,
      status: status,
      limit: limit,
    );
  }

  @override
  Future<List<EventEntity>> searchEvents({
    required String organizerId,
    required String query,
    EventStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    try {
      Query firestoreQuery = _firestore
          .collection(_eventsCollection)
          .where('organizerId', isEqualTo: organizerId);

      if (status != null) {
        firestoreQuery = firestoreQuery.where('status', isEqualTo: status.name);
      }

      if (startDate != null) {
        firestoreQuery = firestoreQuery.where('dateTime', isGreaterThanOrEqualTo: startDate);
      }

      if (endDate != null) {
        firestoreQuery = firestoreQuery.where('dateTime', isLessThanOrEqualTo: endDate);
      }

      if (limit != null) {
        firestoreQuery = firestoreQuery.limit(limit);
      }

      final querySnapshot = await firestoreQuery.get();
      final events = querySnapshot.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data() as Map<String, dynamic>))
          .toList();

      // Filter by title/description containing query (Firestore doesn't support full-text search)
      final filteredEvents = events.where((event) {
        final titleMatch = event.title.toLowerCase().contains(query.toLowerCase());
        final descriptionMatch = event.description.toLowerCase().contains(query.toLowerCase());
        return titleMatch || descriptionMatch;
      }).toList();

      return filteredEvents;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to search events: $e',
      );
    }
  }

  @override
  Future<EventEntity> duplicateEvent({
    required String eventId,
    required String organizerId,
    required String newTitle,
    required DateTime newDateTime,
  }) async {
    try {
      final originalEvent = await getEventById(eventId);
      
      // Verify ownership
      if (originalEvent.organizerId != organizerId) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Unauthorized: Not the event organizer',
        );
      }

      final createRequest = CreateEventRequest(
        title: newTitle,
        description: originalEvent.description,
        location: originalEvent.location,
        dateTime: newDateTime,
        category: originalEvent.category,
        ticketTypes: originalEvent.ticketTypes.map((ticketType) {
          return CreateTicketTypeRequest(
            name: ticketType.name,
            description: ticketType.description,
            price: ticketType.price,
            quantity: ticketType.quantity,
            saleStartDate: ticketType.saleStartDate,
            saleEndDate: ticketType.saleEndDate,
            metadata: ticketType.metadata,
          );
        }).toList(),
        maxCapacity: originalEvent.maxCapacity,
        metadata: originalEvent.metadata,
      );

      return await createEvent(
        organizerId: organizerId,
        request: createRequest,
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to duplicate event: $e',
      );
    }
  }

  @override
  Future<EventStatistics> getEventStatistics({
    required String eventId,
    required String organizerId,
  }) async {
    try {
      final event = await getEventById(eventId);
      
      // Verify ownership
      if (event.organizerId != organizerId) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Unauthorized: Not the event organizer',
        );
      }

      // Calculate statistics from ticket types
      final totalTickets = event.ticketTypes.fold<int>(
        0,
        (sum, ticketType) => sum + ticketType.quantity,
      );

      final soldTickets = event.ticketTypes.fold<int>(
        0,
        (sum, ticketType) => sum + (ticketType.quantity - ticketType.availableQuantity),
      );

      final totalRevenue = event.ticketTypes.fold<double>(
        0.0,
        (sum, ticketType) {
          final sold = ticketType.quantity - ticketType.availableQuantity;
          return sum + (sold * ticketType.price);
        },
      );

      // Calculate ticket types sold map
      final ticketTypesSold = <String, int>{};
      final revenueByTicketType = <String, double>{};
      
      for (final ticketType in event.ticketTypes) {
        final sold = ticketType.quantity - ticketType.availableQuantity;
        final typeName = ticketType.name;
        ticketTypesSold[typeName] = sold;
        revenueByTicketType[typeName] = sold * ticketType.price;
      }

      return EventStatistics(
        eventId: eventId,
        totalTickets: totalTickets,
        soldTickets: soldTickets,
        availableTickets: totalTickets - soldTickets,
        totalRevenue: totalRevenue,
        targetRevenue: totalRevenue * 1.2, // Assume target is 20% higher than current
        checkedInCount: 0, // This would come from a separate attendance tracking system
        conversionRate: totalTickets > 0 ? soldTickets / totalTickets : 0.0,
        ticketTypesSold: ticketTypesSold,
        revenueByTicketType: revenueByTicketType,
        lastUpdated: DateTime.now(),
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get event statistics: $e',
      );
    }
  }

  @override
  Stream<EventEntity> watchEvent(String eventId) {
    return _firestore
        .collection(_eventsCollection)
        .doc(eventId)
        .snapshots()
        .map((doc) {
      if (!doc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Event not found',
        );
      }
      return EventEntity.fromFirestoreData(doc.data()!);
    });
  }

  @override
  Stream<List<EventEntity>> watchOrganizerEvents({
    required String organizerId,
    EventStatus? status,
  }) {
    Query query = _firestore
        .collection(_eventsCollection)
        .where('organizerId', isEqualTo: organizerId);

    // Don't add orderBy to avoid index requirement for now
    // if (status != null) {
    //   query = query.where('status', isEqualTo: status.name);
    // }

    return query.snapshots().map((querySnapshot) {
      var events = querySnapshot.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data() as Map<String, dynamic>))
          .toList();

      // Filter by status in memory if specified
      if (status != null) {
        events = events.where((event) => event.status == status).toList();
      }

      // Sort by createdAt in memory
      events.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return events;
    });
  }
}