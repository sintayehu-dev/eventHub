import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

part 'event_discovery_entity.freezed.dart';
part 'event_discovery_entity.g.dart';

@freezed
class EventDiscoveryEntity with _$EventDiscoveryEntity {
  const factory EventDiscoveryEntity({
    required String id,
    required String organizerId,
    required String organizerName,
    required String title,
    required String description,
    String? bannerUrl,
    required String location,
    required DateTime dateTime,
    required EventCategory category,
    required List<TicketTypeInfo> ticketTypes,
    required int maxCapacity,
    required int availableTickets,
    required double minPrice,
    required double maxPrice,
    required EventStatus status,
    required DateTime createdAt,
    double? distance, // Distance from user location
    bool? isFavorite, // User's favorite status
    int? attendeeCount, // Number of people attending
  }) = _EventDiscoveryEntity;

  factory EventDiscoveryEntity.fromJson(Map<String, dynamic> json) =>
      _$EventDiscoveryEntityFromJson(json);

  const EventDiscoveryEntity._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'organizerId': organizerId,
      'organizerName': organizerName,
      'title': title,
      'description': description,
      'bannerUrl': bannerUrl,
      'location': location,
      'dateTime': dateTime.toIso8601String(),
      'category': category.name,
      'ticketTypes': ticketTypes.map((ticket) => ticket.toFirestoreData()).toList(),
      'maxCapacity': maxCapacity,
      'availableTickets': availableTickets,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'distance': distance,
      'isFavorite': isFavorite,
      'attendeeCount': attendeeCount,
    };
  }

  /// Create from Firestore document data
  factory EventDiscoveryEntity.fromFirestoreData(Map<String, dynamic> data) {
    return EventDiscoveryEntity(
      id: data['id'] as String,
      organizerId: data['organizerId'] as String,
      organizerName: data['organizerName'] as String? ?? 'Unknown Organizer',
      title: data['title'] as String,
      description: data['description'] as String,
      bannerUrl: data['bannerUrl'] as String?,
      location: data['location'] as String,
      dateTime: DateTime.parse(data['dateTime'] as String),
      category: EventCategory.values.firstWhere((e) => e.name == data['category']),
      ticketTypes: (data['ticketTypes'] as List<dynamic>)
          .map((ticketData) => TicketTypeInfo.fromFirestoreData(
              ticketData as Map<String, dynamic>))
          .toList(),
      maxCapacity: data['maxCapacity'] as int,
      availableTickets: data['availableTickets'] as int,
      minPrice: (data['minPrice'] as num).toDouble(),
      maxPrice: (data['maxPrice'] as num).toDouble(),
      status: EventStatus.values.firstWhere((e) => e.name == data['status']),
      createdAt: DateTime.parse(data['createdAt'] as String),
      distance: data['distance'] != null ? (data['distance'] as num).toDouble() : null,
      isFavorite: data['isFavorite'] as bool?,
      attendeeCount: data['attendeeCount'] as int?,
    );
  }

  /// Create from EventEntity
  factory EventDiscoveryEntity.fromEventEntity(
    EventEntity event, {
    String? organizerName,
    double? distance,
    bool? isFavorite,
  }) {
    final availableTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + ticket.availableQuantity,
    );

    final prices = event.ticketTypes.map((t) => t.price).where((p) => p > 0).toList();
    final minPrice = prices.isEmpty ? 0.0 : prices.reduce((a, b) => a < b ? a : b);
    final maxPrice = prices.isEmpty ? 0.0 : prices.reduce((a, b) => a > b ? a : b);

    final ticketTypeInfos = event.ticketTypes.map((ticket) {
      return TicketTypeInfo(
        id: ticket.id,
        name: ticket.name,
        description: ticket.description,
        price: ticket.price,
        availableQuantity: ticket.availableQuantity,
        totalQuantity: ticket.quantity,
        isActive: ticket.isActive,
      );
    }).toList();

    return EventDiscoveryEntity(
      id: event.id,
      organizerId: event.organizerId,
      organizerName: organizerName ?? 'Unknown Organizer',
      title: event.title,
      description: event.description,
      bannerUrl: event.bannerUrl,
      location: event.location,
      dateTime: event.dateTime,
      category: event.category,
      ticketTypes: ticketTypeInfos,
      maxCapacity: event.maxCapacity,
      availableTickets: availableTickets,
      minPrice: minPrice,
      maxPrice: maxPrice,
      status: event.status,
      createdAt: event.createdAt,
      distance: distance,
      isFavorite: isFavorite,
    );
  }

  bool get isFree => minPrice == 0.0;
  bool get isSoldOut => availableTickets == 0;
  bool get isUpcoming => dateTime.isAfter(DateTime.now());
  bool get isPast => dateTime.isBefore(DateTime.now());
  bool get isToday => _isSameDay(dateTime, DateTime.now());

  String get priceRange {
    if (isFree) return 'Free';
    if (minPrice == maxPrice) return '\$${minPrice.toStringAsFixed(0)}';
    return '\$${minPrice.toStringAsFixed(0)} - \$${maxPrice.toStringAsFixed(0)}';
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }
}

@freezed
class TicketTypeInfo with _$TicketTypeInfo {
  const factory TicketTypeInfo({
    required String id,
    required String name,
    required String description,
    required double price,
    required int availableQuantity,
    required int totalQuantity,
    required bool isActive,
  }) = _TicketTypeInfo;

  factory TicketTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeInfoFromJson(json);

  const TicketTypeInfo._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'availableQuantity': availableQuantity,
      'totalQuantity': totalQuantity,
      'isActive': isActive,
    };
  }

  /// Create from Firestore document data
  factory TicketTypeInfo.fromFirestoreData(Map<String, dynamic> data) {
    return TicketTypeInfo(
      id: data['id'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
      price: (data['price'] as num).toDouble(),
      availableQuantity: data['availableQuantity'] as int,
      totalQuantity: data['totalQuantity'] as int,
      isActive: data['isActive'] as bool,
    );
  }

  bool get isSoldOut => availableQuantity == 0;
  bool get isAvailable => isActive && !isSoldOut;
  double get soldPercentage => totalQuantity > 0 ? (totalQuantity - availableQuantity) / totalQuantity : 0.0;
}

@freezed
class EventSearchFilters with _$EventSearchFilters {
  const factory EventSearchFilters({
    String? query,
    EventCategory? category,
    DateTime? startDate,
    DateTime? endDate,
    double? minPrice,
    double? maxPrice,
    double? maxDistance,
    bool? freeOnly,
    bool? availableOnly,
    EventSortBy? sortBy,
  }) = _EventSearchFilters;

  factory EventSearchFilters.fromJson(Map<String, dynamic> json) =>
      _$EventSearchFiltersFromJson(json);
}

enum EventSortBy {
  date,
  price,
  distance,
  popularity,
  newest,
}

extension EventSortByExtension on EventSortBy {
  String get displayName {
    switch (this) {
      case EventSortBy.date:
        return 'Date';
      case EventSortBy.price:
        return 'Price';
      case EventSortBy.distance:
        return 'Distance';
      case EventSortBy.popularity:
        return 'Popularity';
      case EventSortBy.newest:
        return 'Newest';
    }
  }
}