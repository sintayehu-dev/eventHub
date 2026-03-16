part of 'ticket_scanner_bloc.dart';

@freezed
class TicketScannerEvent with _$TicketScannerEvent {
  const factory TicketScannerEvent.started() = _Started;
  
  const factory TicketScannerEvent.scanQRCode({
    required String qrCode,
    required String eventId,
    required String staffId,
  }) = _ScanQRCode;
  
  const factory TicketScannerEvent.validateTicket({
    required String qrCode,
    required String eventId,
    required String staffId,
  }) = _ValidateTicket;
  
  const factory TicketScannerEvent.checkInTicket({
    required String ticketId,
    required String eventId,
    required String staffId,
    String? notes,
  }) = _CheckInTicket;
  
  const factory TicketScannerEvent.loadStats({
    required String eventId,
    required String staffId,
  }) = _LoadStats;
  
  const factory TicketScannerEvent.loadRecentCheckIns({
    required String eventId,
    required String staffId,
    @Default(10) int limit,
  }) = _LoadRecentCheckIns;
  
  const factory TicketScannerEvent.resetScanner() = _ResetScanner;
}