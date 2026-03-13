import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';
part 'event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String organizerId,
    required String title,
    required String description,
    String? bannerUrl,
    required String location,
    required DateTime dateTime,
    required EventCategory category,
    required List<TicketTypeEntity> ticketTypes,
    required int maxCapacity,
    required EventStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? cancellationReason,
    Map<String, dynamic>? metadata,
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);

  const EventEntity._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'organizerId': organizerId,
      'title': title,
      'description': description,
      'bannerUrl': bannerUrl,
      'location': location,
      'dateTime': dateTime.toIso8601String(),
      'category': category.name,
      'ticketTypes':
          ticketTypes.map((ticket) => ticket.toFirestoreData()).toList(),
      'maxCapacity': maxCapacity,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'cancellationReason': cancellationReason,
      'metadata': metadata,
    };
  }

  /// Create from Firestore document data
  factory EventEntity.fromFirestoreData(Map<String, dynamic> data) {
    return EventEntity(
      id: data['id'] as String,
      organizerId: data['organizerId'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
      bannerUrl: data['bannerUrl'] as String?,
      location: data['location'] as String,
      dateTime: DateTime.parse(data['dateTime'] as String),
      category:
          EventCategory.values.firstWhere((e) => e.name == data['category']),
      ticketTypes: (data['ticketTypes'] as List<dynamic>)
          .map((ticketData) => TicketTypeEntity.fromFirestoreData(
              ticketData as Map<String, dynamic>))
          .toList(),
      maxCapacity: data['maxCapacity'] as int,
      status: EventStatus.values.firstWhere((e) => e.name == data['status']),
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
      cancellationReason: data['cancellationReason'] as String?,
      metadata: data['metadata'] as Map<String, dynamic>?,
    );
  }
}

@freezed
class TicketTypeEntity with _$TicketTypeEntity {
  const factory TicketTypeEntity({
    required String id,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required int availableQuantity,
    required bool isActive,
    DateTime? saleStartDate,
    DateTime? saleEndDate,
    Map<String, dynamic>? metadata,
  }) = _TicketTypeEntity;

  factory TicketTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeEntityFromJson(json);

  const TicketTypeEntity._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'availableQuantity': availableQuantity,
      'isActive': isActive,
      'saleStartDate': saleStartDate?.toIso8601String(),
      'saleEndDate': saleEndDate?.toIso8601String(),
      'metadata': metadata,
    };
  }

  /// Create from Firestore document data
  factory TicketTypeEntity.fromFirestoreData(Map<String, dynamic> data) {
    return TicketTypeEntity(
      id: data['id'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'] as int,
      availableQuantity: data['availableQuantity'] as int,
      isActive: data['isActive'] as bool,
      saleStartDate: data['saleStartDate'] != null
          ? DateTime.parse(data['saleStartDate'] as String)
          : null,
      saleEndDate: data['saleEndDate'] != null
          ? DateTime.parse(data['saleEndDate'] as String)
          : null,
      metadata: data['metadata'] as Map<String, dynamic>?,
    );
  }
}

enum EventStatus {
  draft,
  active,
  completed,
  cancelled,
}

enum EventCategory {
  music,
  technology,
  business,
  arts,
  sports,
  food,
  education,
  health,
  networking,
  entertainment,
  workshop,
  conference,
  festival,
  charity,
  other,
}

extension EventCategoryExtension on EventCategory {
  String get displayName {
    switch (this) {
      case EventCategory.music:
        return 'Music & Concerts';
      case EventCategory.technology:
        return 'Technology';
      case EventCategory.business:
        return 'Business & Professional';
      case EventCategory.arts:
        return 'Arts & Culture';
      case EventCategory.sports:
        return 'Sports & Fitness';
      case EventCategory.food:
        return 'Food & Drink';
      case EventCategory.education:
        return 'Education & Learning';
      case EventCategory.health:
        return 'Health & Wellness';
      case EventCategory.networking:
        return 'Networking';
      case EventCategory.entertainment:
        return 'Entertainment';
      case EventCategory.workshop:
        return 'Workshop & Training';
      case EventCategory.conference:
        return 'Conference & Seminar';
      case EventCategory.festival:
        return 'Festival & Fair';
      case EventCategory.charity:
        return 'Charity & Fundraising';
      case EventCategory.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case EventCategory.music:
        return '🎵';
      case EventCategory.technology:
        return '💻';
      case EventCategory.business:
        return '💼';
      case EventCategory.arts:
        return '🎨';
      case EventCategory.sports:
        return '⚽';
      case EventCategory.food:
        return '🍽️';
      case EventCategory.education:
        return '📚';
      case EventCategory.health:
        return '🏥';
      case EventCategory.networking:
        return '🤝';
      case EventCategory.entertainment:
        return '🎭';
      case EventCategory.workshop:
        return '🛠️';
      case EventCategory.conference:
        return '🎤';
      case EventCategory.festival:
        return '🎪';
      case EventCategory.charity:
        return '❤️';
      case EventCategory.other:
        return '📋';
    }
  }
}

extension EventStatusExtension on EventStatus {
  String get displayName {
    switch (this) {
      case EventStatus.draft:
        return 'Draft';
      case EventStatus.active:
        return 'Active';
      case EventStatus.completed:
        return 'Completed';
      case EventStatus.cancelled:
        return 'Cancelled';
    }
  }

  bool get isEditable {
    return this == EventStatus.draft || this == EventStatus.active;
  }

  bool get canBeCancelled {
    return this == EventStatus.draft || this == EventStatus.active;
  }
}

@freezed
class CreateEventRequest with _$CreateEventRequest {
  const factory CreateEventRequest({
    required String title,
    required String description,
    String? bannerImagePath,
    required String location,
    required DateTime dateTime,
    required EventCategory category,
    required List<CreateTicketTypeRequest> ticketTypes,
    required int maxCapacity,
    Map<String, dynamic>? metadata,
  }) = _CreateEventRequest;

  factory CreateEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEventRequestFromJson(json);
}

@freezed
class CreateTicketTypeRequest with _$CreateTicketTypeRequest {
  const factory CreateTicketTypeRequest({
    required String name,
    required String description,
    required double price,
    required int quantity,
    DateTime? saleStartDate,
    DateTime? saleEndDate,
    Map<String, dynamic>? metadata,
  }) = _CreateTicketTypeRequest;

  factory CreateTicketTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketTypeRequestFromJson(json);
}

@freezed
class UpdateEventRequest with _$UpdateEventRequest {
  const factory UpdateEventRequest({
    String? title,
    String? description,
    String? bannerImagePath,
    String? location,
    DateTime? dateTime,
    EventCategory? category,
    List<UpdateTicketTypeRequest>? ticketTypes,
    int? maxCapacity,
    EventStatus? status,
    String? cancellationReason,
    Map<String, dynamic>? metadata,
  }) = _UpdateEventRequest;

  factory UpdateEventRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEventRequestFromJson(json);
}

@freezed
class UpdateTicketTypeRequest with _$UpdateTicketTypeRequest {
  const factory UpdateTicketTypeRequest({
    required String id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    bool? isActive,
    DateTime? saleStartDate,
    DateTime? saleEndDate,
    Map<String, dynamic>? metadata,
  }) = _UpdateTicketTypeRequest;

  factory UpdateTicketTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTicketTypeRequestFromJson(json);
}