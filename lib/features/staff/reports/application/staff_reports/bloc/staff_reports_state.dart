part of 'staff_reports_bloc.dart';

@freezed
class StaffReportsState with _$StaffReportsState {
  const factory StaffReportsState({
    StaffReportEntity? report,
    StaffReportMetrics? metrics,
    @Default([]) List<HourlyCheckInData> hourlyData,
    @Default([]) List<StaffPerformanceData> staffPerformance,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMetrics,
    @Default(false) bool isLoadingAnalytics,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(ReportTimePeriod.today) ReportTimePeriod selectedTimePeriod,
    String? currentEventId,
    String? currentStaffId,
    DateTime? customStartDate,
    DateTime? customEndDate,
  }) = _StaffReportsState;

  factory StaffReportsState.initial() => const StaffReportsState();
}