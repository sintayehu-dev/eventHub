import 'package:eventhub/features/staff/management/domain/entities/staff_entity.dart';

class StaffEntity {
  final String id;
  final String email;
  final String name;
  final String phone;
  final StaffStatus status;
  final DateTime createdAt;
  final String? profileImageUrl;
  final String? organizerId;

  const StaffEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.status,
    required this.createdAt,
    this.profileImageUrl,
    this.organizerId,
  });
}

enum StaffStatus {
  active,
  inactive,
  pending,
}

extension StaffStatusExtension on StaffStatus {
  String get displayName {
    switch (this) {
      case StaffStatus.active:
        return 'Active';
      case StaffStatus.inactive:
        return 'Inactive';
      case StaffStatus.pending:
        return 'Pending';
    }
  }

  String get value {
    switch (this) {
      case StaffStatus.active:
        return 'active';
      case StaffStatus.inactive:
        return 'inactive';
      case StaffStatus.pending:
        return 'pending';
    }
  }
}