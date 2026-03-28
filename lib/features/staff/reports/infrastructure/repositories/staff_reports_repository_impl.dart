import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';
import 'package:eventhub/features/staff/reports/domain/repositories/staff_reports_repository.dart';
import 'package:eventhub/features/staff/reports/infrastructure/datasources/firebase_staff_reports_data_source.dart';

@LazySingleton(as: StaffReportsRepository)
class StaffReportsRepositoryImpl implements StaffReportsRepository {
  final FirebaseStaffReportsDataSource _dataSource;

  StaffReportsRepositoryImpl(this._dataSource);

  @override
  Future<Either<NetworkExceptions, StaffReportEntity>> getStaffReport({
    required String eventId,
    required String staffId,
    required ReportTimePeriod timePeriod,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final report = await _dataSource.getStaffReport(
        eventId: eventId,
        staffId: staffId,
        timePeriod: timePeriod,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(report);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, List<HourlyCheckInData>>> getCheckInAnalytics({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final analytics = await _dataSource.getCheckInAnalytics(
        eventId: eventId,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(analytics);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, List<StaffPerformanceData>>> getStaffPerformance({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final performance = await _dataSource.getStaffPerformance(
        eventId: eventId,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(performance);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, StaffReportMetrics>> getRealTimeMetrics({
    required String eventId,
    required String staffId,
  }) async {
    try {
      final metrics = await _dataSource.getRealTimeMetrics(
        eventId: eventId,
        staffId: staffId,
      );
      return Right(metrics);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }
}