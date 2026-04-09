import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';

part 'ticket_wallet_event.dart';
part 'ticket_wallet_state.dart';
part 'ticket_wallet_bloc.freezed.dart';

@injectable
class TicketWalletBloc extends Bloc<TicketWalletEvent, TicketWalletState> {
  final TicketWalletRepository _repository;

  TicketWalletBloc({
    required TicketWalletRepository repository,
  })  : _repository = repository,
        super(TicketWalletState.initial()) {
    on<_LoadWalletTickets>(_onLoadWalletTickets);
    on<_LoadUpcomingTickets>(_onLoadUpcomingTickets);
    on<_LoadPastTickets>(_onLoadPastTickets);
    on<_LoadTicketsByStatus>(_onLoadTicketsByStatus);
    on<_SearchTickets>(_onSearchTickets);
    on<_RefreshWallet>(_onRefreshWallet);
    on<_ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadWalletTickets(
    _LoadWalletTickets event,
    Emitter<TicketWalletState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getWalletTickets(userId: event.userId);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (walletData) => emit(state.copyWith(
        walletData: walletData,
        isLoading: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadUpcomingTickets(
    _LoadUpcomingTickets event,
    Emitter<TicketWalletState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getUpcomingTickets(userId: event.userId);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (tickets) => emit(state.copyWith(
        tickets: tickets,
        filterType: TicketFilterType.upcoming,
        isLoading: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadPastTickets(
    _LoadPastTickets event,
    Emitter<TicketWalletState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getPastTickets(userId: event.userId);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (tickets) => emit(state.copyWith(
        tickets: tickets,
        filterType: TicketFilterType.past,
        isLoading: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadTicketsByStatus(
    _LoadTicketsByStatus event,
    Emitter<TicketWalletState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getTicketsByStatus(
      userId: event.userId,
      status: event.status,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (tickets) => emit(state.copyWith(
        tickets: tickets,
        filterType: TicketFilterType.byStatus,
        selectedStatus: event.status,
        isLoading: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onSearchTickets(
    _SearchTickets event,
    Emitter<TicketWalletState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isSearching: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isSearching: true, hasError: false, errorMessage: ''));

    final result = await _repository.searchTickets(
      userId: event.userId,
      query: event.query,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isSearching: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (tickets) => emit(state.copyWith(
        tickets: tickets,
        searchQuery: event.query,
        isSearching: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onRefreshWallet(
    _RefreshWallet event,
    Emitter<TicketWalletState> emit,
  ) async {
    // Refresh based on current filter type
    switch (state.filterType) {
      case TicketFilterType.upcoming:
        add(TicketWalletEvent.loadUpcomingTickets(userId: event.userId));
        break;
      case TicketFilterType.past:
        add(TicketWalletEvent.loadPastTickets(userId: event.userId));
        break;
      case TicketFilterType.byStatus:
        if (state.selectedStatus != null) {
          add(TicketWalletEvent.loadTicketsByStatus(
            userId: event.userId,
            status: state.selectedStatus!,
          ));
        }
        break;
      default:
        add(TicketWalletEvent.loadWalletTickets(userId: event.userId));
    }
  }

  void _onClearSearch(
    _ClearSearch event,
    Emitter<TicketWalletState> emit,
  ) {
    add(TicketWalletEvent.loadWalletTickets(userId: event.userId));
  }
}

enum TicketFilterType {
  all,
  upcoming,
  past,
  byStatus,
}