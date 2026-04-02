import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

part 'attendee_entity.freezed.dart';
part 'attendee_entity.g.dart';

@freezed
class AttendeeEntity with _$AttendeeEntity {
  const factory AttendeeEntity({
    required String id,
    required String userId,
    required String name,
    required String email,
    String? phone,
    String? profileImageUrl,
    required String eventId,
    required String eventTitle,
    required List<TicketEntity> tickets,
    required AttendeeStatus status,
    required DateTime registrationDate,
    DateTime? checkInDate,
    @Default(0) int totalTickets,
    @Default(0.0) double totalSpent,
    Map<String, dynamic>? metadata,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AttendeeEntity;

  factory AttendeeEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendeeEntityFromJson(json);

  const AttendeeEntity._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'eventId': eventId,
      'eventTitle': eventTitle,
      'tickets': tickets.map((t) => t.toFirestoreData()).toList(),
      'status': status.name,
      'registrationDate': registrationDate.toIso8601String(),
      'checkInDate': checkInDate?.toIso8601String(),
      'totalTickets': totalTickets,
      'totalSpent': totalSpent,
      'metadata': metadata,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create from Firestore document data
  factory AttendeeEntity.fromFirestoreData(Map<String, dynamic> data) {
    return AttendeeEntity(
      id: data['id'] as String,
      userId: data['userId'] as String,
      name: data['name'] as String,
      email: data['email'] as String,
      phone: data['phone'] as String?,
      profileImageUrl: data['profileImageUrl'] as String?,
      eventId: data['eventId'] as String,
      eventTitle: data['eventTitle'] as String,
      tickets: (data['tickets'] as List<dynamic>)
          .map((t) => TicketEntity.fromFirestoreData(t as Map<String, dynamic>))
          .toList(),
      status: AttendeeStatus.values.firstWhere((e) => e.name == data['status']),
      registrationDate: DateTime.parse(data['registrationDate'] as String),
      checkInDate: data['checkInDate'] != null
          ? DateTime.parse(data['checkInDate'] as String)
          : null,
      totalTickets: data['totalTickets'] as int? ?? 0,
      totalSpent: (data['totalSpent'] as num?)?.toDouble() ?? 0.0,
      metadata: data['metadata'] as Map<String, dynamic>?,
      notes: data['notes'] as String?,
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
    );
  }

  bool get hasCheckedIn => checkInDate != null;
  bool get isActive => status == AttendeeStatus.confirmed;
  bool get hasMultipleTickets => totalTickets > 1;
}

enum AttendeeStatus {
  registered,
  confirmed,
  checkedIn,
  cancelled,
  refunded,
  noShow,
}

extension AttendeeStatusExtension on AttendeeStatus {
  String get displayName {
    switch (this) {
      case AttendeeStatus.registered:
        return 'Registered';
      case AttendeeStatus.confirmed:
        return 'Confirmed';
      case AttendeeStatus.checkedIn:
        return 'Checked In';
      case AttendeeStatus.cancelled:
        return 'Cancelled';
      case AttendeeStatus.refunded:
        return 'Refunded';
      case AttendeeStatus.noShow:
        return 'No Show';
    }
  }

  bool get isActive {
    return this == AttendeeStatus.confirmed || 
           this == AttendeeStatus.registered ||
           this == AttendeeStatus.checkedIn;
  }
}

enum MessageType {
  email,
  sms,
  push,
  inApp,
}

extension MessageTypeExtension on MessageType {
  String get displayName {
    switch (this) {
      case MessageType.email:
        return 'Email';
      case MessageType.sms:
        return 'SMS';
      case MessageType.push:
        return 'Push Notification';
      case MessageType.inApp:
        return 'In-App Message';
    }
  }
}

enum ExportFormat {
  csv,
  excel,
  pdf,
}

extension ExportFormatExtension on ExportFormat {
  String get displayName {
    switch (this) {
      case ExportFormat.csv:
        return 'CSV';
      case ExportFormat.excel:
        return 'Excel';
      case ExportFormat.pdf:
        return 'PDF';
    }
  }

  String get fileExtension {
    switch (this) {
      case ExportFormat.csv:
        return '.csv';
      case ExportFormat.excel:
        return '.xlsx';
      case ExportFormat.pdf:
        return '.pdf';
    }
  }
}