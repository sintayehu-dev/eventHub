import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

abstract class AnalyticsRepository {
  /// Get analytics data for an organizer for a specific period
  Future<Either<NetworkExceptions, OrganizerAnalyticsEntity>> getOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  });

  /// Get analytics comparison between two periods
  Future<Either<NetworkExceptions, AnalyticsComparison>> getAnalyticsComparison({
    required String organizerId,
    required AnalyticsPeriod currentPeriod,
    required AnalyticsPeriod previousPeriod,
  });

  /// Get real-time analytics updates
  Stream<Either<NetworkExceptions, OrganizerAnalyticsEntity>> watchOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  });
}