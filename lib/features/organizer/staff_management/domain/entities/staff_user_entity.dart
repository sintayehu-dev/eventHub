import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_user_entity.freezed.dart';

@freezed
class StaffUserEntity with _$StaffUserEntity {
  const factory StaffUserEntity({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? profileImageUrl,
    required StaffUserStatus status,
    required DateTime createdAt,
    DateTime? lastActiveAt,
    List<String>? specializations, // e.g., ['ticket_scanning', 'crowd_control', 'vip_services']
  }) = _StaffUserEntity;
}

enum StaffUserStatus {
  active,
  inactive,
  suspended,
}

extension StaffUserStatusExtension on StaffUserStatus {
  String get displayName {
    switch (this) {
      case StaffUserStatus.active:
        return 'Active';
      case StaffUserStatus.inactive:
        return 'Inactive';
      case StaffUserStatus.suspended:
        return 'Suspended';
    }
  }

  bool get isAvailable => this == StaffUserStatus.active;
}