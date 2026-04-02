part of 'staff_reports_bloc.dart';

@freezed
class StaffReportsEvent with _$StaffReportsEvent {
  const factory StaffReportsEvent.loadReport({
    required String eventId,
    required String staffId,
    required ReportTimePeriod timePeriod,
    DateTime? startDate,
    DateTime? endDate,
  }) = _LoadReport;

  const factory StaffReportsEvent.loadCheckInAnalytics({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  }) = _LoadCheckInAnalytics;

  const factory StaffReportsEvent.loadStaffPerformance({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  }) = _LoadStaffPerformance;

  const factory StaffReportsEvent.loadRealTimeMetrics({
    required String eventId,
    required String staffId,
  }) = _LoadRealTimeMetrics;

  const factory StaffReportsEvent.changeTimePeriod({
    required ReportTimePeriod timePeriod,
    DateTime? startDate,
    DateTime? endDate,
  }) = _ChangeTimePeriod;

  const factory StaffReportsEvent.refreshReport() = _RefreshReport;

  const factory StaffReportsEvent.clearError() = _ClearError;
}