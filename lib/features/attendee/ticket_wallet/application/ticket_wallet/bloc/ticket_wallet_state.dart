part of 'ticket_wallet_bloc.dart';

@freezed
class TicketWalletState with _$TicketWalletState {
  const factory TicketWalletState({
    @Default([]) List<TicketEntity> tickets,
    TicketWalletData? walletData,
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(TicketFilterType.all) TicketFilterType filterType,
    TicketStatus? selectedStatus,
    @Default('') String searchQuery,
  }) = _TicketWalletState;

  factory TicketWalletState.initial() => const TicketWalletState();
}

// TicketWalletData is imported from the repository