// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_member_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffMemberEntityImpl _$$StaffMemberEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$StaffMemberEntityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      organizerId: json['organizerId'] as String,
      role: $enumDecode(_$StaffRoleEnumMap, json['role']),
      status: $enumDecode(_$StaffStatusEnumMap, json['status']),
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      assignedEventIds: (json['assignedEventIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      currentEventId: json['currentEventId'] as String?,
      joinDate: DateTime.parse(json['joinDate'] as String),
      lastActiveDate: json['lastActiveDate'] == null
          ? null
          : DateTime.parse(json['lastActiveDate'] as String),
      totalEventsWorked: (json['totalEventsWorked'] as num?)?.toInt() ?? 0,
      totalHoursWorked: (json['totalHoursWorked'] as num?)?.toInt() ?? 0,
      metadata: json['metadata'] as Map<String, dynamic>?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$StaffMemberEntityImplToJson(
        _$StaffMemberEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'profileImageUrl': instance.profileImageUrl,
      'organizerId': instance.organizerId,
      'role': _$StaffRoleEnumMap[instance.role]!,
      'status': _$StaffStatusEnumMap[instance.status]!,
      'permissions': instance.permissions,
      'assignedEventIds': instance.assignedEventIds,
      'currentEventId': instance.currentEventId,
      'joinDate': instance.joinDate.toIso8601String(),
      'lastActiveDate': instance.lastActiveDate?.toIso8601String(),
      'totalEventsWorked': instance.totalEventsWorked,
      'totalHoursWorked': instance.totalHoursWorked,
      'metadata': instance.metadata,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$StaffRoleEnumMap = {
  StaffRole.admin: 'admin',
  StaffRole.manager: 'manager',
  StaffRole.coordinator: 'coordinator',
  StaffRole.scanner: 'scanner',
  StaffRole.security: 'security',
  StaffRole.support: 'support',
  StaffRole.volunteer: 'volunteer',
};

const _$StaffStatusEnumMap = {
  StaffStatus.active: 'active',
  StaffStatus.inactive: 'inactive',
  StaffStatus.suspended: 'suspended',
  StaffStatus.pending: 'pending',
  StaffStatus.invited: 'invited',
};
