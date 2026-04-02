import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/repositories/ticket_purchase_repository.dart';
import 'package:eventhub/core/utils/local_storage.dart';

part 'ticket_purchase_event.dart';
part 'ticket_purchase_state.dart';
part 'ticket_purchase_bloc.freezed.dart';

@injectable
class TicketPurchaseBloc extends Bloc<TicketPurchaseEvent, TicketPurchaseState> {
  final TicketPurchaseRepository _repository;

  TicketPurchaseBloc({
    required TicketPurchaseRepository repository,
  })  : _repository = repository,
        super(TicketPurchaseState.initial()) {
    on<_PurchaseTickets>(_onPurchaseTickets);
    on<_LoadUserTickets>(_onLoadUserTickets);
    on<_LoadEventTickets>(_onLoadEventTickets);
    on<_LoadTicketDetails>(_onLoadTicketDetails);
    on<_CancelTicket>(_onCancelTicket);
    on<_CheckInTicket>(_onCheckInTicket);
    on<_ValidateTicketQR>(_onValidateTicketQR);
    on<_RefreshTickets>(_onRefreshTickets);
  }

  Future<void> _onPurchaseTickets(
    _PurchaseTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isPurchasing: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isPurchasing: true, hasError: false, errorMessage: ''));

    // Get user ID from local storage instead of using the passed userId
    final userId = LocalStorage.instance.getUserId();

    if (userId == null || userId.isEmpty) {
      emit(state.copyWith(
        isPurchasing: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(const NetworkExceptions.unauthorisedRequest()),
      ));
      return;
    }

    final result = await _repository.purchaseTickets(
      request: event.request,
      userId: userId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isPurchasing: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (purchaseResult) => emit(state.copyWith(
        isPurchasing: false,
        isPurchaseSuccessful: true,
        purchaseResult: purchaseResult,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadUserTickets(
    _LoadUserTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getUserTickets(userId: event.userId);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (tickets) => emit(state.copyWith(
        isLoading: false,
        tickets: tickets,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadEventTickets(
    _LoadEventTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    final result = await _repository.getEventTickets(
      userId: event.userId,
      eventId: event.eventId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (tickets) => emit(state.copyWith(
        isLoading: false,
        tickets: tickets,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadTicketDetails(
    _LoadTicketDetails event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isLoadingDetails: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoadingDetails: true, hasError: false, errorMessage: ''));

    final result = await _repository.getTicketDetails(
      ticketId: event.ticketId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingDetails: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (ticket) => emit(state.copyWith(
        isLoadingDetails: false,
        selectedTicket: ticket,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onCancelTicket(
    _CancelTicket event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isProcessing: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isProcessing: true, hasError: false, errorMessage: ''));

    final result = await _repository.cancelTicket(
      ticketId: event.ticketId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isProcessing: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (success) {
        if (success) {
          emit(state.copyWith(
            isProcessing: false,
            isTicketCancelled: true,
            hasError: false,
            errorMessage: '',
          ));
          // Refresh tickets after cancellation
          add(TicketPurchaseEvent.loadUserTickets(userId: event.userId));
        } else {
          emit(state.copyWith(
            isProcessing: false,
            hasError: true,
            errorMessage: NetworkExceptions.getRawErrorMessage(const NetworkExceptions.unexpectedError()),
          ));
        }
      },
    );
  }

  Future<void> _onCheckInTicket(
    _CheckInTicket event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isProcessing: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isProcessing: true, hasError: false, errorMessage: ''));

    final result = await _repository.checkInTicket(
      ticketId: event.ticketId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isProcessing: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (ticket) => emit(state.copyWith(
        isProcessing: false,
        selectedTicket: ticket,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onValidateTicketQR(
    _ValidateTicketQR event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        isValidating: false,
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isValidating: true, hasError: false, errorMessage: ''));

    final result = await _repository.validateTicketQR(qrCode: event.qrCode);

    result.fold(
      (failure) => emit(state.copyWith(
        isValidating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (ticket) => emit(state.copyWith(
        isValidating: false,
        selectedTicket: ticket,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onRefreshTickets(
    _RefreshTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Refresh based on current state
    if (state.tickets.isNotEmpty) {
      add(TicketPurchaseEvent.loadUserTickets(userId: event.userId));
    } else {
      add(TicketPurchaseEvent.loadUserTickets(userId: event.userId));
    }
  }
}