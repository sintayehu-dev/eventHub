import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_member_entity.freezed.dart';
part 'staff_member_entity.g.dart';

@freezed
class StaffMemberEntity with _$StaffMemberEntity {
  const factory StaffMemberEntity({
    required String id,
    required String userId,
    required String name,
    required String email,
    String? phone,
    String? profileImageUrl,
    required String organizerId,
    required StaffRole role,
    required StaffStatus status,
    required List<String> permissions,
    required List<String> assignedEventIds,
    String? currentEventId,
    required DateTime joinDate,
    DateTime? lastActiveDate,
    @Default(0) int totalEventsWorked,
    @Default(0) int totalHoursWorked,
    Map<String, dynamic>? metadata,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StaffMemberEntity;

  factory StaffMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$StaffMemberEntityFromJson(json);

  const StaffMemberEntity._();

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'organizerId': organizerId,
      'role': role.name,
      'status': status.name,
      'permissions': permissions,
      'assignedEventIds': assignedEventIds,
      'currentEventId': currentEventId,
      'joinDate': joinDate.toIso8601String(),
      'lastActiveDate': lastActiveDate?.toIso8601String(),
      'totalEventsWorked': totalEventsWorked,
      'totalHoursWorked': totalHoursWorked,
      'metadata': metadata,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create from Firestore document data
  factory StaffMemberEntity.fromFirestoreData(Map<String, dynamic> data) {
    return StaffMemberEntity(
      id: data['id'] as String,
      userId: data['userId'] as String,
      name: data['name'] as String,
      email: data['email'] as String,
      phone: data['phone'] as String?,
      profileImageUrl: data['profileImageUrl'] as String?,
      organizerId: data['organizerId'] as String,
      role: StaffRole.values.firstWhere((e) => e.name == data['role']),
      status: StaffStatus.values.firstWhere((e) => e.name == data['status']),
      permissions: List<String>.from(data['permissions'] as List),
      assignedEventIds: List<String>.from(data['assignedEventIds'] as List),
      currentEventId: data['currentEventId'] as String?,
      joinDate: DateTime.parse(data['joinDate'] as String),
      lastActiveDate: data['lastActiveDate'] != null
          ? DateTime.parse(data['lastActiveDate'] as String)
          : null,
      totalEventsWorked: data['totalEventsWorked'] as int? ?? 0,
      totalHoursWorked: data['totalHoursWorked'] as int? ?? 0,
      metadata: data['metadata'] as Map<String, dynamic>?,
      notes: data['notes'] as String?,
      createdAt: DateTime.parse(data['createdAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
    );
  }

  bool get isActive => status == StaffStatus.active;
  bool get isAssignedToEvent => currentEventId != null;
  bool get hasPermission => permissions.isNotEmpty;
  bool get isManager => false; // No manager role anymore, all are staff
}

enum StaffRole {
  staff,
}

extension StaffRoleExtension on StaffRole {
  String get displayName {
    switch (this) {
      case StaffRole.staff:
        return 'Staff';
    }
  }

  List<String> get defaultPermissions {
    switch (this) {
      case StaffRole.staff:
        return ['scan_tickets', 'view_attendees'];
    }
  }

  int get hierarchyLevel {
    switch (this) {
      case StaffRole.staff:
        return 1;
    }
  }
}

enum StaffStatus {
  active,
  inactive,
  suspended,
  pending,
  invited,
}

extension StaffStatusExtension on StaffStatus {
  String get displayName {
    switch (this) {
      case StaffStatus.active:
        return 'Active';
      case StaffStatus.inactive:
        return 'Inactive';
      case StaffStatus.suspended:
        return 'Suspended';
      case StaffStatus.pending:
        return 'Pending';
      case StaffStatus.invited:
        return 'Invited';
    }
  }

  bool get canWork {
    return this == StaffStatus.active;
  }

  bool get needsAction {
    return this == StaffStatus.pending || this == StaffStatus.invited;
  }
}

class StaffInvitation {
  final String id;
  final String organizerId;
  final String email;
  final StaffRole role;
  final List<String> permissions;
  final List<String> eventIds;
  final DateTime invitedAt;
  final DateTime expiresAt;
  final String inviteToken;
  final bool isAccepted;

  const StaffInvitation({
    required this.id,
    required this.organizerId,
    required this.email,
    required this.role,
    required this.permissions,
    required this.eventIds,
    required this.invitedAt,
    required this.expiresAt,
    required this.inviteToken,
    required this.isAccepted,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
  bool get isValid => !isExpired && !isAccepted;
}