import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';

abstract class StaffReportsRepository {
  /// Get staff reports for a specific event and time period
  Future<Either<NetworkExceptions, StaffReportEntity>> getStaffReport({
    required String eventId,
    required String staffId,
    required ReportTimePeriod timePeriod,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get check-in analytics for an event
  Future<Either<NetworkExceptions, List<HourlyCheckInData>>> getCheckInAnalytics({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get staff performance data
  Future<Either<NetworkExceptions, List<StaffPerformanceData>>> getStaffPerformance({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get real-time metrics for dashboard
  Future<Either<NetworkExceptions, StaffReportMetrics>> getRealTimeMetrics({
    required String eventId,
    required String staffId,
  });
}