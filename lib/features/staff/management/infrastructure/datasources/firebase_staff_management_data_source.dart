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
      final query = await _firestore
          .collection('staff_members')
          .where('organizerId', isEqualTo: organizerId)
          .where('status', isEqualTo: 'active')
          .orderBy('name')
          .get();

      return query.docs.map((doc) {
        final data = doc.data();
        return _mapFirestoreToStaff(doc.id, data);
      }).toList();
    } catch (e) {
      // Return hardcoded staff for development
      return [
        StaffEntity(
          id: 'staff_1',
          email: 'john.scanner@example.com',
          name: 'John Scanner',
          phone: '+1234567890',
          status: StaffStatus.active,
          createdAt: DateTime.now(),
          organizerId: organizerId,
        ),
        StaffEntity(
          id: 'staff_2',
          email: 'jane.supervisor@example.com',
          name: 'Jane Supervisor',
          phone: '+1234567891',
          status: StaffStatus.active,
          createdAt: DateTime.now(),
          organizerId: organizerId,
        ),
        StaffEntity(
          id: 'staff_3',
          email: 'mike.manager@example.com',
          name: 'Mike Manager',
          phone: '+1234567892',
          status: StaffStatus.active,
          createdAt: DateTime.now(),
          organizerId: organizerId,
        ),
      ];
    }
  }

  /// Add a new staff member
  Future<StaffEntity> addStaffMember({
    required String organizerId,
    required String email,
    required String name,
    required String phone,
  }) async {
    try {
      final staffRef = _firestore.collection('staff_members').doc();
      final now = Timestamp.now();
      
      final staffData = {
        'email': email,
        'name': name,
        'phone': phone,
        'status': 'active',
        'organizerId': organizerId,
        'createdAt': now,
        'updatedAt': now,
      };

      await staffRef.set(staffData);

      return StaffEntity(
        id: staffRef.id,
        email: email,
        name: name,
        phone: phone,
        status: StaffStatus.active,
        createdAt: now.toDate(),
        organizerId: organizerId,
      );
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update staff member status
  Future<void> updateStaffStatus({
    required String staffId,
    required StaffStatus status,
  }) async {
    try {
      await _firestore
          .collection('staff_members')
          .doc(staffId)
          .update({
        'status': status.value,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Helper method to map Firestore data to StaffEntity
  StaffEntity _mapFirestoreToStaff(String id, Map<String, dynamic> data) {
    return StaffEntity(
      id: id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      status: _mapStringToStatus(data['status'] ?? 'active'),
      createdAt: _parseDateTime(data['createdAt']) ?? DateTime.now(),
      profileImageUrl: data['profileImageUrl'],
      organizerId: data['organizerId'],
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

  /// Helper method to map string to StaffStatus
  StaffStatus _mapStringToStatus(String status) {
    switch (status.toLowerCase()) {
      case 'inactive':
        return StaffStatus.inactive;
      case 'pending':
        return StaffStatus.pending;
      case 'active':
      default:
        return StaffStatus.active;
    }
  }
}