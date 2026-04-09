part of 'ticket_purchase_bloc.dart';

@freezed
class TicketPurchaseState with _$TicketPurchaseState {
  const factory TicketPurchaseState({
    @Default([]) List<TicketEntity> tickets,
    @Default(false) bool isLoading,
    @Default(false) bool isPurchasing,
    @Default(false) bool isProcessing,
    @Default(false) bool isValidating,
    @Default(false) bool isLoadingDetails,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    TicketEntity? selectedTicket,
    PurchaseResult? purchaseResult,
    @Default(false) bool isPurchaseSuccessful,
    @Default(false) bool isTicketCancelled,
  }) = _TicketPurchaseState;

  factory TicketPurchaseState.initial() => const TicketPurchaseState();
}