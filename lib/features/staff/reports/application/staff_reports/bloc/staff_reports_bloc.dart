import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';
import 'package:eventhub/features/staff/reports/domain/repositories/staff_reports_repository.dart';

part 'staff_reports_event.dart';
part 'staff_reports_state.dart';
part 'staff_reports_bloc.freezed.dart';

@injectable
class StaffReportsBloc extends Bloc<StaffReportsEvent, StaffReportsState> {
  final StaffReportsRepository _repository;

  StaffReportsBloc(this._repository) : super(StaffReportsState.initial()) {
    on<_LoadReport>(_onLoadReport);
    on<_LoadCheckInAnalytics>(_onLoadCheckInAnalytics);
    on<_LoadStaffPerformance>(_onLoadStaffPerformance);
    on<_LoadRealTimeMetrics>(_onLoadRealTimeMetrics);
    on<_ChangeTimePeriod>(_onChangeTimePeriod);
    on<_RefreshReport>(_onRefreshReport);
    on<_ClearError>(_onClearError);
  }

  Future<void> _onLoadReport(
    _LoadReport event,
    Emitter<StaffReportsState> emit,
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
      currentEventId: event.eventId,
      currentStaffId: event.staffId,
      selectedTimePeriod: event.timePeriod,
      customStartDate: event.startDate,
      customEndDate: event.endDate,
    ));

    final result = await _repository.getStaffReport(
      eventId: event.eventId,
      staffId: event.staffId,
      timePeriod: event.timePeriod,
      startDate: event.startDate,
      endDate: event.endDate,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (report) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        report: report,
        metrics: report.metrics,
        hourlyData: report.hourlyData,
        staffPerformance: report.staffPerformance,
      )),
    );
  }

  Future<void> _onLoadCheckInAnalytics(
    _LoadCheckInAnalytics event,
    Emitter<StaffReportsState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoadingAnalytics: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isLoadingAnalytics: true,
      hasError: false,
      errorMessage: '',
    ));

    final result = await _repository.getCheckInAnalytics(
      eventId: event.eventId,
      startDate: event.startDate,
      endDate: event.endDate,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingAnalytics: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (hourlyData) => emit(state.copyWith(
        isLoadingAnalytics: false,
        hasError: false,
        errorMessage: '',
        hourlyData: hourlyData,
      )),
    );
  }

  Future<void> _onLoadStaffPerformance(
    _LoadStaffPerformance event,
    Emitter<StaffReportsState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoadingAnalytics: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isLoadingAnalytics: true,
      hasError: false,
      errorMessage: '',
    ));

    final result = await _repository.getStaffPerformance(
      eventId: event.eventId,
      startDate: event.startDate,
      endDate: event.endDate,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingAnalytics: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (staffPerformance) => emit(state.copyWith(
        isLoadingAnalytics: false,
        hasError: false,
        errorMessage: '',
        staffPerformance: staffPerformance,
      )),
    );
  }

  Future<void> _onLoadRealTimeMetrics(
    _LoadRealTimeMetrics event,
    Emitter<StaffReportsState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoadingMetrics: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isLoadingMetrics: true,
      hasError: false,
      errorMessage: '',
    ));

    final result = await _repository.getRealTimeMetrics(
      eventId: event.eventId,
      staffId: event.staffId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingMetrics: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (metrics) => emit(state.copyWith(
        isLoadingMetrics: false,
        hasError: false,
        errorMessage: '',
        metrics: metrics,
      )),
    );
  }

  Future<void> _onChangeTimePeriod(
    _ChangeTimePeriod event,
    Emitter<StaffReportsState> emit,
  ) async {
    emit(state.copyWith(
      selectedTimePeriod: event.timePeriod,
      customStartDate: event.startDate,
      customEndDate: event.endDate,
    ));

    // Reload report with new time period if we have current event and staff
    if (state.currentEventId != null && state.currentStaffId != null) {
      add(StaffReportsEvent.loadReport(
        eventId: state.currentEventId!,
        staffId: state.currentStaffId!,
        timePeriod: event.timePeriod,
        startDate: event.startDate,
        endDate: event.endDate,
      ));
    }
  }

  Future<void> _onRefreshReport(
    _RefreshReport event,
    Emitter<StaffReportsState> emit,
  ) async {
    if (state.currentEventId != null && state.currentStaffId != null) {
      add(StaffReportsEvent.loadReport(
        eventId: state.currentEventId!,
        staffId: state.currentStaffId!,
        timePeriod: state.selectedTimePeriod,
        startDate: state.customStartDate,
        endDate: state.customEndDate,
      ));
    }
  }

  void _onClearError(
    _ClearError event,
    Emitter<StaffReportsState> emit,
  ) {
    emit(state.copyWith(hasError: false, errorMessage: ''));
  }
}