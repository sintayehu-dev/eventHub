part of 'ticket_scanner_bloc.dart';

@freezed
class TicketScannerState with _$TicketScannerState {
  const factory TicketScannerState({
    @Default(false) bool isLoading,
    @Default(false) bool isScanning,
    @Default(false) bool isValidating,
    @Default(false) bool isCheckingIn,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    TicketValidationResult? validationResult,
    CheckInEntity? checkInResult,
    CheckInStats? stats,
    @Default([]) List<CheckInEntity> recentCheckIns,
    @Default(false) bool isTicketValidated,
    @Default(false) bool isCheckInSuccessful,
    @Default(false) bool isCheckInFailed,
    @Default(false) bool areStatsLoaded,
  }) = _TicketScannerState;

  factory TicketScannerState.initial() => const TicketScannerState();
}