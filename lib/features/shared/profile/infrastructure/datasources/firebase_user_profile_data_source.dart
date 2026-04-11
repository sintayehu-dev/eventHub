import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/services/cloudinary_service.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';

@LazySingleton()
class FirebaseUserProfileDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final CloudinaryService _cloudinaryService;

  FirebaseUserProfileDataSource({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
    required CloudinaryService cloudinaryService,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance,
        _cloudinaryService = cloudinaryService;

  /// Get user profile from Firestore
  Future<UserProfileEntity> getUserProfile({
    required String userId,
  }) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();
      
      if (!userDoc.exists) {
        // Create a default profile for new users
        return await _createDefaultProfile(userId);
      }

      final userData = userDoc.data()!;
      return _mapFirestoreToUserProfile(userId, userData);
    } catch (e) {
      if (e is NetworkExceptions) rethrow;
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Create a default profile for new users
  Future<UserProfileEntity> _createDefaultProfile(String userId) async {
    try {
      // Get user info from Firebase Auth
      final currentUser = _auth.currentUser;
      final email = currentUser?.email ?? '';
      final name = currentUser?.displayName ?? currentUser?.email?.split('@').first ?? 'User';
      
      final defaultProfile = UserProfileEntity(
        id: userId,
        email: email,
        name: name,
        role: UserRole.attendee, // Default role
        phone: currentUser?.phoneNumber,
        profileImageUrl: currentUser?.photoURL,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
        status: UserProfileStatus.active,
        preferences: const UserPreferences(
          notificationsEnabled: true,
          emailNotifications: true,
          pushNotifications: true,
          soundEnabled: false,
          vibrationEnabled: false,
          language: 'en',
          theme: 'system',
        ),
        staffData: null,
        organizerData: null,
        attendeeData: const AttendeeProfileData(
          interests: [],
          totalEventsAttended: 0,
          favoriteEventTypes: [],
          dateOfBirth: null,
          emergencyContact: null,
          emergencyContactPhone: null,
        ),
      );

      // Save the default profile to Firestore
      final profileData = _mapUserProfileToFirestore(defaultProfile);
      profileData['createdAt'] = DateTime.now().toIso8601String();
      profileData['updatedAt'] = DateTime.now().toIso8601String();

      await _firestore.collection('users').doc(userId).set(profileData);

      return defaultProfile;
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update user profile in Firestore
  Future<UserProfileEntity> updateUserProfile({
    required String userId,
    required UserProfileEntity profile,
  }) async {
    try {
      final updateData = _mapUserProfileToFirestore(profile);
      
      await _firestore.collection('users').doc(userId).update({
        ...updateData,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return await getUserProfile(userId: userId);
    } catch (e) {
      if (e is NetworkExceptions) rethrow;
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update user preferences
  Future<UserPreferences> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'preferences': _mapPreferencesToFirestore(preferences),
        'updatedAt': DateTime.now().toIso8601String(),
      });

      final userDoc = await _firestore.collection('users').doc(userId).get();
      final userData = userDoc.data()!;
      return _mapFirestoreToPreferences(userData['preferences'] ?? {});
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update profile image
  Future<String> updateProfileImage({
    required String userId,
    required String imagePath,
  }) async {
    try {
      // Upload image to Cloudinary
      final imageUrl = await _cloudinaryService.uploadImage(
        imagePath: imagePath,
        folder: 'eventhub/profile_images',
        publicId: 'profile_$userId',
      );

      // Update Firestore with the Cloudinary URL
      await _firestore.collection('users').doc(userId).update({
        'photoURL': imageUrl,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return imageUrl;
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update user status
  Future<void> updateUserStatus({
    required String userId,
    required UserProfileStatus status,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'status': status.name,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get current event assignment for staff
  Future<CurrentEventAssignment?> getCurrentEventAssignment({
    required String staffId,
  }) async {
    try {
      final assignmentsQuery = await _firestore
          .collection('staff_event_assignments')
          .where('staffId', isEqualTo: staffId)
          .where('isActive', isEqualTo: true)
          .orderBy('eventDateTime', descending: false)
          .limit(1)
          .get();

      if (assignmentsQuery.docs.isEmpty) {
        return null;
      }

      final assignmentData = assignmentsQuery.docs.first.data();
      
      // Get event details
      final eventDoc = await _firestore
          .collection('events')
          .doc(assignmentData['eventId'])
          .get();

      if (!eventDoc.exists) {
        return null;
      }

      final eventData = eventDoc.data()!;
      
      return CurrentEventAssignment(
        eventId: assignmentData['eventId'],
        eventTitle: eventData['title'] ?? 'Unknown Event',
        eventLocation: eventData['location'] ?? 'Unknown Location',
        eventDate: _parseDateTime(eventData['dateTime']) ?? DateTime.now(),
        assignedRole: assignmentData['role'] ?? 'staff',
        assignedGate: assignmentData['assignedGate'],
        shiftStart: _parseDateTime(assignmentData['shiftStart']),
        shiftEnd: _parseDateTime(assignmentData['shiftEnd']),
        status: _parseEventAssignmentStatus(assignmentData['status']),
        notes: assignmentData['notes'],
      );
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update staff-specific data
  Future<StaffProfileData> updateStaffData({
    required String userId,
    required StaffProfileData staffData,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'staffData': _mapStaffDataToFirestore(staffData),
        'updatedAt': DateTime.now().toIso8601String(),
      });

      final userDoc = await _firestore.collection('users').doc(userId).get();
      final userData = userDoc.data()!;
      return _mapFirestoreToStaffData(userData['staffData'] ?? {});
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update organizer-specific data
  Future<OrganizerProfileData> updateOrganizerData({
    required String userId,
    required OrganizerProfileData organizerData,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'organizerData': _mapOrganizerDataToFirestore(organizerData),
        'updatedAt': DateTime.now().toIso8601String(),
      });

      final userDoc = await _firestore.collection('users').doc(userId).get();
      final userData = userDoc.data()!;
      return _mapFirestoreToOrganizerData(userData['organizerData'] ?? {});
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update attendee-specific data
  Future<AttendeeProfileData> updateAttendeeData({
    required String userId,
    required AttendeeProfileData attendeeData,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'attendeeData': _mapAttendeeDataToFirestore(attendeeData),
        'updatedAt': DateTime.now().toIso8601String(),
      });

      final userDoc = await _firestore.collection('users').doc(userId).get();
      final userData = userDoc.data()!;
      return _mapFirestoreToAttendeeData(userData['attendeeData'] ?? {});
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Map Firestore data to UserProfileEntity
  UserProfileEntity _mapFirestoreToUserProfile(String id, Map<String, dynamic> data) {
    final role = _parseUserRole(data['role']);
    
    return UserProfileEntity(
      id: id,
      email: data['email'] ?? '',
      name: data['displayName'] ?? data['name'] ?? '',
      role: role,
      phone: data['phoneNumber'] ?? data['phone'],
      profileImageUrl: data['photoURL'],
      createdAt: _parseDateTime(data['createdAt']),
      lastLoginAt: _parseDateTime(data['lastLoginAt']),
      status: _parseUserProfileStatus(data['status']),
      preferences: _mapFirestoreToPreferences(data['preferences'] ?? {}),
      staffData: role == UserRole.staff 
          ? _mapFirestoreToStaffData(data['staffData'] ?? {})
          : null,
      organizerData: role == UserRole.organizer 
          ? _mapFirestoreToOrganizerData(data['organizerData'] ?? {})
          : null,
      attendeeData: role == UserRole.attendee 
          ? _mapFirestoreToAttendeeData(data['attendeeData'] ?? {})
          : null,
    );
  }

  /// Map UserProfileEntity to Firestore data
  Map<String, dynamic> _mapUserProfileToFirestore(UserProfileEntity profile) {
    final data = <String, dynamic>{
      'email': profile.email,
      'displayName': profile.name,
      'name': profile.name,
      'role': profile.role.name,
      'status': profile.status.name,
      'preferences': _mapPreferencesToFirestore(profile.preferences),
    };

    if (profile.phone != null) data['phoneNumber'] = profile.phone;
    if (profile.profileImageUrl != null) data['photoURL'] = profile.profileImageUrl;
    if (profile.staffData != null) data['staffData'] = _mapStaffDataToFirestore(profile.staffData!);
    if (profile.organizerData != null) data['organizerData'] = _mapOrganizerDataToFirestore(profile.organizerData!);
    if (profile.attendeeData != null) data['attendeeData'] = _mapAttendeeDataToFirestore(profile.attendeeData!);

    return data;
  }

  /// Map preferences to/from Firestore
  Map<String, dynamic> _mapPreferencesToFirestore(UserPreferences preferences) {
    return {
      'notificationsEnabled': preferences.notificationsEnabled,
      'emailNotifications': preferences.emailNotifications,
      'pushNotifications': preferences.pushNotifications,
      'soundEnabled': preferences.soundEnabled,
      'vibrationEnabled': preferences.vibrationEnabled,
      'language': preferences.language,
      'theme': preferences.theme,
    };
  }

  UserPreferences _mapFirestoreToPreferences(Map<String, dynamic> data) {
    return UserPreferences(
      notificationsEnabled: data['notificationsEnabled'] ?? true,
      emailNotifications: data['emailNotifications'] ?? true,
      pushNotifications: data['pushNotifications'] ?? true,
      soundEnabled: data['soundEnabled'] ?? false,
      vibrationEnabled: data['vibrationEnabled'] ?? false,
      language: data['language'] ?? 'en',
      theme: data['theme'] ?? 'system',
    );
  }

  /// Map staff data to/from Firestore
  Map<String, dynamic> _mapStaffDataToFirestore(StaffProfileData staffData) {
    return {
      'specializations': staffData.specializations,
      'totalEventsWorked': staffData.totalEventsWorked,
      'totalCheckIns': staffData.totalCheckIns,
      'averageRating': staffData.averageRating,
      'totalHoursWorked': staffData.totalHoursWorked,
    };
  }

  StaffProfileData _mapFirestoreToStaffData(Map<String, dynamic> data) {
    return StaffProfileData(
      specializations: List<String>.from(data['specializations'] ?? []),
      totalEventsWorked: data['totalEventsWorked'] ?? 0,
      totalCheckIns: data['totalCheckIns'] ?? 0,
      averageRating: (data['averageRating'] ?? 0.0).toDouble(),
      totalHoursWorked: data['totalHoursWorked'] ?? 0,
    );
  }

  /// Map organizer data to/from Firestore
  Map<String, dynamic> _mapOrganizerDataToFirestore(OrganizerProfileData organizerData) {
    return {
      'organizationName': organizerData.organizationName,
      'website': organizerData.website,
      'description': organizerData.description,
      'totalEventsCreated': organizerData.totalEventsCreated,
      'totalAttendeesServed': organizerData.totalAttendeesServed,
      'averageEventRating': organizerData.averageEventRating,
      'isVerified': organizerData.isVerified,
    };
  }

  OrganizerProfileData _mapFirestoreToOrganizerData(Map<String, dynamic> data) {
    return OrganizerProfileData(
      organizationName: data['organizationName'],
      website: data['website'],
      description: data['description'],
      totalEventsCreated: data['totalEventsCreated'] ?? 0,
      totalAttendeesServed: data['totalAttendeesServed'] ?? 0,
      averageEventRating: (data['averageEventRating'] ?? 0.0).toDouble(),
      isVerified: data['isVerified'] ?? false,
    );
  }

  /// Map attendee data to/from Firestore
  Map<String, dynamic> _mapAttendeeDataToFirestore(AttendeeProfileData attendeeData) {
    return {
      'interests': attendeeData.interests,
      'totalEventsAttended': attendeeData.totalEventsAttended,
      'favoriteEventTypes': attendeeData.favoriteEventTypes,
      'dateOfBirth': attendeeData.dateOfBirth,
      'emergencyContact': attendeeData.emergencyContact,
      'emergencyContactPhone': attendeeData.emergencyContactPhone,
    };
  }

  AttendeeProfileData _mapFirestoreToAttendeeData(Map<String, dynamic> data) {
    return AttendeeProfileData(
      interests: List<String>.from(data['interests'] ?? []),
      totalEventsAttended: data['totalEventsAttended'] ?? 0,
      favoriteEventTypes: List<String>.from(data['favoriteEventTypes'] ?? []),
      dateOfBirth: data['dateOfBirth'],
      emergencyContact: data['emergencyContact'],
      emergencyContactPhone: data['emergencyContactPhone'],
    );
  }

  /// Helper methods for parsing enums and dates
  UserRole _parseUserRole(dynamic role) {
    if (role == null) return UserRole.attendee;
    return UserRole.values.firstWhere(
      (r) => r.name == role.toString().toLowerCase(),
      orElse: () => UserRole.attendee,
    );
  }

  UserProfileStatus _parseUserProfileStatus(dynamic status) {
    if (status == null) return UserProfileStatus.active;
    return UserProfileStatus.values.firstWhere(
      (s) => s.name == status.toString().toLowerCase(),
      orElse: () => UserProfileStatus.active,
    );
  }

  EventAssignmentStatus _parseEventAssignmentStatus(dynamic status) {
    if (status == null) return EventAssignmentStatus.active;
    return EventAssignmentStatus.values.firstWhere(
      (s) => s.name == status.toString().toLowerCase(),
      orElse: () => EventAssignmentStatus.active,
    );
  }

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