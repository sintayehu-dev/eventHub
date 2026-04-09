part of 'ticket_wallet_bloc.dart';

@freezed
class TicketWalletEvent with _$TicketWalletEvent {
  const factory TicketWalletEvent.loadWalletTickets({
    required String userId,
  }) = _LoadWalletTickets;

  const factory TicketWalletEvent.loadUpcomingTickets({
    required String userId,
  }) = _LoadUpcomingTickets;

  const factory TicketWalletEvent.loadPastTickets({
    required String userId,
  }) = _LoadPastTickets;

  const factory TicketWalletEvent.loadTicketsByStatus({
    required String userId,
    required TicketStatus status,
  }) = _LoadTicketsByStatus;

  const factory TicketWalletEvent.searchTickets({
    required String userId,
    required String query,
  }) = _SearchTickets;

  const factory TicketWalletEvent.refreshWallet({
    required String userId,
  }) = _RefreshWallet;

  const factory TicketWalletEvent.clearSearch({
    required String userId,
  }) = _ClearSearch;
}