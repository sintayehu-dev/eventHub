import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_entity.freezed.dart';
part 'ticket_entity.g.dart';

@freezed
class TicketEntity with _$TicketEntity {
  const factory TicketEntity({
    required String id,
    required String eventId,
    required String userId,
    required String eventTitle,
    required String eventLocation,
    required DateTime eventDateTime,
    String? eventBannerUrl,
    required String ticketTypeId,
    required String ticketTypeName,
    required String ticketTypeDescription,
    required double ticketPrice,
    required TicketStatus status,
    required String qrCode,
    required DateTime purchaseDate,
    DateTime? checkInDate,
    String? seatNumber,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TicketEntity;

  factory TicketEntity.fromJson(Map<String, dynamic> json) =>
      _$TicketEntityFromJson(json);

  const TicketEntity._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
      'eventTitle': eventTitle,
      'eventLocation': eventLocation,
      'eventDateTime': eventDateTime.toIso8601String(),
      'eventBannerUrl': eventBannerUrl,
      'ticketTypeId': ticketTypeId,
      'ticketTypeName': ticketTypeName,
      'ticketTypeDescription': ticketTypeDescription,
      'ticketPrice': ticketPrice,
      'status': status.name,
      'qrCode': qrCode,
      'purchaseDate': purchaseDate.toIso8601String(),
      'checkInDate': checkInDate?.toIso8601String(),
      'seatNumber': seatNumber,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create from Firestore document data
  factory TicketEntity.fromFirestoreData(Map<String, dynamic> data) {
    return TicketEntity(
      id: data['id'] as String,
      eventId: data['eventId'] as String,
      userId: data['userId'] as String,
      eventTitle: data['eventTitle'] as String,
      eventLocation: data['eventLocation'] as String,
      eventDateTime: DateTime.parse(data['eventDateTime'] as String),
      eventBannerUrl: data['eventBannerUrl'] as String?,
      ticketTypeId: data['ticketTypeId'] as String,
      ticketTypeName: data['ticketTypeName'] as String,
      ticketTypeDescription: data['ticketTypeDescription'] as String,
      ticketPrice: (data['ticketPrice'] as num).toDouble(),
      status: TicketStatus.values.firstWhere((e) => e.name == data['status']),
      qrCode: data['qrCode'] as String,
      purchaseDate: DateTime.parse(data['purchaseDate'] as String),
      checkInDate: data['checkInDate'] != null
          ? DateTime.parse(data['checkInDate'] as String)
          : null,
      seatNumber: data['seatNumber'] as String?,
      metadata: data['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
    );
  }

  bool get isActive => status == TicketStatus.confirmed;
  bool get isUsed => checkInDate != null;
  bool get isUpcoming => eventDateTime.isAfter(DateTime.now());
  bool get isPast => eventDateTime.isBefore(DateTime.now());
}

enum TicketStatus {
  pending,
  confirmed,
  cancelled,
  refunded,
  used,
}

extension TicketStatusExtension on TicketStatus {
  String get displayName {
    switch (this) {
      case TicketStatus.pending:
        return 'Pending';
      case TicketStatus.confirmed:
        return 'Confirmed';
      case TicketStatus.cancelled:
        return 'Cancelled';
      case TicketStatus.refunded:
        return 'Refunded';
      case TicketStatus.used:
        return 'Used';
    }
  }

  bool get isActive {
    return this == TicketStatus.confirmed || this == TicketStatus.pending;
  }
}

@freezed
class PurchaseTicketRequest with _$PurchaseTicketRequest {
  const factory PurchaseTicketRequest({
    required String eventId,
    required String ticketTypeId,
    required int quantity,
    required PaymentMethod paymentMethod,
    Map<String, dynamic>? metadata,
  }) = _PurchaseTicketRequest;

  factory PurchaseTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$PurchaseTicketRequestFromJson(json);
}

@freezed
class PurchaseResult with _$PurchaseResult {
  const factory PurchaseResult({
    required String transactionId,
    required List<TicketEntity> tickets,
    required double totalAmount,
    required PaymentStatus paymentStatus,
    String? paymentReference,
  }) = _PurchaseResult;

  factory PurchaseResult.fromJson(Map<String, dynamic> json) =>
      _$PurchaseResultFromJson(json);
}

enum PaymentMethod {
  chapa, // Ethiopian payment gateway
  telebirr, // Ethiopian mobile payment
}

enum PaymentStatus {
  pending,
  completed,
  failed,
  cancelled,
}

extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.chapa:
        return 'Chapa';
      case PaymentMethod.telebirr:
        return 'Telebirr';
    }
  }
}

extension PaymentStatusExtension on PaymentStatus {
  String get displayName {
    switch (this) {
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.completed:
        return 'Completed';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.cancelled:
        return 'Cancelled';
    }
  }
}