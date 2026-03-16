part of 'ticket_scanner_bloc.dart';

@freezed
class TicketScannerState with _$TicketScannerState {
  const factory TicketScannerState.initial() = _Initial;
  
  const factory TicketScannerState.loading() = _Loading;
  
  const factory TicketScannerState.scanning() = _Scanning;
  
  const factory TicketScannerState.validating() = _Validating;
  
  const factory TicketScannerState.ticketValidated(
    TicketValidationResult validationResult,
  ) = _TicketValidated;
  
  const factory TicketScannerState.checkingIn() = _CheckingIn;
  
  const factory TicketScannerState.checkInSuccess(
    CheckInEntity checkIn,
  ) = _CheckInSuccess;
  
  const factory TicketScannerState.checkInFailed(
    TicketValidationResult validationResult,
  ) = _CheckInFailed;
  
  const factory TicketScannerState.statsLoaded({
    required CheckInStats stats,
    required List<CheckInEntity> recentCheckIns,
  }) = _StatsLoaded;
  
  const factory TicketScannerState.error(
    dynamic error,
  ) = _Error;
}