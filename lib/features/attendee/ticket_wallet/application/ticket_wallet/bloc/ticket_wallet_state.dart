part of 'ticket_wallet_bloc.dart';

@freezed
class TicketWalletState with _$TicketWalletState {
  const factory TicketWalletState.initial() = _Initial;
  
  const factory TicketWalletState.loading() = _Loading;
  
  const factory TicketWalletState.searching() = _Searching;
  
  const factory TicketWalletState.loaded({
    required TicketWalletData walletData,
  }) = _Loaded;
  
  const factory TicketWalletState.ticketsLoaded({
    required List<TicketEntity> tickets,
    required TicketFilterType filterType,
    TicketStatus? selectedStatus,
  }) = _TicketsLoaded;
  
  const factory TicketWalletState.searchResults({
    required List<TicketEntity> tickets,
    required String query,
  }) = _SearchResults;
  
  const factory TicketWalletState.error({
    required NetworkExceptions message,
  }) = _Error;
}

// TicketWalletData is imported from the repository