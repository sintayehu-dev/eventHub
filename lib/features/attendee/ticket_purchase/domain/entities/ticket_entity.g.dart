// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketEntityImpl _$$TicketEntityImplFromJson(Map<String, dynamic> json) =>
    _$TicketEntityImpl(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      eventTitle: json['eventTitle'] as String,
      eventLocation: json['eventLocation'] as String,
      eventDateTime: DateTime.parse(json['eventDateTime'] as String),
      eventBannerUrl: json['eventBannerUrl'] as String?,
      ticketTypeId: json['ticketTypeId'] as String,
      ticketTypeName: json['ticketTypeName'] as String,
      ticketTypeDescription: json['ticketTypeDescription'] as String,
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
      status: $enumDecode(_$TicketStatusEnumMap, json['status']),
      qrCode: json['qrCode'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      seatNumber: json['seatNumber'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TicketEntityImplToJson(_$TicketEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'userId': instance.userId,
      'eventTitle': instance.eventTitle,
      'eventLocation': instance.eventLocation,
      'eventDateTime': instance.eventDateTime.toIso8601String(),
      'eventBannerUrl': instance.eventBannerUrl,
      'ticketTypeId': instance.ticketTypeId,
      'ticketTypeName': instance.ticketTypeName,
      'ticketTypeDescription': instance.ticketTypeDescription,
      'ticketPrice': instance.ticketPrice,
      'status': _$TicketStatusEnumMap[instance.status]!,
      'qrCode': instance.qrCode,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'checkInDate': instance.checkInDate?.toIso8601String(),
      'seatNumber': instance.seatNumber,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TicketStatusEnumMap = {
  TicketStatus.pending: 'pending',
  TicketStatus.confirmed: 'confirmed',
  TicketStatus.cancelled: 'cancelled',
  TicketStatus.refunded: 'refunded',
  TicketStatus.used: 'used',
};

_$PurchaseTicketRequestImpl _$$PurchaseTicketRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseTicketRequestImpl(
      eventId: json['eventId'] as String,
      ticketTypeId: json['ticketTypeId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PurchaseTicketRequestImplToJson(
        _$PurchaseTicketRequestImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'ticketTypeId': instance.ticketTypeId,
      'quantity': instance.quantity,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'metadata': instance.metadata,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.chapa: 'chapa',
  PaymentMethod.telebirr: 'telebirr',
};

_$PurchaseResultImpl _$$PurchaseResultImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseResultImpl(
      transactionId: json['transactionId'] as String,
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['paymentStatus']),
      paymentReference: json['paymentReference'] as String?,
    );

Map<String, dynamic> _$$PurchaseResultImplToJson(
        _$PurchaseResultImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'tickets': instance.tickets,
      'totalAmount': instance.totalAmount,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'paymentReference': instance.paymentReference,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.completed: 'completed',
  PaymentStatus.failed: 'failed',
  PaymentStatus.cancelled: 'cancelled',
};
