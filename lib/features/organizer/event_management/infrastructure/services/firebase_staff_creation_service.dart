import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/services/staff_creation_service.dart';

// Old QR-based implementation - replaced by FirebaseStaffUserCreationService
// @Injectable(as: StaffCreationService)
class FirebaseStaffCreationService implements StaffCreationService {
  final FirebaseFirestore _firestore;
  final Random _random = Random();

  FirebaseStaffCreationService(this._firestore);

  static const String _eventStaffCollection = 'event_staff';
  static const String _staffQRCodesCollection = 'staff_qr_codes';

  /// Generate a simple unique ID using timestamp and random number
  String _generateId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = _random.nextInt(999999);
    return '${timestamp}_$randomNum';
  }

  @override
  Future<Either<NetworkExceptions, List<StaffMemberCreationResult>>> createEventStaff({
    required String eventId,
    required String organizerId,
    required List<CreateStaffMemberRequest> staffMembers,
  }) async {
    try {
      final results = <StaffMemberCreationResult>[];
      final batch = _firestore.batch();
      final now = DateTime.now();

      for (final staffMember in staffMembers) {
        final staffMemberId = _generateId();
        
        // Generate QR code data (JSON with event and staff info)
        final qrCodeData = jsonEncode({
          'type': 'staff_join',
          'eventId': eventId,
          'staffMemberId': staffMemberId,
          'email': staffMember.email,
          'timestamp': now.millisecondsSinceEpoch,
        });

        // Create staff member document
        final staffDoc = _firestore
            .collection(_eventStaffCollection)
            .doc(staffMemberId);

        final staffData = {
          'id': staffMemberId,
          'eventId': eventId,
          'organizerId': organizerId,
          'name': staffMember.name,
          'email': staffMember.email,
          'role': staffMember.role,
          'permissions': staffMember.permissions,
          'status': 'pending', // pending, active, inactive
          'qrCodeData': qrCodeData,
          'createdAt': now.toIso8601String(),
          'updatedAt': now.toIso8601String(),
          'activatedAt': null,
          'activatedBy': null,
          'metadata': staffMember.metadata ?? {},
        };

        batch.set(staffDoc, staffData);

        // Create QR code document for easy lookup
        final qrCodeDoc = _firestore
            .collection(_staffQRCodesCollection)
            .doc(staffMemberId);

        final qrCodeDocData = {
          'staffMemberId': staffMemberId,
          'eventId': eventId,
          'organizerId': organizerId,
          'email': staffMember.email,
          'qrCodeData': qrCodeData,
          'isUsed': false,
          'createdAt': now.toIso8601String(),
          'expiresAt': now.add(const Duration(days: 30)).toIso8601String(), // QR codes expire in 30 days
        };

        batch.set(qrCodeDoc, qrCodeDocData);

        // For now, we'll use the QR code data as the URL
        // In a real implementation, you might generate an actual QR code image
        final qrCodeUrl = 'data:text/plain;base64,${base64Encode(utf8.encode(qrCodeData))}';

        results.add(StaffMemberCreationResult(
          staffMemberId: staffMemberId,
          name: staffMember.name,
          email: staffMember.email,
          role: staffMember.role,
          qrCodeData: qrCodeData,
          qrCodeUrl: qrCodeUrl,
          createdAt: now,
        ));
      }

      // Commit all changes
      await batch.commit();

      return right(results);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError('Failed to create staff members: ${e.message}'));
    } catch (e) {
      return left(NetworkExceptions.defaultError('Failed to create staff members: $e'));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> generateStaffQRCode({
    required String eventId,
    required String staffMemberId,
    required String staffEmail,
  }) async {
    try {
      final now = DateTime.now();
      
      // Generate QR code data
      final qrCodeData = jsonEncode({
        'type': 'staff_join',
        'eventId': eventId,
        'staffMemberId': staffMemberId,
        'email': staffEmail,
        'timestamp': now.millisecondsSinceEpoch,
      });

      return right(qrCodeData);
    } catch (e) {
      return left(NetworkExceptions.defaultError('Failed to generate QR code: $e'));
    }
  }

  @override
  Future<Either<NetworkExceptions, StaffActivationResult>> activateStaffMember({
    required String qrCodeData,
    required String staffUserId,
  }) async {
    try {
      // Parse QR code data
      final qrData = jsonDecode(qrCodeData) as Map<String, dynamic>;
      
      if (qrData['type'] != 'staff_join') {
        return left(NetworkExceptions.defaultError('Invalid QR code type'));
      }

      final eventId = qrData['eventId'] as String;
      final staffMemberId = qrData['staffMemberId'] as String;
      final email = qrData['email'] as String;

      // Check if QR code exists and is valid
      final qrCodeDoc = await _firestore
          .collection(_staffQRCodesCollection)
          .doc(staffMemberId)
          .get();

      if (!qrCodeDoc.exists) {
        return left(NetworkExceptions.defaultError('QR code not found'));
      }

      final qrCodeDocData = qrCodeDoc.data()!;
      
      if (qrCodeDocData['isUsed'] == true) {
        return left(NetworkExceptions.defaultError('QR code has already been used'));
      }

      final expiresAt = DateTime.parse(qrCodeDocData['expiresAt'] as String);
      if (DateTime.now().isAfter(expiresAt)) {
        return left(NetworkExceptions.defaultError('QR code has expired'));
      }

      // Get staff member document
      final staffDoc = await _firestore
          .collection(_eventStaffCollection)
          .doc(staffMemberId)
          .get();

      if (!staffDoc.exists) {
        return left(NetworkExceptions.defaultError('Staff member not found'));
      }

      final staffData = staffDoc.data()!;

      // Verify email matches
      if (staffData['email'] != email) {
        return left(NetworkExceptions.defaultError('Email mismatch'));
      }

      // Get event details
      final eventDoc = await _firestore
          .collection('events')
          .doc(eventId)
          .get();

      if (!eventDoc.exists) {
        return left(NetworkExceptions.defaultError('Event not found'));
      }

      final eventData = eventDoc.data()!;
      final now = DateTime.now();

      // Update staff member status to active
      final batch = _firestore.batch();

      batch.update(staffDoc.reference, {
        'status': 'active',
        'activatedAt': now.toIso8601String(),
        'activatedBy': staffUserId,
        'updatedAt': now.toIso8601String(),
      });

      // Mark QR code as used
      batch.update(qrCodeDoc.reference, {
        'isUsed': true,
        'usedAt': now.toIso8601String(),
        'usedBy': staffUserId,
      });

      await batch.commit();

      return right(StaffActivationResult(
        eventId: eventId,
        staffMemberId: staffMemberId,
        eventTitle: eventData['title'] as String,
        role: staffData['role'] as String,
        permissions: List<String>.from(staffData['permissions'] as List),
        activatedAt: now,
      ));
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError('Failed to activate staff member: ${e.message}'));
    } catch (e) {
      return left(NetworkExceptions.defaultError('Failed to activate staff member: $e'));
    }
  }
}