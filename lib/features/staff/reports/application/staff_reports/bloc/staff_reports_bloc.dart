import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';
import 'package:eventhub/features/staff/reports/domain/repositories/staff_reports_repository.dart';

part 'staff_reports_event.dart';
part 'staff_reports_state.dart';
part 'staff_reports_bloc.freezed.dart';

@injectable
class StaffReportsBloc extends Bloc<StaffReportsEvent, StaffReportsState> {
  final StaffReportsRepository _repository;
  
  String? _currentEventId;
  String? _currentStaffId;

  StaffReportsBloc(this._repository) : super(const StaffReportsState.initial()) {
    on<_LoadReport>(_onLoadReport);
    on<_ChangeTimePeriod>(_onChangeTimePeriod);
    on<_RefreshReport>(_onRefreshReport);
    on<_LoadRealTimeMetrics>(_onLoadRealTimeMetrics);
  }

  Future<void> _onLoadReport(
    _LoadReport event,
    Emitter<StaffReportsState> emit,
  ) async {
    _currentEventId = event.eventId;
    _currentStaffId = event.staffId;

    emit(StaffReportsState.loading(
      selectedTimePeriod: event.timePeriod,
      previousReport: state.mapOrNull(loaded: (state) => state.report),
    ));

    final result = await _repository.getStaffReport(
      eventId: event.eventId,
      staffId: event.staffId,
      timePeriod: event.timePeriod,
      startDate: event.startDate,
      endDate: event.endDate,
    );

    result.fold(
      (failure) => emit(StaffReportsState.error(
        message: failure.toString(),
        selectedTimePeriod: event.timePeriod,
        previousReport: state.mapOrNull(loaded: (state) => state.report),
      )),
      (report) => emit(StaffReportsState.loaded(
        report: report,
        selectedTimePeriod: event.timePeriod,
      )),
    );
  }

  Future<void> _onChangeTimePeriod(
    _ChangeTimePeriod event,
    Emitter<StaffReportsState> emit,
  ) async {
    if (_currentEventId != null && _currentStaffId != null) {
      add(StaffReportsEvent.loadReport(
        eventId: _currentEventId!,
        staffId: _currentStaffId!,
        timePeriod: event.timePeriod,
      ));
    } else {
      emit(state.copyWith(selectedTimePeriod: event.timePeriod));
    }
  }

  Future<void> _onRefreshReport(
    _RefreshReport event,
    Emitter<StaffReportsState> emit,
  ) async {
    if (_currentEventId != null && _currentStaffId != null) {
      add(StaffReportsEvent.loadReport(
        eventId: _currentEventId!,
        staffId: _currentStaffId!,
        timePeriod: state.selectedTimePeriod,
      ));
    }
  }

  Future<void> _onLoadRealTimeMetrics(
    _LoadRealTimeMetrics event,
    Emitter<StaffReportsState> emit,
  ) async {
    final result = await _repository.getRealTimeMetrics(
      eventId: event.eventId,
      staffId: event.staffId,
    );

    result.fold(
      (failure) => emit(StaffReportsState.error(
        message: failure.toString(),
        selectedTimePeriod: state.selectedTimePeriod,
      )),
      (metrics) => emit(StaffReportsState.metricsLoaded(
        metrics: metrics,
        selectedTimePeriod: state.selectedTimePeriod,
      )),
    );
  }
}

extension StaffReportsStateExtension on StaffReportsState {
  StaffReportsState copyWith({ReportTimePeriod? selectedTimePeriod}) {
    return when(
      initial: (currentPeriod) => StaffReportsState.initial(
        selectedTimePeriod: selectedTimePeriod ?? currentPeriod,
      ),
      loading: (currentPeriod, report) => StaffReportsState.loading(
        selectedTimePeriod: selectedTimePeriod ?? currentPeriod,
        previousReport: report,
      ),
      loaded: (report, currentPeriod) => StaffReportsState.loaded(
        report: report,
        selectedTimePeriod: selectedTimePeriod ?? currentPeriod,
      ),
      error: (message, currentPeriod, report) => StaffReportsState.error(
        message: message,
        selectedTimePeriod: selectedTimePeriod ?? currentPeriod,
        previousReport: report,
      ),
      metricsLoaded: (metrics, currentPeriod) => StaffReportsState.metricsLoaded(
        metrics: metrics,
        selectedTimePeriod: selectedTimePeriod ?? currentPeriod,
      ),
    );
  }
}