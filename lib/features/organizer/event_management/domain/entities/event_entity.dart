
import 'package:json_annotation/json_annotation.dart';
import 'package:eventhub/core/value_object/value_objects.dart';

part 'event_entity.g.dart';

@JsonSerializable()
class EventEntity {
  @JsonKey(fromJson: _uniqueIdFromJson, toJson: _uniqueIdToJson)
  final UniqueId id;
  @JsonKey(fromJson: _uniqueIdFromJson, toJson: _uniqueIdToJson)
  final UniqueId organizerId;
  @JsonKey(fromJson: _eventTitleFromJson, toJson: _eventTitleToJson)
  final EventTitle title;
  @JsonKey(fromJson: _eventDescriptionFromJson, toJson: _eventDescriptionToJson)
  final EventDescription description;
  final String? bannerUrl;
  @JsonKey(fromJson: _eventLocationFromJson, toJson: _eventLocationToJson)
  final EventLocation location;
  final DateTime dateTime;
  final List<TicketTypeEntity> ticketTypes;
  @JsonKey(fromJson: _eventCapacityFromJson, toJson: _eventCapacityToJson)
  final EventCapacity maxCapacity;
  final EventStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? cancellationReason;
  final Map<String, dynamic>? metadata;

  const EventEntity({
    required this.id,
    required this.organizerId,
    required this.title,
    required this.description,
    this.bannerUrl,
    required this.location,
    required this.dateTime,
    required this.ticketTypes,
    required this.maxCapacity,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.cancellationReason,
    this.metadata,
  });

  EventEntity copyWith({
    UniqueId? id,
    UniqueId? organizerId,
    EventTitle? title,
    EventDescription? description,
    String? bannerUrl,
    EventLocation? location,
    DateTime? dateTime,
    List<TicketTypeEntity>? ticketTypes,
    EventCapacity? maxCapacity,
    EventStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? cancellationReason,
    Map<String, dynamic>? metadata,
  }) {
    return EventEntity(
      id: id ?? this.id,
      organizerId: organizerId ?? this.organizerId,
      title: title ?? this.title,
      description: description ?? this.description,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
      ticketTypes: ticketTypes ?? this.ticketTypes,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      metadata: metadata ?? this.metadata,
    );
  }

  factory EventEntity.fromJson(Map<String, dynamic> json) => _$EventEntityFromJson(json);
  Map<String, dynamic> toJson() => _$EventEntityToJson(this);

  // Helper methods for value object serialization
  static UniqueId _uniqueIdFromJson(String json) => UniqueId.fromString(json);
  static String _uniqueIdToJson(UniqueId id) => id.getOrCrash();
  
  static EventTitle _eventTitleFromJson(String json) => EventTitle(json);
  static String _eventTitleToJson(EventTitle title) => title.getOrCrash();
  
  static EventDescription _eventDescriptionFromJson(String json) => EventDescription(json);
  static String _eventDescriptionToJson(EventDescription description) => description.getOrCrash();
  
  static EventLocation _eventLocationFromJson(String json) => EventLocation(json);
  static String _eventLocationToJson(EventLocation location) => location.getOrCrash();
  
  static EventCapacity _eventCapacityFromJson(int json) => EventCapacity(json);
  static int _eventCapacityToJson(EventCapacity capacity) => capacity.getOrCrash();
}

@JsonSerializable()
class TicketTypeEntity {
  @JsonKey(fromJson: _uniqueIdFromJson, toJson: _uniqueIdToJson)
  final UniqueId id;
  @JsonKey(fromJson: _ticketTypeNameFromJson, toJson: _ticketTypeNameToJson)
  final TicketTypeName name;
  final String description;
  @JsonKey(fromJson: _ticketPriceFromJson, toJson: _ticketPriceToJson)
  final TicketPrice price;
  @JsonKey(fromJson: _ticketQuantityFromJson, toJson: _ticketQuantityToJson)
  final TicketQuantity quantity;
  @JsonKey(fromJson: _ticketQuantityFromJson, toJson: _ticketQuantityToJson)
  final TicketQuantity availableQuantity;
  final bool isActive;
  final DateTime? saleStartDate;
  final DateTime? saleEndDate;
  final Map<String, dynamic>? metadata;

  const TicketTypeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.availableQuantity,
    required this.isActive,
    this.saleStartDate,
    this.saleEndDate,
    this.metadata,
  });

  TicketTypeEntity copyWith({
    UniqueId? id,
    TicketTypeName? name,
    String? description,
    TicketPrice? price,
    TicketQuantity? quantity,
    TicketQuantity? availableQuantity,
    bool? isActive,
    DateTime? saleStartDate,
    DateTime? saleEndDate,
    Map<String, dynamic>? metadata,
  }) {
    return TicketTypeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      isActive: isActive ?? this.isActive,
      saleStartDate: saleStartDate ?? this.saleStartDate,
      saleEndDate: saleEndDate ?? this.saleEndDate,
      metadata: metadata ?? this.metadata,
    );
  }

  factory TicketTypeEntity.fromJson(Map<String, dynamic> json) => _$TicketTypeEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TicketTypeEntityToJson(this);

  // Helper methods for value object serialization
  static UniqueId _uniqueIdFromJson(String json) => UniqueId.fromString(json);
  static String _uniqueIdToJson(UniqueId id) => id.getOrCrash();
  
  static TicketTypeName _ticketTypeNameFromJson(String json) => TicketTypeName(json);
  static String _ticketTypeNameToJson(TicketTypeName name) => name.getOrCrash();
  
  static TicketPrice _ticketPriceFromJson(double json) => TicketPrice(json);
  static double _ticketPriceToJson(TicketPrice price) => price.getOrCrash();
  
  static TicketQuantity _ticketQuantityFromJson(int json) => TicketQuantity(json);
  static int _ticketQuantityToJson(TicketQuantity quantity) => quantity.getOrCrash();
}

enum EventStatus {
  draft,
  active,
  completed,
  cancelled,
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

// Event creation request
@JsonSerializable()
class CreateEventRequest {
  @JsonKey(fromJson: _eventTitleFromJson, toJson: _eventTitleToJson)
  final EventTitle title;
  @JsonKey(fromJson: _eventDescriptionFromJson, toJson: _eventDescriptionToJson)
  final EventDescription description;
  final String? bannerImagePath;
  @JsonKey(fromJson: _eventLocationFromJson, toJson: _eventLocationToJson)
  final EventLocation location;
  final DateTime dateTime;
  final List<CreateTicketTypeRequest> ticketTypes;
  @JsonKey(fromJson: _eventCapacityFromJson, toJson: _eventCapacityToJson)
  final EventCapacity maxCapacity;
  final Map<String, dynamic>? metadata;

  const CreateEventRequest({
    required this.title,
    required this.description,
    this.bannerImagePath,
    required this.location,
    required this.dateTime,
    required this.ticketTypes,
    required this.maxCapacity,
    this.metadata,
  });

  factory CreateEventRequest.fromJson(Map<String, dynamic> json) => _$CreateEventRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateEventRequestToJson(this);

  // Helper methods for value object serialization
  static EventTitle _eventTitleFromJson(String json) => EventTitle(json);
  static String _eventTitleToJson(EventTitle title) => title.getOrCrash();
  
  static EventDescription _eventDescriptionFromJson(String json) => EventDescription(json);
  static String _eventDescriptionToJson(EventDescription description) => description.getOrCrash();
  
  static EventLocation _eventLocationFromJson(String json) => EventLocation(json);
  static String _eventLocationToJson(EventLocation location) => location.getOrCrash();
  
  static EventCapacity _eventCapacityFromJson(int json) => EventCapacity(json);
  static int _eventCapacityToJson(EventCapacity capacity) => capacity.getOrCrash();
}

@JsonSerializable()
class CreateTicketTypeRequest {
  @JsonKey(fromJson: _ticketTypeNameFromJson, toJson: _ticketTypeNameToJson)
  final TicketTypeName name;
  final String description;
  @JsonKey(fromJson: _ticketPriceFromJson, toJson: _ticketPriceToJson)
  final TicketPrice price;
  @JsonKey(fromJson: _ticketQuantityFromJson, toJson: _ticketQuantityToJson)
  final TicketQuantity quantity;
  final DateTime? saleStartDate;
  final DateTime? saleEndDate;
  final Map<String, dynamic>? metadata;

  const CreateTicketTypeRequest({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    this.saleStartDate,
    this.saleEndDate,
    this.metadata,
  });

  factory CreateTicketTypeRequest.fromJson(Map<String, dynamic> json) => _$CreateTicketTypeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateTicketTypeRequestToJson(this);

  // Helper methods for value object serialization
  static TicketTypeName _ticketTypeNameFromJson(String json) => TicketTypeName(json);
  static String _ticketTypeNameToJson(TicketTypeName name) => name.getOrCrash();
  
  static TicketPrice _ticketPriceFromJson(double json) => TicketPrice(json);
  static double _ticketPriceToJson(TicketPrice price) => price.getOrCrash();
  
  static TicketQuantity _ticketQuantityFromJson(int json) => TicketQuantity(json);
  static int _ticketQuantityToJson(TicketQuantity quantity) => quantity.getOrCrash();
}

// Event update request
@JsonSerializable()
class UpdateEventRequest {
  @JsonKey(fromJson: _eventTitleFromJsonNullable, toJson: _eventTitleToJsonNullable)
  final EventTitle? title;
  @JsonKey(fromJson: _eventDescriptionFromJsonNullable, toJson: _eventDescriptionToJsonNullable)
  final EventDescription? description;
  final String? bannerImagePath;
  @JsonKey(fromJson: _eventLocationFromJsonNullable, toJson: _eventLocationToJsonNullable)
  final EventLocation? location;
  final DateTime? dateTime;
  final List<UpdateTicketTypeRequest>? ticketTypes;
  @JsonKey(fromJson: _eventCapacityFromJsonNullable, toJson: _eventCapacityToJsonNullable)
  final EventCapacity? maxCapacity;
  final EventStatus? status;
  final String? cancellationReason;
  final Map<String, dynamic>? metadata;

  const UpdateEventRequest({
    this.title,
    this.description,
    this.bannerImagePath,
    this.location,
    this.dateTime,
    this.ticketTypes,
    this.maxCapacity,
    this.status,
    this.cancellationReason,
    this.metadata,
  });

  factory UpdateEventRequest.fromJson(Map<String, dynamic> json) => _$UpdateEventRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateEventRequestToJson(this);

  // Helper methods for nullable value object serialization
  static EventTitle? _eventTitleFromJsonNullable(String? json) => json != null ? EventTitle(json) : null;
  static String? _eventTitleToJsonNullable(EventTitle? title) => title?.getOrCrash();
  
  static EventDescription? _eventDescriptionFromJsonNullable(String? json) => json != null ? EventDescription(json) : null;
  static String? _eventDescriptionToJsonNullable(EventDescription? description) => description?.getOrCrash();
  
  static EventLocation? _eventLocationFromJsonNullable(String? json) => json != null ? EventLocation(json) : null;
  static String? _eventLocationToJsonNullable(EventLocation? location) => location?.getOrCrash();
  
  static EventCapacity? _eventCapacityFromJsonNullable(int? json) => json != null ? EventCapacity(json) : null;
  static int? _eventCapacityToJsonNullable(EventCapacity? capacity) => capacity?.getOrCrash();
}

@JsonSerializable()
class UpdateTicketTypeRequest {
  @JsonKey(fromJson: _uniqueIdFromJson, toJson: _uniqueIdToJson)
  final UniqueId id;
  @JsonKey(fromJson: _ticketTypeNameFromJsonNullable, toJson: _ticketTypeNameToJsonNullable)
  final TicketTypeName? name;
  final String? description;
  @JsonKey(fromJson: _ticketPriceFromJsonNullable, toJson: _ticketPriceToJsonNullable)
  final TicketPrice? price;
  @JsonKey(fromJson: _ticketQuantityFromJsonNullable, toJson: _ticketQuantityToJsonNullable)
  final TicketQuantity? quantity;
  final bool? isActive;
  final DateTime? saleStartDate;
  final DateTime? saleEndDate;
  final Map<String, dynamic>? metadata;

  const UpdateTicketTypeRequest({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.isActive,
    this.saleStartDate,
    this.saleEndDate,
    this.metadata,
  });

  factory UpdateTicketTypeRequest.fromJson(Map<String, dynamic> json) => _$UpdateTicketTypeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateTicketTypeRequestToJson(this);

  // Helper methods for value object serialization
  static UniqueId _uniqueIdFromJson(String json) => UniqueId.fromString(json);
  static String _uniqueIdToJson(UniqueId id) => id.getOrCrash();
  
  static TicketTypeName? _ticketTypeNameFromJsonNullable(String? json) => json != null ? TicketTypeName(json) : null;
  static String? _ticketTypeNameToJsonNullable(TicketTypeName? name) => name?.getOrCrash();
  
  static TicketPrice? _ticketPriceFromJsonNullable(double? json) => json != null ? TicketPrice(json) : null;
  static double? _ticketPriceToJsonNullable(TicketPrice? price) => price?.getOrCrash();
  
  static TicketQuantity? _ticketQuantityFromJsonNullable(int? json) => json != null ? TicketQuantity(json) : null;
  static int? _ticketQuantityToJsonNullable(TicketQuantity? quantity) => quantity?.getOrCrash();
}