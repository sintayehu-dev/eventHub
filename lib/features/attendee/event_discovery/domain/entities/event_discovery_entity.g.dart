// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_discovery_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDiscoveryEntityImpl _$$EventDiscoveryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EventDiscoveryEntityImpl(
      id: json['id'] as String,
      organizerId: json['organizerId'] as String,
      organizerName: json['organizerName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      bannerUrl: json['bannerUrl'] as String?,
      location: json['location'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      category: $enumDecode(_$EventCategoryEnumMap, json['category']),
      ticketTypes: (json['ticketTypes'] as List<dynamic>)
          .map((e) => TicketTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxCapacity: (json['maxCapacity'] as num).toInt(),
      availableTickets: (json['availableTickets'] as num).toInt(),
      minPrice: (json['minPrice'] as num).toDouble(),
      maxPrice: (json['maxPrice'] as num).toDouble(),
      status: $enumDecode(_$EventStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      distance: (json['distance'] as num?)?.toDouble(),
      isFavorite: json['isFavorite'] as bool?,
      attendeeCount: (json['attendeeCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EventDiscoveryEntityImplToJson(
        _$EventDiscoveryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizerId': instance.organizerId,
      'organizerName': instance.organizerName,
      'title': instance.title,
      'description': instance.description,
      'bannerUrl': instance.bannerUrl,
      'location': instance.location,
      'dateTime': instance.dateTime.toIso8601String(),
      'category': _$EventCategoryEnumMap[instance.category]!,
      'ticketTypes': instance.ticketTypes,
      'maxCapacity': instance.maxCapacity,
      'availableTickets': instance.availableTickets,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'status': _$EventStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'distance': instance.distance,
      'isFavorite': instance.isFavorite,
      'attendeeCount': instance.attendeeCount,
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

_$TicketTypeInfoImpl _$$TicketTypeInfoImplFromJson(Map<String, dynamic> json) =>
    _$TicketTypeInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      availableQuantity: (json['availableQuantity'] as num).toInt(),
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$TicketTypeInfoImplToJson(
        _$TicketTypeInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'availableQuantity': instance.availableQuantity,
      'totalQuantity': instance.totalQuantity,
      'isActive': instance.isActive,
    };

_$EventSearchFiltersImpl _$$EventSearchFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$EventSearchFiltersImpl(
      query: json['query'] as String?,
      category: $enumDecodeNullable(_$EventCategoryEnumMap, json['category']),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      maxDistance: (json['maxDistance'] as num?)?.toDouble(),
      freeOnly: json['freeOnly'] as bool?,
      availableOnly: json['availableOnly'] as bool?,
      sortBy: $enumDecodeNullable(_$EventSortByEnumMap, json['sortBy']),
    );

Map<String, dynamic> _$$EventSearchFiltersImplToJson(
        _$EventSearchFiltersImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'category': _$EventCategoryEnumMap[instance.category],
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'maxDistance': instance.maxDistance,
      'freeOnly': instance.freeOnly,
      'availableOnly': instance.availableOnly,
      'sortBy': _$EventSortByEnumMap[instance.sortBy],
    };

const _$EventSortByEnumMap = {
  EventSortBy.date: 'date',
  EventSortBy.price: 'price',
  EventSortBy.distance: 'distance',
  EventSortBy.popularity: 'popularity',
  EventSortBy.newest: 'newest',
};
