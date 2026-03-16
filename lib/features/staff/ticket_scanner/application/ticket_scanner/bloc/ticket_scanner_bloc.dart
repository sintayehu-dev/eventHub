import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/repositories/ticket_scanner_repository.dart';

part 'ticket_scanner_event.dart';
part 'ticket_scanner_state.dart';
part 'ticket_scanner_bloc.freezed.dart';

@injectable
class TicketScannerBloc extends Bloc<TicketScannerEvent, TicketScannerState> {
  final TicketScannerRepository _repository;

  TicketScannerBloc(this._repository) : super(const TicketScannerState.initial()) {
    on<_Started>(_onStarted);
    on<_ScanQRCode>(_onScanQRCode);
    on<_ValidateTicket>(_onValidateTicket);
    on<_CheckInTicket>(_onCheckInTicket);
    on<_LoadStats>(_onLoadStats);
    on<_LoadRecentCheckIns>(_onLoadRecentCheckIns);
    on<_ResetScanner>(_onResetScanner);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(const TicketScannerState.scanning());
  }

  Future<void> _onScanQRCode(
    _ScanQRCode event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(const TicketScannerState.validating());
    
    final result = await _repository.validateTicket(
      qrCode: event.qrCode,
      eventId: event.eventId,
      staffId: event.staffId,
    );

    result.fold(
      (error) => emit(TicketScannerState.error(error)),
      (validationResult) {
        if (validationResult.isValid) {
          emit(TicketScannerState.ticketValidated(validationResult));
        } else {
          emit(TicketScannerState.checkInFailed(validationResult));
        }
      },
    );
  }

  Future<void> _onValidateTicket(
    _ValidateTicket event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(const TicketScannerState.validating());
    
    final result = await _repository.validateTicket(
      qrCode: event.qrCode,
      eventId: event.eventId,
      staffId: event.staffId,
    );

    result.fold(
      (error) => emit(TicketScannerState.error(error)),
      (validationResult) => emit(TicketScannerState.ticketValidated(validationResult)),
    );
  }

  Future<void> _onCheckInTicket(
    _CheckInTicket event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(const TicketScannerState.checkingIn());
    
    final result = await _repository.checkInTicket(
      ticketId: event.ticketId,
      eventId: event.eventId,
      staffId: event.staffId,
      notes: event.notes,
    );

    result.fold(
      (error) => emit(TicketScannerState.error(error)),
      (checkIn) => emit(TicketScannerState.checkInSuccess(checkIn)),
    );
  }

  Future<void> _onLoadStats(
    _LoadStats event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(const TicketScannerState.loading());
    
    final statsResult = await _repository.getCheckInStats(
      eventId: event.eventId,
      staffId: event.staffId,
    );

    final recentCheckInsResult = await _repository.getRecentCheckIns(
      eventId: event.eventId,
      staffId: event.staffId,
      limit: 10,
    );

    if (statsResult.isRight() && recentCheckInsResult.isRight()) {
      final stats = statsResult.getOrElse(() => throw Exception());
      final recentCheckIns = recentCheckInsResult.getOrElse(() => throw Exception());
      
      emit(TicketScannerState.statsLoaded(
        stats: stats,
        recentCheckIns: recentCheckIns,
      ));
    } else {
      final error = statsResult.isLeft() 
          ? statsResult.fold((l) => l, (r) => throw Exception())
          : recentCheckInsResult.fold((l) => l, (r) => throw Exception());
      emit(TicketScannerState.error(error));
    }
  }

  Future<void> _onLoadRecentCheckIns(
    _LoadRecentCheckIns event,
    Emitter<TicketScannerState> emit,
  ) async {
    final result = await _repository.getRecentCheckIns(
      eventId: event.eventId,
      staffId: event.staffId,
      limit: event.limit,
    );

    result.fold(
      (error) => emit(TicketScannerState.error(error)),
      (checkIns) {
        // If we already have stats, preserve them
        state.maybeWhen(
          statsLoaded: (stats, _) => emit(TicketScannerState.statsLoaded(
            stats: stats,
            recentCheckIns: checkIns,
          )),
          orElse: () {}, // Don't emit if no stats loaded yet
        );
      },
    );
  }

  Future<void> _onResetScanner(
    _ResetScanner event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(const TicketScannerState.scanning());
  }
}