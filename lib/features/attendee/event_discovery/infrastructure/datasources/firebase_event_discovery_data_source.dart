import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

abstract class FirebaseEventDiscoveryDataSource {
  Future<List<EventDiscoveryEntity>> getUpcomingEvents({
    int? limit,
    String? lastEventId,
  });

  Future<List<EventDiscoveryEntity>> searchEvents({
    required EventSearchFilters filters,
    int? limit,
  });

  Future<List<EventDiscoveryEntity>> getEventsByCategory({
    required EventCategory category,
    int? limit,
  });

  Future<EventDiscoveryEntity> getEventDetails({
    required String eventId,
    String? userId,
  });

  Future<List<EventDiscoveryEntity>> getFeaturedEvents({
    int? limit,
  });

  Future<List<EventDiscoveryEntity>> getNearbyEvents({
    required double latitude,
    required double longitude,
    double? radiusKm,
    int? limit,
  });

  Future<bool> toggleEventFavorite({
    required String userId,
    required String eventId,
  });

  Future<List<EventDiscoveryEntity>> getFavoriteEvents({
    required String userId,
  });

  Stream<List<EventDiscoveryEntity>> watchUpcomingEvents();
}

@Injectable(as: FirebaseEventDiscoveryDataSource)
class FirebaseEventDiscoveryDataSourceImpl implements FirebaseEventDiscoveryDataSource {
  final FirebaseFirestore _firestore;
  
  // Cache for organizer names to avoid repeated database calls
  final Map<String, String> _organizerNameCache = {};

  FirebaseEventDiscoveryDataSourceImpl(this._firestore);

  static const String _eventsCollection = 'events';
  static const String _favoritesCollection = 'user_favorites';
  static const String _organizersCollection = 'users'; // Assuming organizers are in users collection

  @override
  Future<List<EventDiscoveryEntity>> getUpcomingEvents({
    int? limit,
    String? lastEventId,
  }) async {
    try {
      // Get all active events (simple query to avoid index requirements)
      Query query = _firestore
          .collection(_eventsCollection)
          .where('status', isEqualTo: EventStatus.active.name);

      if (limit != null) {
        query = query.limit(limit * 2); // Get more to account for filtering
      }

      final querySnapshot = await query.get();
      
      print(
          '🔍 DEBUG: Found ${querySnapshot.docs.length} active events in Firestore');
      
      // Parse events with error handling
      final allEvents = <EventDiscoveryEntity>[];
      int parseErrorCount = 0;
      
      for (final doc in querySnapshot.docs) {
        try {
          final data = doc.data() as Map<String, dynamic>;
          print('📄 DEBUG: Processing event ${doc.id}: ${data['title']}');
          
          // Add document ID if missing
          if (!data.containsKey('id')) {
            data['id'] = doc.id;
          }
          
          // Convert EventEntity data to EventDiscoveryEntity format if needed
          final discoveryData = await _convertEventDataToDiscoveryData(data);
          final event = EventDiscoveryEntity.fromFirestoreData(discoveryData);
          allEvents.add(event);
          print('✅ DEBUG: Successfully parsed event ${doc.id}');
        } catch (e, stackTrace) {
          // Skip malformed documents and continue
          parseErrorCount++;
          print('❌ ERROR parsing event document ${doc.id}: $e');
          print('Stack trace: $stackTrace');
          continue;
        }
      }

      print(
          '📊 DEBUG: Successfully parsed ${allEvents.length} events, ${parseErrorCount} errors');

      // Filter upcoming events in memory
      final now = DateTime.now();
      final upcomingEvents = allEvents.where((event) {
        final isUpcoming = event.dateTime.isAfter(now);
        print(
            '📅 DEBUG: Event "${event.title}" - Date: ${event.dateTime}, IsUpcoming: $isUpcoming');
        return isUpcoming;
      }).toList();

      print(
          '🎯 DEBUG: Found ${upcomingEvents.length} upcoming events after filtering');

      // Sort by date (earliest first)
      upcomingEvents.sort((a, b) => a.dateTime.compareTo(b.dateTime));

      // Apply limit after filtering and sorting
      final limitedEvents = limit != null && upcomingEvents.length > limit
          ? upcomingEvents.take(limit).toList()
          : upcomingEvents;

      print('✨ DEBUG: Returning ${limitedEvents.length} events');
      return limitedEvents;
    } catch (e, stackTrace) {
      print('❌ ERROR in getUpcomingEvents: $e');
      print('Stack trace: $stackTrace');
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get upcoming events: $e',
      );
    }
  }

  @override
  Future<List<EventDiscoveryEntity>> searchEvents({
    required EventSearchFilters filters,
    int? limit,
  }) async {
    try {
      // Start with basic query
      Query query = _firestore
          .collection(_eventsCollection)
          .where('status', isEqualTo: EventStatus.active.name);

      // Add category filter if specified
      if (filters.category != null) {
        query = query.where('category', isEqualTo: filters.category!.name);
      }

      final querySnapshot = await query.get();
      
      // Parse events with error handling
      final allEvents = <EventDiscoveryEntity>[];
      for (final doc in querySnapshot.docs) {
        try {
          final data = doc.data() as Map<String, dynamic>;
          if (!data.containsKey('id')) {
            data['id'] = doc.id;
          }
          
          final discoveryData = await _convertEventDataToDiscoveryData(data);
          final event = EventDiscoveryEntity.fromFirestoreData(discoveryData);
          allEvents.add(event);
        } catch (e) {
          print('Error parsing event document ${doc.id}: $e');
          continue;
        }
      }

      // Apply filters in memory
      var filteredEvents = _applyFiltersInMemory(allEvents, filters);

      // Apply sorting
      filteredEvents = _applySorting(filteredEvents, filters.sortBy ?? EventSortBy.date);

      // Apply limit
      if (limit != null && filteredEvents.length > limit) {
        filteredEvents = filteredEvents.take(limit).toList();
      }

      return filteredEvents;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to search events: $e',
      );
    }
  }

  @override
  Future<List<EventDiscoveryEntity>> getEventsByCategory({
    required EventCategory category,
    int? limit,
  }) async {
    try {
      Query query = _firestore
          .collection(_eventsCollection)
          .where('status', isEqualTo: EventStatus.active.name)
          .where('category', isEqualTo: category.name);

      if (limit != null) {
        query = query.limit(limit);
      }

      final querySnapshot = await query.get();
      
      // Parse events with error handling
      final allEvents = <EventDiscoveryEntity>[];
      for (final doc in querySnapshot.docs) {
        try {
          final data = doc.data() as Map<String, dynamic>;
          if (!data.containsKey('id')) {
            data['id'] = doc.id;
          }
          
          final discoveryData = await _convertEventDataToDiscoveryData(data);
          final event = EventDiscoveryEntity.fromFirestoreData(discoveryData);
          allEvents.add(event);
        } catch (e) {
          print('Error parsing event document ${doc.id}: $e');
          continue;
        }
      }

      // Filter upcoming events and sort by date
      final now = DateTime.now();
      final upcomingEvents = allEvents.where((event) {
        return event.dateTime.isAfter(now);
      }).toList();

      upcomingEvents.sort((a, b) => a.dateTime.compareTo(b.dateTime));

      return upcomingEvents;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get events by category: $e',
      );
    }
  }

  @override
  Future<EventDiscoveryEntity> getEventDetails({
    required String eventId,
    String? userId,
  }) async {
    try {
      final eventDoc = await _firestore
          .collection(_eventsCollection)
          .doc(eventId)
          .get();

      if (!eventDoc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Event not found',
        );
      }

      final data = eventDoc.data()!;
      if (!data.containsKey('id')) {
        data['id'] = eventId;
      }
      
      // Convert to discovery data format
      final discoveryData = await _convertEventDataToDiscoveryData(data);
      
      // Check if favorited by user
      if (userId != null) {
        discoveryData['isFavorite'] = await _isEventFavorited(userId, eventId);
      }

      return EventDiscoveryEntity.fromFirestoreData(discoveryData);
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get event details: $e',
      );
    }
  }

  @override
  Future<List<EventDiscoveryEntity>> getFeaturedEvents({
    int? limit,
  }) async {
    try {
      // For MVP, featured events are events with high ticket sales or recent events
      final query = _firestore
          .collection(_eventsCollection)
          .where('status', isEqualTo: EventStatus.active.name)
          .limit(limit ?? 10);

      final querySnapshot = await query.get();
      final events = querySnapshot.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data()))
          .toList();

      // Filter upcoming events
      final now = DateTime.now();
      final upcomingEvents = events.where((event) {
        return event.dateTime.isAfter(now);
      }).toList();

      // Sort by ticket sales (events with more sold tickets first)
      upcomingEvents.sort((a, b) {
        final aSold = a.ticketTypes.fold<int>(0, (sum, t) => sum + (t.quantity - t.availableQuantity));
        final bSold = b.ticketTypes.fold<int>(0, (sum, t) => sum + (t.quantity - t.availableQuantity));
        return bSold.compareTo(aSold);
      });

      return await _convertToDiscoveryEntities(upcomingEvents);
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get featured events: $e',
      );
    }
  }

  @override
  Future<List<EventDiscoveryEntity>> getNearbyEvents({
    required double latitude,
    required double longitude,
    double? radiusKm,
    int? limit,
  }) async {
    try {
      // For MVP, return all upcoming events (location-based search would require geohash)
      // In production, you'd implement proper geospatial queries
      final upcomingEvents = await getUpcomingEvents(limit: limit);
      
      // For now, just return upcoming events
      // TODO: Implement proper geospatial search with geohash or similar
      return upcomingEvents;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get nearby events: $e',
      );
    }
  }

  @override
  Future<bool> toggleEventFavorite({
    required String userId,
    required String eventId,
  }) async {
    try {
      final favoriteDoc = _firestore
          .collection(_favoritesCollection)
          .doc('${userId}_$eventId');

      final docSnapshot = await favoriteDoc.get();
      
      if (docSnapshot.exists) {
        // Remove from favorites
        await favoriteDoc.delete();
        return false;
      } else {
        // Add to favorites
        await favoriteDoc.set({
          'userId': userId,
          'eventId': eventId,
          'createdAt': DateTime.now().toIso8601String(),
        });
        return true;
      }
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to toggle favorite: $e',
      );
    }
  }

  @override
  Future<List<EventDiscoveryEntity>> getFavoriteEvents({
    required String userId,
  }) async {
    try {
      // Get user's favorite event IDs
      final favoritesQuery = await _firestore
          .collection(_favoritesCollection)
          .where('userId', isEqualTo: userId)
          .get();

      final eventIds = favoritesQuery.docs
          .map((doc) => doc.data()['eventId'] as String)
          .toList();

      if (eventIds.isEmpty) {
        return [];
      }

      // Get events by IDs (in batches if needed)
      final events = <EventEntity>[];
      
      // Firestore 'in' queries are limited to 10 items
      for (int i = 0; i < eventIds.length; i += 10) {
        final batch = eventIds.skip(i).take(10).toList();
        final batchQuery = await _firestore
            .collection(_eventsCollection)
            .where(FieldPath.documentId, whereIn: batch)
            .get();
        
        final batchEvents = batchQuery.docs
            .map((doc) => EventEntity.fromFirestoreData(doc.data()))
            .toList();
        
        events.addAll(batchEvents);
      }

      // Filter active and upcoming events
      final now = DateTime.now();
      final activeUpcomingEvents = events.where((event) {
        return event.status == EventStatus.active && event.dateTime.isAfter(now);
      }).toList();

      // Sort by date
      activeUpcomingEvents.sort((a, b) => a.dateTime.compareTo(b.dateTime));

      return await _convertToDiscoveryEntities(activeUpcomingEvents, markAsFavorite: true);
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get favorite events: $e',
      );
    }
  }

  @override
  Stream<List<EventDiscoveryEntity>> watchUpcomingEvents() {
    return _firestore
        .collection(_eventsCollection)
        .where('status', isEqualTo: EventStatus.active.name)
        .snapshots()
        .asyncMap((querySnapshot) async {
      final allEvents = querySnapshot.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data()))
          .toList();

      // Filter upcoming events
      final now = DateTime.now();
      final upcomingEvents = allEvents.where((event) {
        return event.dateTime.isAfter(now);
      }).toList();

      // Sort by date
      upcomingEvents.sort((a, b) => a.dateTime.compareTo(b.dateTime));

      return await _convertToDiscoveryEntities(upcomingEvents);
    });
  }

  // Helper methods

  /// Convert EventEntity Firestore data to EventDiscoveryEntity format
  Future<Map<String, dynamic>> _convertEventDataToDiscoveryData(Map<String, dynamic> eventData) async {
    try {
      print('🔄 DEBUG: Converting event data for ${eventData['id']}');
      
      // Get organizer name - first check if it's already stored in the event
      final organizerId = eventData['organizerId'] as String;
      print('   👤 Organizer ID: $organizerId');
      
      String? storedOrganizerName = eventData['organizerName'] as String?;
      print('   📝 Stored organizer name: $storedOrganizerName');

      // If organizer name is not stored or is "Unknown Organizer", fetch it
      String organizerName;
      if (storedOrganizerName == null ||
          storedOrganizerName.isEmpty ||
          storedOrganizerName == 'Unknown Organizer') {
        organizerName = await _getOrganizerName(organizerId);
        print('   🔍 Fetched organizer name: $organizerName');
      } else {
        organizerName = storedOrganizerName;
      }

      // Calculate derived fields
      final ticketTypesData = eventData['ticketTypes'] as List<dynamic>;
      print('   🎫 Processing ${ticketTypesData.length} ticket types');
      
      final ticketTypes = ticketTypesData.map((ticketData) {
        final data = ticketData as Map<String, dynamic>;
        return {
          'id': data['id'],
          'name': data['name'],
          'description': data['description'],
          'price': data['price'],
          'availableQuantity': data['availableQuantity'],
          'totalQuantity': data['quantity'], // Map quantity to totalQuantity
          'isActive': data['isActive'],
        };
      }).toList();

      // Calculate available tickets
      final availableTickets = ticketTypes.fold<int>(0, (sum, ticket) {
        return sum + (ticket['availableQuantity'] as int);
      });
      print('   📊 Available tickets: $availableTickets');
      
      // Calculate price range
      final prices = ticketTypes
          .map((t) => (t['price'] as num).toDouble())
          .where((p) => p > 0)
          .toList();
      final minPrice =
          prices.isEmpty ? 0.0 : prices.reduce((a, b) => a < b ? a : b);
      final maxPrice =
          prices.isEmpty ? 0.0 : prices.reduce((a, b) => a > b ? a : b);
      print('   💰 Price range: $minPrice - $maxPrice');
      
      final result = {
        'id': eventData['id'],
        'organizerId': organizerId,
        'organizerName': organizerName,
        'title': eventData['title'],
        'description': eventData['description'],
        'bannerUrl': eventData['bannerUrl'],
        'location': eventData['location'],
        'dateTime': eventData['dateTime'],
        'category': eventData['category'],
        'ticketTypes': ticketTypes,
        'maxCapacity': eventData['maxCapacity'],
        'availableTickets': availableTickets,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'status': eventData['status'],
        'createdAt': eventData['createdAt'],
        'distance': null,
        'isFavorite': null,
        'attendeeCount': null,
      };
      
      print('   ✅ Conversion successful');
      return result;
    } catch (e, stackTrace) {
      print('   ❌ ERROR in _convertEventDataToDiscoveryData: $e');
      print('   Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<List<EventDiscoveryEntity>> _convertToDiscoveryEntities(
    List<EventEntity> events, {
    bool markAsFavorite = false,
  }) async {
    final discoveryEntities = <EventDiscoveryEntity>[];

    // Batch fetch organizer names to improve performance
    final organizerIds = events.map((e) => e.organizerId).toSet().toList();
    await _batchFetchOrganizerNames(organizerIds);

    for (final event in events) {
      final organizerName =
          _organizerNameCache[event.organizerId] ?? 'Unknown Organizer';
      
      final discoveryEntity = EventDiscoveryEntity.fromEventEntity(
        event,
        organizerName: organizerName,
        isFavorite: markAsFavorite ? true : null,
      );
      
      discoveryEntities.add(discoveryEntity);
    }

    return discoveryEntities;
  }

  /// Batch fetch organizer names for better performance
  Future<void> _batchFetchOrganizerNames(List<String> organizerIds) async {
    final uncachedIds = organizerIds
        .where((id) => !_organizerNameCache.containsKey(id))
        .toList();

    if (uncachedIds.isEmpty) return;

    try {
      // Firestore 'in' queries are limited to 10 items
      for (int i = 0; i < uncachedIds.length; i += 10) {
        final batch = uncachedIds.skip(i).take(10).toList();
        final batchQuery = await _firestore
            .collection(_organizersCollection)
            .where(FieldPath.documentId, whereIn: batch)
            .get();

        // Process each organizer in the batch
        for (final doc in batchQuery.docs) {
          final organizerId = doc.id;
          final data = doc.data();

          String organizerName = 'Unknown Organizer';

          // Check for organization name first
          final organizerData = data['organizerData'] as Map<String, dynamic>?;
          if (organizerData != null) {
            final organizationName =
                organizerData['organizationName'] as String?;
            if (organizationName != null &&
                organizationName.trim().isNotEmpty) {
              organizerName = organizationName.trim();
            }
          }

          // Check for user name if no organization name
          if (organizerName == 'Unknown Organizer') {
            final name = data['name'] as String?;
            if (name != null && name.trim().isNotEmpty) {
              organizerName = name.trim();
            }
          }

          // Fallback to displayName
          if (organizerName == 'Unknown Organizer') {
            final displayName = data['displayName'] as String?;
            if (displayName != null && displayName.trim().isNotEmpty) {
              organizerName = displayName.trim();
            }
          }

          // Last resort: use email prefix
          if (organizerName == 'Unknown Organizer') {
            final email = data['email'] as String?;
            if (email != null && email.trim().isNotEmpty) {
              final emailPrefix = email.split('@').first;
              organizerName = emailPrefix.trim();
            }
          }

          _organizerNameCache[organizerId] = organizerName;
        }

        // Mark missing organizers as unknown
        for (final id in batch) {
          if (!_organizerNameCache.containsKey(id)) {
            _organizerNameCache[id] = 'Unknown Organizer';
          }
        }
      }
    } catch (e) {
      print('Error batch fetching organizer names: $e');
      // Mark all uncached IDs as unknown
      for (final id in uncachedIds) {
        if (!_organizerNameCache.containsKey(id)) {
          _organizerNameCache[id] = 'Unknown Organizer';
        }
      }
    }
  }

  /// Clear the organizer name cache
  void clearOrganizerCache() {
    _organizerNameCache.clear();
  }

  /// Debug method to test organizer name fetching
  Future<void> debugOrganizerNames() async {
    try {
      print('🔍 Debug: Testing organizer name fetching...');

      // Get a few events to test
      final eventsQuery =
          await _firestore.collection(_eventsCollection).limit(5).get();

      for (final eventDoc in eventsQuery.docs) {
        final data = eventDoc.data();
        final organizerId = data['organizerId'] as String?;
        final eventTitle = data['title'] as String?;

        if (organizerId != null) {
          final organizerName = await _getOrganizerName(organizerId);
          print('📋 Event: $eventTitle');
          print('   👤 Organizer ID: $organizerId');
          print('   👤 Organizer Name: $organizerName');
          print('   ---');
        }
      }
    } catch (e) {
      print('❌ Error in debugOrganizerNames: $e');
    }
  }

  /// Update all events with organizer names (run once to fix existing data)
  Future<void> updateAllEventsWithOrganizerNames() async {
    try {
      print('🔄 Starting organizer name update for all events...');

      // Get all events
      final eventsQuery = await _firestore.collection(_eventsCollection).get();

      int updatedCount = 0;
      int totalCount = eventsQuery.docs.length;

      print('📊 Found $totalCount events to process');

      for (final eventDoc in eventsQuery.docs) {
        try {
          final eventData = eventDoc.data();
          final organizerId = eventData['organizerId'] as String?;

          if (organizerId == null) {
            print('⚠️ Event ${eventDoc.id} has no organizerId, skipping');
            continue;
          }

          // Check if organizer name already exists and is not "Unknown Organizer"
          final existingOrganizerName = eventData['organizerName'] as String?;
          if (existingOrganizerName != null &&
              existingOrganizerName != 'Unknown Organizer' &&
              existingOrganizerName.trim().isNotEmpty) {
            print(
                '✅ Event ${eventDoc.id} already has organizer name: $existingOrganizerName');
            continue;
          }

          // Get organizer name from user profile
          final organizerName = await _getOrganizerName(organizerId);

          // Only update if we found a valid name
          if (organizerName != 'Unknown Organizer') {
            await eventDoc.reference.update({
              'organizerName': organizerName,
            });

            updatedCount++;
            print(
                '✅ Updated event ${eventDoc.id} with organizer name: $organizerName');
          } else {
            print(
                '⚠️ Could not find valid organizer name for event ${eventDoc.id}');
          }
        } catch (e) {
          print('❌ Error updating event ${eventDoc.id}: $e');
        }
      }

      print('🎉 Organizer name update completed!');
      print('📈 Updated $updatedCount out of $totalCount events');
    } catch (e) {
      print('❌ Error in updateAllEventsWithOrganizerNames: $e');
    }
  }

  Future<String> _getOrganizerName(String organizerId) async {
    // Check cache first
    if (_organizerNameCache.containsKey(organizerId)) {
      return _organizerNameCache[organizerId]!;
    }
    
    try {
      final organizerDoc = await _firestore
          .collection(_organizersCollection)
          .doc(organizerId)
          .get();

      String organizerName = 'Unknown Organizer';

      if (organizerDoc.exists) {
        final data = organizerDoc.data()!;
        
        // Priority order for organizer name:
        // 1. organizerData.organizationName (for business/organization names)
        // 2. name (user's display name)
        // 3. displayName (fallback)
        // 4. email (last resort)

        // Check for organization name first (most appropriate for events)
        final organizerData = data['organizerData'] as Map<String, dynamic>?;
        if (organizerData != null) {
          final organizationName = organizerData['organizationName'] as String?;
          if (organizationName != null && organizationName.trim().isNotEmpty) {
            organizerName = organizationName.trim();
          }
        }

        // Check for user name if no organization name
        if (organizerName == 'Unknown Organizer') {
          final name = data['name'] as String?;
          if (name != null && name.trim().isNotEmpty) {
            organizerName = name.trim();
          }
        }

        // Fallback to displayName if it exists
        if (organizerName == 'Unknown Organizer') {
          final displayName = data['displayName'] as String?;
          if (displayName != null && displayName.trim().isNotEmpty) {
            organizerName = displayName.trim();
          }
        }

        // Last resort: use email prefix
        if (organizerName == 'Unknown Organizer') {
          final email = data['email'] as String?;
          if (email != null && email.trim().isNotEmpty) {
            final emailPrefix = email.split('@').first;
            organizerName = emailPrefix.trim();
          }
        }

        if (organizerName == 'Unknown Organizer') {
          print(
              'Warning: Organizer $organizerId exists but has no valid name fields');
        }
      } else {
        print('Warning: Organizer profile not found for ID: $organizerId');
      }
      
      // Cache the result
      _organizerNameCache[organizerId] = organizerName;
      return organizerName;
      
    } catch (e) {
      print('Error fetching organizer name for $organizerId: $e');
      const fallbackName = 'Unknown Organizer';
      _organizerNameCache[organizerId] = fallbackName;
      return fallbackName;
    }
  }

  Future<bool> _isEventFavorited(String userId, String eventId) async {
    try {
      final favoriteDoc = await _firestore
          .collection(_favoritesCollection)
          .doc('${userId}_$eventId')
          .get();
      
      return favoriteDoc.exists;
    } catch (e) {
      return false;
    }
  }

  List<EventDiscoveryEntity> _applyFiltersInMemory(List<EventDiscoveryEntity> events, EventSearchFilters filters) {
    var filteredEvents = events;

    // Text search
    if (filters.query != null && filters.query!.isNotEmpty) {
      final query = filters.query!.toLowerCase();
      filteredEvents = filteredEvents.where((event) {
        return event.title.toLowerCase().contains(query) ||
               event.description.toLowerCase().contains(query) ||
               event.location.toLowerCase().contains(query);
      }).toList();
    }

    // Date range
    if (filters.startDate != null) {
      filteredEvents = filteredEvents.where((event) {
        return event.dateTime.isAfter(filters.startDate!) ||
               event.dateTime.isAtSameMomentAs(filters.startDate!);
      }).toList();
    }

    if (filters.endDate != null) {
      filteredEvents = filteredEvents.where((event) {
        return event.dateTime.isBefore(filters.endDate!) ||
               event.dateTime.isAtSameMomentAs(filters.endDate!);
      }).toList();
    }

    // Price range
    if (filters.minPrice != null || filters.maxPrice != null) {
      filteredEvents = filteredEvents.where((event) {
        if (event.isFree) return filters.freeOnly == true;
        
        bool matchesMin = filters.minPrice == null || event.minPrice >= filters.minPrice!;
        bool matchesMax = filters.maxPrice == null || event.maxPrice <= filters.maxPrice!;
        
        return matchesMin && matchesMax;
      }).toList();
    }

    // Free only
    if (filters.freeOnly == true) {
      filteredEvents = filteredEvents.where((event) => event.isFree).toList();
    }

    // Available only
    if (filters.availableOnly == true) {
      filteredEvents = filteredEvents.where((event) => !event.isSoldOut).toList();
    }

    // Upcoming only
    final now = DateTime.now();
    filteredEvents = filteredEvents.where((event) {
      return event.dateTime.isAfter(now);
    }).toList();

    return filteredEvents;
  }

  List<EventDiscoveryEntity> _applySorting(List<EventDiscoveryEntity> events, EventSortBy sortBy) {
    switch (sortBy) {
      case EventSortBy.date:
        events.sort((a, b) => a.dateTime.compareTo(b.dateTime));
        break;
      case EventSortBy.price:
        events.sort((a, b) {
          if (a.isFree && b.isFree) return 0;
          if (a.isFree) return -1;
          if (b.isFree) return 1;
          return a.minPrice.compareTo(b.minPrice);
        });
        break;
      case EventSortBy.popularity:
        events.sort((a, b) {
          final aSold = a.maxCapacity - a.availableTickets;
          final bSold = b.maxCapacity - b.availableTickets;
          return bSold.compareTo(aSold);
        });
        break;
      case EventSortBy.newest:
        events.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case EventSortBy.distance:
        // For MVP, sort by date since we don't have location data
        events.sort((a, b) => a.dateTime.compareTo(b.dateTime));
        break;
    }
    
    return events;
  }
}