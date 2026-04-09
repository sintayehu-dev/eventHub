import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/repositories/ticket_scanner_repository.dart';

part 'ticket_scanner_event.dart';
part 'ticket_scanner_state.dart';
part 'ticket_scanner_bloc.freezed.dart';

@injectable
class TicketScannerBloc extends Bloc<TicketScannerEvent, TicketScannerState> {
  final TicketScannerRepository _repository;

  TicketScannerBloc({
    required TicketScannerRepository repository,
  })  : _repository = repository,
        super(TicketScannerState.initial()) {
    on<_Started>(_onStarted);
    on<_ScanQRCode>(_onScanQRCode);
    on<_ValidateTicket>(_onValidateTicket);
    on<_CheckInTicket>(_onCheckInTicket);
    on<_LoadStats>(_onLoadStats);
    on<_LoadRecentCheckIns>(_onLoadRecentCheckIns);
    on<_ResetScanner>(_onResetScanner);
    on<_ClearError>(_onClearError);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(state.copyWith(
      isScanning: true,
      isLoading: false,
      hasError: false,
      errorMessage: '',
    ));
  }

  Future<void> _onScanQRCode(
    _ScanQRCode event,
    Emitter<TicketScannerState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isValidating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isValidating: true,
      hasError: false,
      errorMessage: '',
      isTicketValidated: false,
      isCheckInFailed: false,
    ));
    
    final result = await _repository.validateTicket(
      qrCode: event.qrCode,
      eventId: event.eventId,
      staffId: event.staffId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isValidating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (validationResult) {
        if (validationResult.isValid) {
          emit(state.copyWith(
            isValidating: false,
            isTicketValidated: true,
            validationResult: validationResult,
            hasError: false,
            errorMessage: '',
          ));
        } else {
          emit(state.copyWith(
            isValidating: false,
            isCheckInFailed: true,
            validationResult: validationResult,
            hasError: false,
            errorMessage: '',
          ));
        }
      },
    );
  }

  Future<void> _onValidateTicket(
    _ValidateTicket event,
    Emitter<TicketScannerState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isValidating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isValidating: true,
      hasError: false,
      errorMessage: '',
    ));
    
    final result = await _repository.validateTicket(
      qrCode: event.qrCode,
      eventId: event.eventId,
      staffId: event.staffId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isValidating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (validationResult) => emit(state.copyWith(
        isValidating: false,
        isTicketValidated: true,
        validationResult: validationResult,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onCheckInTicket(
    _CheckInTicket event,
    Emitter<TicketScannerState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isCheckingIn: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isCheckingIn: true,
      hasError: false,
      errorMessage: '',
    ));
    
    final result = await _repository.checkInTicket(
      ticketId: event.ticketId,
      eventId: event.eventId,
      staffId: event.staffId,
      notes: event.notes,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isCheckingIn: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (checkIn) => emit(state.copyWith(
        isCheckingIn: false,
        isCheckInSuccessful: true,
        checkInResult: checkIn,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadStats(
    _LoadStats event,
    Emitter<TicketScannerState> emit,
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

    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
    ));
    
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
      
      emit(state.copyWith(
        isLoading: false,
        areStatsLoaded: true,
        stats: stats,
        recentCheckIns: recentCheckIns,
        hasError: false,
        errorMessage: '',
      ));
    } else {
      final error = statsResult.isLeft() 
          ? statsResult.fold((l) => l, (r) => throw Exception())
          : recentCheckInsResult.fold((l) => l, (r) => throw Exception());
      
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(error),
      ));
    }
  }

  Future<void> _onLoadRecentCheckIns(
    _LoadRecentCheckIns event,
    Emitter<TicketScannerState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    final result = await _repository.getRecentCheckIns(
      eventId: event.eventId,
      staffId: event.staffId,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (checkIns) {
        // If we already have stats, preserve them
        if (state.areStatsLoaded && state.stats != null) {
          emit(state.copyWith(
            recentCheckIns: checkIns,
            hasError: false,
            errorMessage: '',
          ));
        }
      },
    );
  }

  Future<void> _onResetScanner(
    _ResetScanner event,
    Emitter<TicketScannerState> emit,
  ) async {
    emit(state.copyWith(
      isScanning: true,
      isValidating: false,
      isCheckingIn: false,
      isTicketValidated: false,
      isCheckInSuccessful: false,
      isCheckInFailed: false,
      validationResult: null,
      checkInResult: null,
      hasError: false,
      errorMessage: '',
    ));
  }

  void _onClearError(
    _ClearError event,
    Emitter<TicketScannerState> emit,
  ) {
    emit(state.copyWith(
      hasError: false,
      errorMessage: '',
    ));
  }
}