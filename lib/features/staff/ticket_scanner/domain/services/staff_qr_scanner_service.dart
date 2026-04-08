import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/services/staff_creation_service.dart';

abstract class StaffQRScannerService {
  /// Scan QR code to join event as staff member
  Future<Either<NetworkExceptions, StaffJoinResult>> scanStaffQRCode({
    required String qrCodeData,
    required String staffUserId,
  });

  /// Get staff member's active events
  Future<Either<NetworkExceptions, List<StaffEventInfo>>> getStaffEvents({
    required String staffUserId,
  });

  /// Leave an event as staff member
  Future<Either<NetworkExceptions, Unit>> leaveEvent({
    required String eventId,
    required String staffUserId,
  });
}

class StaffJoinResult {
  final String eventId;
  final String eventTitle;
  final String eventLocation;
  final DateTime eventDateTime;
  final String role;
  final List<String> permissions;
  final String organizerName;
  final DateTime joinedAt;

  const StaffJoinResult({
    required this.eventId,
    required this.eventTitle,
    required this.eventLocation,
    required this.eventDateTime,
    required this.role,
    required this.permissions,
    required this.organizerName,
    required this.joinedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'eventTitle': eventTitle,
      'eventLocation': eventLocation,
      'eventDateTime': eventDateTime.toIso8601String(),
      'role': role,
      'permissions': permissions,
      'organizerName': organizerName,
      'joinedAt': joinedAt.toIso8601String(),
    };
  }

  factory StaffJoinResult.fromJson(Map<String, dynamic> json) {
    return StaffJoinResult(
      eventId: json['eventId'] as String,
      eventTitle: json['eventTitle'] as String,
      eventLocation: json['eventLocation'] as String,
      eventDateTime: DateTime.parse(json['eventDateTime'] as String),
      role: json['role'] as String,
      permissions: List<String>.from(json['permissions'] as List),
      organizerName: json['organizerName'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );
  }
}

class StaffEventInfo {
  final String eventId;
  final String eventTitle;
  final String eventLocation;
  final DateTime eventDateTime;
  final String role;
  final List<String> permissions;
  final String organizerName;
  final String status; // active, completed, cancelled
  final DateTime joinedAt;

  const StaffEventInfo({
    required this.eventId,
    required this.eventTitle,
    required this.eventLocation,
    required this.eventDateTime,
    required this.role,
    required this.permissions,
    required this.organizerName,
    required this.status,
    required this.joinedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'eventTitle': eventTitle,
      'eventLocation': eventLocation,
      'eventDateTime': eventDateTime.toIso8601String(),
      'role': role,
      'permissions': permissions,
      'organizerName': organizerName,
      'status': status,
      'joinedAt': joinedAt.toIso8601String(),
    };
  }

  factory StaffEventInfo.fromJson(Map<String, dynamic> json) {
    return StaffEventInfo(
      eventId: json['eventId'] as String,
      eventTitle: json['eventTitle'] as String,
      eventLocation: json['eventLocation'] as String,
      eventDateTime: DateTime.parse(json['eventDateTime'] as String),
      role: json['role'] as String,
      permissions: List<String>.from(json['permissions'] as List),
      organizerName: json['organizerName'] as String,
      status: json['status'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );
  }
}