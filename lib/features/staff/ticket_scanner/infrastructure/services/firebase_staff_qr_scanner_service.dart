import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/services/staff_creation_service.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/services/staff_qr_scanner_service.dart';

@Injectable(as: StaffQRScannerService)
class FirebaseStaffQRScannerService implements StaffQRScannerService {
  final FirebaseFirestore _firestore;
  final StaffCreationService _staffCreationService;

  FirebaseStaffQRScannerService(
    this._firestore,
    this._staffCreationService,
  );

  static const String _eventStaffCollection = 'event_staff';
  static const String _eventsCollection = 'events';
  static const String _usersCollection = 'users';

  @override
  Future<Either<NetworkExceptions, StaffJoinResult>> scanStaffQRCode({
    required String qrCodeData,
    required String staffUserId,
  }) async {
    try {
      // Use the staff creation service to activate the staff member
      final activationResult = await _staffCreationService.activateStaffMember(
        qrCodeData: qrCodeData,
        staffUserId: staffUserId,
      );

      return activationResult.fold(
        (failure) => left(failure),
        (activation) async {
          // Get additional event details for the result
          final eventDoc = await _firestore
              .collection(_eventsCollection)
              .doc(activation.eventId)
              .get();

          if (!eventDoc.exists) {
            return left(NetworkExceptions.defaultError('Event not found'));
          }

          final eventData = eventDoc.data()!;

          // Get organizer name
          final organizerName = eventData['organizerName'] as String? ?? 'Unknown Organizer';

          return right(StaffJoinResult(
            eventId: activation.eventId,
            eventTitle: activation.eventTitle,
            eventLocation: eventData['location'] as String,
            eventDateTime: DateTime.parse(eventData['dateTime'] as String),
            role: activation.role,
            permissions: activation.permissions,
            organizerName: organizerName,
            joinedAt: activation.activatedAt,
          ));
        },
      );
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError('Failed to scan QR code: ${e.message}'));
    } catch (e) {
      return left(NetworkExceptions.defaultError('Failed to scan QR code: $e'));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<StaffEventInfo>>> getStaffEvents({
    required String staffUserId,
  }) async {
    try {
      // Get all active staff assignments for this user
      final staffQuery = await _firestore
          .collection(_eventStaffCollection)
          .where('activatedBy', isEqualTo: staffUserId)
          .where('status', isEqualTo: 'active')
          .get();

      final staffEvents = <StaffEventInfo>[];

      for (final staffDoc in staffQuery.docs) {
        final staffData = staffDoc.data();
        final eventId = staffData['eventId'] as String;

        // Get event details
        final eventDoc = await _firestore
            .collection(_eventsCollection)
            .doc(eventId)
            .get();

        if (eventDoc.exists) {
          final eventData = eventDoc.data()!;

          staffEvents.add(StaffEventInfo(
            eventId: eventId,
            eventTitle: eventData['title'] as String,
            eventLocation: eventData['location'] as String,
            eventDateTime: DateTime.parse(eventData['dateTime'] as String),
            role: staffData['role'] as String,
            permissions: List<String>.from(staffData['permissions'] as List),
            organizerName: eventData['organizerName'] as String? ?? 'Unknown Organizer',
            status: eventData['status'] as String,
            joinedAt: DateTime.parse(staffData['activatedAt'] as String),
          ));
        }
      }

      // Sort by event date (upcoming first)
      staffEvents.sort((a, b) => a.eventDateTime.compareTo(b.eventDateTime));

      return right(staffEvents);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError('Failed to get staff events: ${e.message}'));
    } catch (e) {
      return left(NetworkExceptions.defaultError('Failed to get staff events: $e'));
    }
  }

  @override
  Future<Either<NetworkExceptions, Unit>> leaveEvent({
    required String eventId,
    required String staffUserId,
  }) async {
    try {
      // Find the staff assignment for this user and event
      final staffQuery = await _firestore
          .collection(_eventStaffCollection)
          .where('eventId', isEqualTo: eventId)
          .where('activatedBy', isEqualTo: staffUserId)
          .where('status', isEqualTo: 'active')
          .get();

      if (staffQuery.docs.isEmpty) {
        return left(NetworkExceptions.defaultError('Staff assignment not found'));
      }

      final staffDoc = staffQuery.docs.first;
      final now = DateTime.now();

      // Update status to inactive
      await staffDoc.reference.update({
        'status': 'inactive',
        'leftAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(NetworkExceptions.defaultError('Failed to leave event: ${e.message}'));
    } catch (e) {
      return left(NetworkExceptions.defaultError('Failed to leave event: $e'));
    }
  }
}