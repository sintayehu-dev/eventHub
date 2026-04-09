// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendeeEntityImpl _$$AttendeeEntityImplFromJson(Map<String, dynamic> json) =>
    _$AttendeeEntityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      eventId: json['eventId'] as String,
      eventTitle: json['eventTitle'] as String,
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$AttendeeStatusEnumMap, json['status']),
      registrationDate: DateTime.parse(json['registrationDate'] as String),
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      totalTickets: (json['totalTickets'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      metadata: json['metadata'] as Map<String, dynamic>?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AttendeeEntityImplToJson(
        _$AttendeeEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'profileImageUrl': instance.profileImageUrl,
      'eventId': instance.eventId,
      'eventTitle': instance.eventTitle,
      'tickets': instance.tickets,
      'status': _$AttendeeStatusEnumMap[instance.status]!,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'checkInDate': instance.checkInDate?.toIso8601String(),
      'totalTickets': instance.totalTickets,
      'totalSpent': instance.totalSpent,
      'metadata': instance.metadata,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$AttendeeStatusEnumMap = {
  AttendeeStatus.registered: 'registered',
  AttendeeStatus.confirmed: 'confirmed',
  AttendeeStatus.checkedIn: 'checkedIn',
  AttendeeStatus.cancelled: 'cancelled',
  AttendeeStatus.refunded: 'refunded',
  AttendeeStatus.noShow: 'noShow',
};
