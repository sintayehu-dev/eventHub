import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/repositories/ticket_purchase_repository.dart';

part 'ticket_purchase_event.dart';
part 'ticket_purchase_state.dart';
part 'ticket_purchase_bloc.freezed.dart';

@injectable
class TicketPurchaseBloc extends Bloc<TicketPurchaseEvent, TicketPurchaseState> {
  final TicketPurchaseRepository _repository;

  TicketPurchaseBloc({
    required TicketPurchaseRepository repository,
  })  : _repository = repository,
        super(const TicketPurchaseState.initial()) {
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
    emit(const TicketPurchaseState.purchasing());

    final result = await _repository.purchaseTickets(
      request: event.request,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (purchaseResult) => emit(TicketPurchaseState.purchaseSuccess(
        result: purchaseResult,
      )),
    );
  }

  Future<void> _onLoadUserTickets(
    _LoadUserTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    emit(const TicketPurchaseState.loading());

    final result = await _repository.getUserTickets(userId: event.userId);

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (tickets) => emit(TicketPurchaseState.ticketsLoaded(tickets: tickets)),
    );
  }

  Future<void> _onLoadEventTickets(
    _LoadEventTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    emit(const TicketPurchaseState.loading());

    final result = await _repository.getEventTickets(
      userId: event.userId,
      eventId: event.eventId,
    );

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (tickets) => emit(TicketPurchaseState.ticketsLoaded(tickets: tickets)),
    );
  }

  Future<void> _onLoadTicketDetails(
    _LoadTicketDetails event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    emit(const TicketPurchaseState.loadingDetails());

    final result = await _repository.getTicketDetails(
      ticketId: event.ticketId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (ticket) => emit(TicketPurchaseState.ticketDetailsLoaded(ticket: ticket)),
    );
  }

  Future<void> _onCancelTicket(
    _CancelTicket event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    emit(const TicketPurchaseState.processing());

    final result = await _repository.cancelTicket(
      ticketId: event.ticketId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (success) {
        if (success) {
          emit(const TicketPurchaseState.ticketCancelled());
          // Refresh tickets after cancellation
          add(TicketPurchaseEvent.loadUserTickets(userId: event.userId));
        } else {
          emit(const TicketPurchaseState.error(
            message: NetworkExceptions.unexpectedError(),
          ));
        }
      },
    );
  }

  Future<void> _onCheckInTicket(
    _CheckInTicket event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    emit(const TicketPurchaseState.processing());

    final result = await _repository.checkInTicket(
      ticketId: event.ticketId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (ticket) => emit(TicketPurchaseState.ticketCheckedIn(ticket: ticket)),
    );
  }

  Future<void> _onValidateTicketQR(
    _ValidateTicketQR event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    emit(const TicketPurchaseState.validating());

    final result = await _repository.validateTicketQR(qrCode: event.qrCode);

    result.fold(
      (failure) => emit(TicketPurchaseState.error(message: failure)),
      (ticket) => emit(TicketPurchaseState.qrValidated(ticket: ticket)),
    );
  }

  Future<void> _onRefreshTickets(
    _RefreshTickets event,
    Emitter<TicketPurchaseState> emit,
  ) async {
    // Refresh based on current state
    state.maybeWhen(
      ticketsLoaded: (tickets) {
        add(TicketPurchaseEvent.loadUserTickets(userId: event.userId));
      },
      orElse: () {
        add(TicketPurchaseEvent.loadUserTickets(userId: event.userId));
      },
    );
  }
}