part of 'staff_reports_bloc.dart';

@freezed
class StaffReportsState with _$StaffReportsState {
  const factory StaffReportsState.initial({
    @Default(ReportTimePeriod.today) ReportTimePeriod selectedTimePeriod,
  }) = _Initial;

  const factory StaffReportsState.loading({
    @Default(ReportTimePeriod.today) ReportTimePeriod selectedTimePeriod,
    StaffReportEntity? previousReport,
  }) = _Loading;

  const factory StaffReportsState.loaded({
    required StaffReportEntity report,
    required ReportTimePeriod selectedTimePeriod,
  }) = _Loaded;

  const factory StaffReportsState.error({
    required String message,
    @Default(ReportTimePeriod.today) ReportTimePeriod selectedTimePeriod,
    StaffReportEntity? previousReport,
  }) = _Error;

  const factory StaffReportsState.metricsLoaded({
    required StaffReportMetrics metrics,
    @Default(ReportTimePeriod.today) ReportTimePeriod selectedTimePeriod,
  }) = _MetricsLoaded;
}