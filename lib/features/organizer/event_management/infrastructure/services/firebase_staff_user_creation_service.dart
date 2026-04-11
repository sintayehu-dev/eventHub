import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/services/staff_creation_service.dart';

@Injectable(as: StaffCreationService)
class FirebaseStaffUserCreationService implements StaffCreationService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final Random _random = Random();

  FirebaseStaffUserCreationService(this._firestore, this._auth);

  static const String _eventStaffCollection = 'event_staff';
  static const String _usersCollection = 'users';

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
      final now = DateTime.now();

      // Store current user to restore later
      final currentUser = _auth.currentUser;

      for (final staffMember in staffMembers) {
        try {
          // Create Firebase Auth user
          final userCredential = await _auth.createUserWithEmailAndPassword(
            email: staffMember.email,
            password: staffMember.password,
          );

          final staffUserId = userCredential.user!.uid;

          // Update user display name
          await userCredential.user!.updateDisplayName(staffMember.name);

          // Create user profile document
          await _firestore.collection(_usersCollection).doc(staffUserId).set({
            'uid': staffUserId,
            'email': staffMember.email,
            'displayName': staffMember.name,
            'role': 'staff', // Set role as staff by default
            'createdAt': now.toIso8601String(),
            'updatedAt': now.toIso8601String(),
            'isActive': true,
            'isEmailVerified': false,
            'staffData': {
              'role': staffMember.role,
              'permissions': staffMember.permissions,
              'createdBy': organizerId,
              'createdAt': now.toIso8601String(),
            },
          });

          // Create staff assignment to event
          final staffAssignmentId = _generateId();
          await _firestore.collection(_eventStaffCollection).doc(staffAssignmentId).set({
            'id': staffAssignmentId,
            'staffId': staffUserId,
            'eventId': eventId,
            'organizerId': organizerId,
            'staffName': staffMember.name,
            'staffEmail': staffMember.email,
            'role': staffMember.role,
            'permissions': staffMember.permissions,
            'status': 'active', // Immediately active since they have login credentials
            'assignedAt': now.toIso8601String(),
            'createdAt': now.toIso8601String(),
            'updatedAt': now.toIso8601String(),
          });

          results.add(StaffMemberCreationResult(
            staffMemberId: staffUserId,
            name: staffMember.name,
            email: staffMember.email,
            role: staffMember.role,
            qrCodeData: '', // Not needed for this approach
            qrCodeUrl: '', // Not needed for this approach
            createdAt: now,
          ));

          // Sign out the newly created user
          await _auth.signOut();

        } catch (e) {
          // Log error but continue with other staff members
          print('Error creating staff user ${staffMember.email}: $e');
          continue;
        }
      }

      // Restore original user session if it existed
      if (currentUser != null) {
        // Note: In a real app, you might need to re-authenticate the original user
        // For now, we'll just continue - the user might need to sign in again
      }

      return right(results);
    } on FirebaseAuthException catch (e) {
      return left(NetworkExceptions.defaultError('Failed to create staff users: ${e.message}'));
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
    // Not needed for this approach since staff login directly
    return right('');
  }

  @override
  Future<Either<NetworkExceptions, StaffActivationResult>> activateStaffMember({
    required String qrCodeData,
    required String staffUserId,
  }) async {
    // Not needed for this approach since staff are immediately active
    return left(const NetworkExceptions.defaultError('Staff activation not needed - staff login directly'));
  }
}