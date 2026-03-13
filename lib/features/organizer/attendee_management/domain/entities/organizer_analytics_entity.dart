import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizer_analytics_entity.freezed.dart';
part 'organizer_analytics_entity.g.dart';

@freezed
class OrganizerAnalyticsEntity with _$OrganizerAnalyticsEntity {
  const factory OrganizerAnalyticsEntity({
    required String organizerId,
    required AnalyticsPeriod period,
    required double totalRevenue,
    required int totalTicketsSold,
    required int totalEvents,
    required double averageTicketPrice,
    required double conversionRate,
    required List<EventPerformanceEntity> topEvents,
    required List<RevenueDataPoint> revenueChart,
    required Map<String, double> revenueByCategory,
    required Map<String, int> ticketsByType,
    required DateTime lastUpdated,
  }) = _OrganizerAnalyticsEntity;

  factory OrganizerAnalyticsEntity.fromJson(Map<String, dynamic> json) =>
      _$OrganizerAnalyticsEntityFromJson(json);
}

@freezed
class EventPerformanceEntity with _$EventPerformanceEntity {
  const factory EventPerformanceEntity({
    required String eventId,
    required String eventTitle,
    required double revenue,
    required int ticketsSold,
    required int totalTickets,
    required double conversionRate,
    String? bannerUrl,
  }) = _EventPerformanceEntity;

  factory EventPerformanceEntity.fromJson(Map<String, dynamic> json) =>
      _$EventPerformanceEntityFromJson(json);
}

@freezed
class RevenueDataPoint with _$RevenueDataPoint {
  const factory RevenueDataPoint({
    required DateTime date,
    required double revenue,
    required int ticketsSold,
  }) = _RevenueDataPoint;

  factory RevenueDataPoint.fromJson(Map<String, dynamic> json) =>
      _$RevenueDataPointFromJson(json);
}

@freezed
class AnalyticsComparison with _$AnalyticsComparison {
  const factory AnalyticsComparison({
    required OrganizerAnalyticsEntity current,
    required OrganizerAnalyticsEntity previous,
    required AnalyticsChanges changes,
  }) = _AnalyticsComparison;

  factory AnalyticsComparison.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsComparisonFromJson(json);
}

@freezed
class AnalyticsChanges with _$AnalyticsChanges {
  const factory AnalyticsChanges({
    required double revenueChange,
    required double ticketsSoldChange,
    required double conversionRateChange,
    required double averageTicketPriceChange,
  }) = _AnalyticsChanges;

  factory AnalyticsChanges.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsChangesFromJson(json);

  const AnalyticsChanges._();

  bool get isRevenuePositive => revenueChange >= 0;
  bool get isTicketsSoldPositive => ticketsSoldChange >= 0;
  bool get isConversionRatePositive => conversionRateChange >= 0;
  bool get isAverageTicketPricePositive => averageTicketPriceChange >= 0;

  String get revenueChangeFormatted => '${revenueChange >= 0 ? '+' : ''}${revenueChange.toStringAsFixed(1)}%';
  String get ticketsSoldChangeFormatted => '${ticketsSoldChange >= 0 ? '+' : ''}${ticketsSoldChange.toStringAsFixed(1)}%';
  String get conversionRateChangeFormatted => '${conversionRateChange >= 0 ? '+' : ''}${conversionRateChange.toStringAsFixed(1)}%';
  String get averageTicketPriceChangeFormatted => '${averageTicketPriceChange >= 0 ? '+' : ''}${averageTicketPriceChange.toStringAsFixed(1)}%';
}

enum AnalyticsPeriod {
  thisMonth,
  lastMonth,
  last3Months,
  last6Months,
  thisYear,
}

extension AnalyticsPeriodExtension on AnalyticsPeriod {
  String get displayName {
    switch (this) {
      case AnalyticsPeriod.thisMonth:
        return 'This Month';
      case AnalyticsPeriod.lastMonth:
        return 'Last Month';
      case AnalyticsPeriod.last3Months:
        return 'Last 3 Months';
      case AnalyticsPeriod.last6Months:
        return 'Last 6 Months';
      case AnalyticsPeriod.thisYear:
        return 'This Year';
    }
  }

  DateRange get dateRange {
    final now = DateTime.now();
    switch (this) {
      case AnalyticsPeriod.thisMonth:
        return DateRange(
          start: DateTime(now.year, now.month, 1),
          end: DateTime(now.year, now.month + 1, 0),
        );
      case AnalyticsPeriod.lastMonth:
        final lastMonth = DateTime(now.year, now.month - 1, 1);
        return DateRange(
          start: lastMonth,
          end: DateTime(lastMonth.year, lastMonth.month + 1, 0),
        );
      case AnalyticsPeriod.last3Months:
        return DateRange(
          start: DateTime(now.year, now.month - 3, 1),
          end: now,
        );
      case AnalyticsPeriod.last6Months:
        return DateRange(
          start: DateTime(now.year, now.month - 6, 1),
          end: now,
        );
      case AnalyticsPeriod.thisYear:
        return DateRange(
          start: DateTime(now.year, 1, 1),
          end: DateTime(now.year, 12, 31),
        );
    }
  }
}

class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange({required this.start, required this.end});
}