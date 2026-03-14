part of 'ticket_purchase_bloc.dart';

@freezed
class TicketPurchaseEvent with _$TicketPurchaseEvent {
  const factory TicketPurchaseEvent.purchaseTickets({
    required PurchaseTicketRequest request,
    required String userId,
  }) = _PurchaseTickets;

  const factory TicketPurchaseEvent.loadUserTickets({
    required String userId,
  }) = _LoadUserTickets;

  const factory TicketPurchaseEvent.loadEventTickets({
    required String userId,
    required String eventId,
  }) = _LoadEventTickets;

  const factory TicketPurchaseEvent.loadTicketDetails({
    required String ticketId,
    required String userId,
  }) = _LoadTicketDetails;

  const factory TicketPurchaseEvent.cancelTicket({
    required String ticketId,
    required String userId,
  }) = _CancelTicket;

  const factory TicketPurchaseEvent.checkInTicket({
    required String ticketId,
    required String userId,
  }) = _CheckInTicket;

  const factory TicketPurchaseEvent.validateTicketQR({
    required String qrCode,
  }) = _ValidateTicketQR;

  const factory TicketPurchaseEvent.refreshTickets({
    required String userId,
  }) = _RefreshTickets;
}