// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityImpl _$$EventEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventEntityImpl(
      id: json['id'] as String,
      organizerId: json['organizerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      bannerUrl: json['bannerUrl'] as String?,
      location: json['location'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      category: $enumDecode(_$EventCategoryEnumMap, json['category']),
      ticketTypes: (json['ticketTypes'] as List<dynamic>)
          .map((e) => TicketTypeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxCapacity: (json['maxCapacity'] as num).toInt(),
      status: $enumDecode(_$EventStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      cancellationReason: json['cancellationReason'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EventEntityImplToJson(_$EventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizerId': instance.organizerId,
      'title': instance.title,
      'description': instance.description,
      'bannerUrl': instance.bannerUrl,
      'location': instance.location,
      'dateTime': instance.dateTime.toIso8601String(),
      'category': _$EventCategoryEnumMap[instance.category]!,
      'ticketTypes': instance.ticketTypes,
      'maxCapacity': instance.maxCapacity,
      'status': _$EventStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'cancellationReason': instance.cancellationReason,
      'metadata': instance.metadata,
    };

const _$EventCategoryEnumMap = {
  EventCategory.music: 'music',
  EventCategory.technology: 'technology',
  EventCategory.business: 'business',
  EventCategory.arts: 'arts',
  EventCategory.sports: 'sports',
  EventCategory.food: 'food',
  EventCategory.education: 'education',
  EventCategory.health: 'health',
  EventCategory.networking: 'networking',
  EventCategory.entertainment: 'entertainment',
  EventCategory.workshop: 'workshop',
  EventCategory.conference: 'conference',
  EventCategory.festival: 'festival',
  EventCategory.charity: 'charity',
  EventCategory.other: 'other',
};

const _$EventStatusEnumMap = {
  EventStatus.draft: 'draft',
  EventStatus.active: 'active',
  EventStatus.completed: 'completed',
  EventStatus.cancelled: 'cancelled',
};

_$TicketTypeEntityImpl _$$TicketTypeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TicketTypeEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      availableQuantity: (json['availableQuantity'] as num).toInt(),
      isActive: json['isActive'] as bool,
      saleStartDate: json['saleStartDate'] == null
          ? null
          : DateTime.parse(json['saleStartDate'] as String),
      saleEndDate: json['saleEndDate'] == null
          ? null
          : DateTime.parse(json['saleEndDate'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TicketTypeEntityImplToJson(
        _$TicketTypeEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'availableQuantity': instance.availableQuantity,
      'isActive': instance.isActive,
      'saleStartDate': instance.saleStartDate?.toIso8601String(),
      'saleEndDate': instance.saleEndDate?.toIso8601String(),
      'metadata': instance.metadata,
    };

_$CreateEventRequestImpl _$$CreateEventRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateEventRequestImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      bannerImagePath: json['bannerImagePath'] as String?,
      location: json['location'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      category: $enumDecode(_$EventCategoryEnumMap, json['category']),
      ticketTypes: (json['ticketTypes'] as List<dynamic>)
          .map((e) =>
              CreateTicketTypeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxCapacity: (json['maxCapacity'] as num).toInt(),
      staffMembers: (json['staffMembers'] as List<dynamic>?)
              ?.map((e) =>
                  CreateStaffMemberRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateEventRequestImplToJson(
        _$CreateEventRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'bannerImagePath': instance.bannerImagePath,
      'location': instance.location,
      'dateTime': instance.dateTime.toIso8601String(),
      'category': _$EventCategoryEnumMap[instance.category]!,
      'ticketTypes': instance.ticketTypes,
      'maxCapacity': instance.maxCapacity,
      'staffMembers': instance.staffMembers,
      'metadata': instance.metadata,
    };

_$CreateTicketTypeRequestImpl _$$CreateTicketTypeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTicketTypeRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      saleStartDate: json['saleStartDate'] == null
          ? null
          : DateTime.parse(json['saleStartDate'] as String),
      saleEndDate: json['saleEndDate'] == null
          ? null
          : DateTime.parse(json['saleEndDate'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateTicketTypeRequestImplToJson(
        _$CreateTicketTypeRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'saleStartDate': instance.saleStartDate?.toIso8601String(),
      'saleEndDate': instance.saleEndDate?.toIso8601String(),
      'metadata': instance.metadata,
    };

_$CreateStaffMemberRequestImpl _$$CreateStaffMemberRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateStaffMemberRequestImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateStaffMemberRequestImplToJson(
        _$CreateStaffMemberRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'permissions': instance.permissions,
      'metadata': instance.metadata,
    };

_$UpdateEventRequestImpl _$$UpdateEventRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateEventRequestImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      bannerImagePath: json['bannerImagePath'] as String?,
      location: json['location'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      category: $enumDecodeNullable(_$EventCategoryEnumMap, json['category']),
      ticketTypes: (json['ticketTypes'] as List<dynamic>?)
          ?.map((e) =>
              UpdateTicketTypeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$EventStatusEnumMap, json['status']),
      cancellationReason: json['cancellationReason'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UpdateEventRequestImplToJson(
        _$UpdateEventRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'bannerImagePath': instance.bannerImagePath,
      'location': instance.location,
      'dateTime': instance.dateTime?.toIso8601String(),
      'category': _$EventCategoryEnumMap[instance.category],
      'ticketTypes': instance.ticketTypes,
      'maxCapacity': instance.maxCapacity,
      'status': _$EventStatusEnumMap[instance.status],
      'cancellationReason': instance.cancellationReason,
      'metadata': instance.metadata,
    };

_$UpdateTicketTypeRequestImpl _$$UpdateTicketTypeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTicketTypeRequestImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      saleStartDate: json['saleStartDate'] == null
          ? null
          : DateTime.parse(json['saleStartDate'] as String),
      saleEndDate: json['saleEndDate'] == null
          ? null
          : DateTime.parse(json['saleEndDate'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UpdateTicketTypeRequestImplToJson(
        _$UpdateTicketTypeRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'isActive': instance.isActive,
      'saleStartDate': instance.saleStartDate?.toIso8601String(),
      'saleEndDate': instance.saleEndDate?.toIso8601String(),
      'metadata': instance.metadata,
    };
