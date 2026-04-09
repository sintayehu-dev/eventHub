import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_report_entity.freezed.dart';

@freezed
class StaffReportEntity with _$StaffReportEntity {
  const factory StaffReportEntity({
    required String eventId,
    required String eventTitle,
    required DateTime reportDate,
    required StaffReportMetrics metrics,
    required List<HourlyCheckInData> hourlyData,
    required List<StaffPerformanceData> staffPerformance,
  }) = _StaffReportEntity;
}

@freezed
class StaffReportMetrics with _$StaffReportMetrics {
  const factory StaffReportMetrics({
    required int totalCheckIns,
    required int todayCheckIns,
    required double averageWaitTime,
    required String peakHour,
    required int peakHourCheckIns,
    required int issuesResolved,
    required int pendingIssues,
    required int totalAttendees,
    required int checkedInAttendees,
    required double checkInRate,
  }) = _StaffReportMetrics;
}

@freezed
class HourlyCheckInData with _$HourlyCheckInData {
  const factory HourlyCheckInData({
    required int hour,
    required int checkIns,
    required double averageWaitTime,
  }) = _HourlyCheckInData;
}

@freezed
class StaffPerformanceData with _$StaffPerformanceData {
  const factory StaffPerformanceData({
    required String staffId,
    required String staffName,
    required int checkIns,
    required double averageWaitTime,
    required String status,
    required DateTime lastActivity,
  }) = _StaffPerformanceData;
}

enum ReportTimePeriod {
  today,
  thisWeek,
  thisMonth,
  custom;

  String get displayName {
    switch (this) {
      case ReportTimePeriod.today:
        return 'Today';
      case ReportTimePeriod.thisWeek:
        return 'This Week';
      case ReportTimePeriod.thisMonth:
        return 'This Month';
      case ReportTimePeriod.custom:
        return 'Custom';
    }
  }
}