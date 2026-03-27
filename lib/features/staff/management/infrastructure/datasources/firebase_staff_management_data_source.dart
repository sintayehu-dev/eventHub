import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/management/domain/entities/staff_entity.dart';

@lazySingleton
class FirebaseStaffManagementDataSource {
  final FirebaseFirestore _firestore;

  FirebaseStaffManagementDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Get all active staff members for an organizer
  Future<List<StaffEntity>> getOrganizerStaff({
    required String organizerId,
  }) async {
    try {
      // Query users collection for users with 'staff' role
      final query = await _firestore
          .collection('users')
          .where('role', isEqualTo: 'staff')
          .get();

      return query.docs.map((doc) {
        final data = doc.data();
        return _mapUserToStaff(doc.id, data);
      }).toList();
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Add a new staff member (Not needed - staff register themselves)
  /// This method is kept for interface compatibility
  Future<StaffEntity> addStaffMember({
    required String organizerId,
    required String email,
    required String name,
    required String phone,
  }) async {
    // Staff members register themselves through the normal registration flow
    // This method is not used in the current implementation
    throw const NetworkExceptions.notImplemented();
  }

  /// Update staff member status (Updates user profile)
  Future<void> updateStaffStatus({
    required String staffId,
    required StaffStatus status,
  }) async {
    try {
      // Note: In the user-based system, we don't typically change user status
      // This could be implemented by adding a 'staffStatus' field to user profiles
      // For now, we'll just update the user document if needed
      
      // Optionally update user profile with staff-specific status
      await _firestore
          .collection('users')
          .doc(staffId)
          .update({
        'staffStatus': status.value,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Helper method to map user profile data to StaffEntity
  StaffEntity _mapUserToStaff(String id, Map<String, dynamic> data) {
    final email = data['email'] ?? '';
    final displayName = data['displayName'] ?? data['name'] ?? '';
    
    // Use email prefix as name if no display name is available
    final name = displayName.isNotEmpty 
        ? displayName 
        : email.isNotEmpty 
            ? email.split('@').first.replaceAll('.', ' ').split(' ')
                .map((word) => word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : '')
                .join(' ')
            : 'Staff Member';

    return StaffEntity(
      id: id,
      email: email,
      name: name,
      phone: data['phoneNumber'] ?? data['phone'] ?? '',
      status: StaffStatus.active, // All registered staff users are considered active
      createdAt: _parseDateTime(data['createdAt']) ?? DateTime.now(),
      profileImageUrl: data['photoURL'],
      organizerId: null, // Staff users are not tied to specific organizers
    );
  }

  /// Helper method to parse DateTime from various formats
  DateTime? _parseDateTime(dynamic dateValue) {
    if (dateValue == null) return null;
    if (dateValue is Timestamp) return dateValue.toDate();
    if (dateValue is String) {
      try {
        return DateTime.parse(dateValue);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}