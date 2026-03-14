part of 'ticket_purchase_bloc.dart';

@freezed
class TicketPurchaseState with _$TicketPurchaseState {
  const factory TicketPurchaseState.initial() = _Initial;
  
  const factory TicketPurchaseState.loading() = _Loading;
  
  const factory TicketPurchaseState.loadingDetails() = _LoadingDetails;
  
  const factory TicketPurchaseState.purchasing() = _Purchasing;
  
  const factory TicketPurchaseState.processing() = _Processing;
  
  const factory TicketPurchaseState.validating() = _Validating;
  
  const factory TicketPurchaseState.ticketsLoaded({
    required List<TicketEntity> tickets,
  }) = _TicketsLoaded;
  
  const factory TicketPurchaseState.ticketDetailsLoaded({
    required TicketEntity ticket,
  }) = _TicketDetailsLoaded;
  
  const factory TicketPurchaseState.purchaseSuccess({
    required PurchaseResult result,
  }) = _PurchaseSuccess;
  
  const factory TicketPurchaseState.ticketCancelled() = _TicketCancelled;
  
  const factory TicketPurchaseState.ticketCheckedIn({
    required TicketEntity ticket,
  }) = _TicketCheckedIn;
  
  const factory TicketPurchaseState.qrValidated({
    required TicketEntity ticket,
  }) = _QrValidated;
  
  const factory TicketPurchaseState.error({
    required NetworkExceptions message,
  }) = _Error;
}