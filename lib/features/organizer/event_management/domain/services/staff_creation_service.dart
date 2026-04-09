import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

abstract class StaffCreationService {
  /// Create staff members for an event and generate QR codes
  Future<Either<NetworkExceptions, List<StaffMemberCreationResult>>> createEventStaff({
    required String eventId,
    required String organizerId,
    required List<CreateStaffMemberRequest> staffMembers,
  });

  /// Generate QR code for staff member to join event
  Future<Either<NetworkExceptions, String>> generateStaffQRCode({
    required String eventId,
    required String staffMemberId,
    required String staffEmail,
  });

  /// Validate staff QR code and activate staff member
  Future<Either<NetworkExceptions, StaffActivationResult>> activateStaffMember({
    required String qrCodeData,
    required String staffUserId,
  });
}

class StaffMemberCreationResult {
  final String staffMemberId;
  final String name;
  final String email;
  final String role;
  final String qrCodeData;
  final String qrCodeUrl;
  final DateTime createdAt;

  const StaffMemberCreationResult({
    required this.staffMemberId,
    required this.name,
    required this.email,
    required this.role,
    required this.qrCodeData,
    required this.qrCodeUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'staffMemberId': staffMemberId,
      'name': name,
      'email': email,
      'role': role,
      'qrCodeData': qrCodeData,
      'qrCodeUrl': qrCodeUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory StaffMemberCreationResult.fromJson(Map<String, dynamic> json) {
    return StaffMemberCreationResult(
      staffMemberId: json['staffMemberId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      qrCodeData: json['qrCodeData'] as String,
      qrCodeUrl: json['qrCodeUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

class StaffActivationResult {
  final String eventId;
  final String staffMemberId;
  final String eventTitle;
  final String role;
  final List<String> permissions;
  final DateTime activatedAt;

  const StaffActivationResult({
    required this.eventId,
    required this.staffMemberId,
    required this.eventTitle,
    required this.role,
    required this.permissions,
    required this.activatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'staffMemberId': staffMemberId,
      'eventTitle': eventTitle,
      'role': role,
      'permissions': permissions,
      'activatedAt': activatedAt.toIso8601String(),
    };
  }

  factory StaffActivationResult.fromJson(Map<String, dynamic> json) {
    return StaffActivationResult(
      eventId: json['eventId'] as String,
      staffMemberId: json['staffMemberId'] as String,
      eventTitle: json['eventTitle'] as String,
      role: json['role'] as String,
      permissions: List<String>.from(json['permissions'] as List),
      activatedAt: DateTime.parse(json['activatedAt'] as String),
    );
  }
}