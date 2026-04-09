import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_entity.freezed.dart';

@freezed
class CheckInEntity with _$CheckInEntity {
  const factory CheckInEntity({
    required String id,
    required String ticketId,
    required String eventId,
    required String staffId,
    required DateTime checkInTime,
    required CheckInStatus status,
    required String qrCode,
    String? ticketHolderName,
    String? ticketTypeName,
    String? eventTitle,
    String? notes,
  }) = _CheckInEntity;
}

@freezed
class TicketValidationResult with _$TicketValidationResult {
  const factory TicketValidationResult({
    required bool isValid,
    required String ticketId,
    required String eventId,
    required CheckInStatus status,
    String? ticketHolderName,
    String? ticketTypeName,
    String? eventTitle,
    String? errorMessage,
    DateTime? eventDateTime,
    String? eventLocation,
  }) = _TicketValidationResult;
}

@freezed
class CheckInStats with _$CheckInStats {
  const factory CheckInStats({
    required int totalTickets,
    required int checkedIn,
    required int remaining,
    required double checkInRate,
    required DateTime lastUpdated,
  }) = _CheckInStats;
}

enum CheckInStatus {
  valid,
  alreadyUsed,
  expired,
  invalid,
  notFound,
  wrongEvent,
}

extension CheckInStatusExtension on CheckInStatus {
  String get displayName {
    switch (this) {
      case CheckInStatus.valid:
        return 'Valid';
      case CheckInStatus.alreadyUsed:
        return 'Already Used';
      case CheckInStatus.expired:
        return 'Expired';
      case CheckInStatus.invalid:
        return 'Invalid';
      case CheckInStatus.notFound:
        return 'Not Found';
      case CheckInStatus.wrongEvent:
        return 'Wrong Event';
    }
  }

  String get description {
    switch (this) {
      case CheckInStatus.valid:
        return 'Ticket is valid for entry';
      case CheckInStatus.alreadyUsed:
        return 'This ticket has already been used';
      case CheckInStatus.expired:
        return 'This ticket has expired';
      case CheckInStatus.invalid:
        return 'Invalid ticket format';
      case CheckInStatus.notFound:
        return 'Ticket not found in system';
      case CheckInStatus.wrongEvent:
        return 'Ticket is for a different event';
    }
  }
}