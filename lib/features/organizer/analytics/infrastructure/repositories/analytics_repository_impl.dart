import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';
import 'package:eventhub/features/organizer/analytics/domain/repositories/analytics_repository.dart';
import 'package:eventhub/features/organizer/analytics/infrastructure/datasources/firebase_analytics_data_source.dart';

@Injectable(as: AnalyticsRepository)
class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final FirebaseAnalyticsDataSource _firebaseDataSource;

  AnalyticsRepositoryImpl(this._firebaseDataSource);

  @override
  Future<Either<NetworkExceptions, OrganizerAnalyticsEntity>> getOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  }) async {
    try {
      final analytics = await _firebaseDataSource.getOrganizerAnalytics(
        organizerId: organizerId,
        period: period,
      );
      return right(analytics);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, AnalyticsComparison>> getAnalyticsComparison({
    required String organizerId,
    required AnalyticsPeriod currentPeriod,
    required AnalyticsPeriod previousPeriod,
  }) async {
    try {
      final currentResult = await getOrganizerAnalytics(
        organizerId: organizerId,
        period: currentPeriod,
      );
      
      final previousResult = await getOrganizerAnalytics(
        organizerId: organizerId,
        period: previousPeriod,
      );

      return currentResult.fold(
        (failure) => left(failure),
        (current) => previousResult.fold(
          (failure) => left(failure),
          (previous) {
            final changes = _calculateChanges(current, previous);
            final comparison = AnalyticsComparison(
              current: current,
              previous: previous,
              changes: changes,
            );
            return right(comparison);
          },
        ),
      );
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Stream<Either<NetworkExceptions, OrganizerAnalyticsEntity>> watchOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  }) {
    try {
      return _firebaseDataSource
          .watchOrganizerAnalytics(
            organizerId: organizerId,
            period: period,
          )
          .map((analytics) => right<NetworkExceptions, OrganizerAnalyticsEntity>(analytics))
          .handleError((error) {
        return Stream.value(left<NetworkExceptions, OrganizerAnalyticsEntity>(
          NetworkExceptions.getDioException(error),
        ));
      });
    } catch (e) {
      return Stream.value(left<NetworkExceptions, OrganizerAnalyticsEntity>(
        NetworkExceptions.getDioException(e),
      ));
    }
  }

  AnalyticsChanges _calculateChanges(
    OrganizerAnalyticsEntity current,
    OrganizerAnalyticsEntity previous,
  ) {
    double calculatePercentageChange(double current, double previous) {
      if (previous == 0) return current > 0 ? 100.0 : 0.0;
      return ((current - previous) / previous) * 100;
    }

    return AnalyticsChanges(
      revenueChange: calculatePercentageChange(
        current.totalRevenue,
        previous.totalRevenue,
      ),
      ticketsSoldChange: calculatePercentageChange(
        current.totalTicketsSold.toDouble(),
        previous.totalTicketsSold.toDouble(),
      ),
      conversionRateChange: calculatePercentageChange(
        current.conversionRate,
        previous.conversionRate,
      ),
      averageTicketPriceChange: calculatePercentageChange(
        current.averageTicketPrice,
        previous.averageTicketPrice,
      ),
    );
  }
}