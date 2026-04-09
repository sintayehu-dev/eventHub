import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendee_entity.freezed.dart';

@freezed
class AttendeeEntity with _$AttendeeEntity {
  const factory AttendeeEntity({
    required String id,
    required String userId,
    required String eventId,
    required String name,
    required String email,
    String? phone,
    required String ticketId,
    required String ticketType,
    required AttendeeStatus status,
    required DateTime registrationDate,
    DateTime? checkInTime,
    String? checkInStaffId,
    String? notes,
    Map<String, dynamic>? metadata,
  }) = _AttendeeEntity;
}

@freezed
class AttendeeSearchResult with _$AttendeeSearchResult {
  const factory AttendeeSearchResult({
    required List<AttendeeEntity> attendees,
    required int totalCount,
    required bool hasMore,
    String? nextCursor,
  }) = _AttendeeSearchResult;
}

@freezed
class AttendeeStats with _$AttendeeStats {
  const factory AttendeeStats({
    required int totalRegistered,
    required int checkedIn,
    required int noShow,
    required int cancelled,
    required double checkInRate,
    required DateTime lastUpdated,
  }) = _AttendeeStats;
}

enum AttendeeStatus {
  registered,
  checkedIn,
  noShow,
  cancelled,
}

extension AttendeeStatusExtension on AttendeeStatus {
  String get displayName {
    switch (this) {
      case AttendeeStatus.registered:
        return 'Registered';
      case AttendeeStatus.checkedIn:
        return 'Checked In';
      case AttendeeStatus.noShow:
        return 'No Show';
      case AttendeeStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get description {
    switch (this) {
      case AttendeeStatus.registered:
        return 'Registered for the event';
      case AttendeeStatus.checkedIn:
        return 'Successfully checked in';
      case AttendeeStatus.noShow:
        return 'Did not attend the event';
      case AttendeeStatus.cancelled:
        return 'Registration cancelled';
    }
  }
}