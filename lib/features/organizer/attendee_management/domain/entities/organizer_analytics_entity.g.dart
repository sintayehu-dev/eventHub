// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_analytics_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizerAnalyticsEntityImpl _$$OrganizerAnalyticsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizerAnalyticsEntityImpl(
      organizerId: json['organizerId'] as String,
      period: $enumDecode(_$AnalyticsPeriodEnumMap, json['period']),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalTicketsSold: (json['totalTicketsSold'] as num).toInt(),
      totalEvents: (json['totalEvents'] as num).toInt(),
      averageTicketPrice: (json['averageTicketPrice'] as num).toDouble(),
      conversionRate: (json['conversionRate'] as num).toDouble(),
      topEvents: (json['topEvents'] as List<dynamic>)
          .map(
              (e) => EventPerformanceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenueChart: (json['revenueChart'] as List<dynamic>)
          .map((e) => RevenueDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenueByCategory:
          (json['revenueByCategory'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      ticketsByType: Map<String, int>.from(json['ticketsByType'] as Map),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$OrganizerAnalyticsEntityImplToJson(
        _$OrganizerAnalyticsEntityImpl instance) =>
    <String, dynamic>{
      'organizerId': instance.organizerId,
      'period': _$AnalyticsPeriodEnumMap[instance.period]!,
      'totalRevenue': instance.totalRevenue,
      'totalTicketsSold': instance.totalTicketsSold,
      'totalEvents': instance.totalEvents,
      'averageTicketPrice': instance.averageTicketPrice,
      'conversionRate': instance.conversionRate,
      'topEvents': instance.topEvents,
      'revenueChart': instance.revenueChart,
      'revenueByCategory': instance.revenueByCategory,
      'ticketsByType': instance.ticketsByType,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

const _$AnalyticsPeriodEnumMap = {
  AnalyticsPeriod.thisMonth: 'thisMonth',
  AnalyticsPeriod.lastMonth: 'lastMonth',
  AnalyticsPeriod.last3Months: 'last3Months',
  AnalyticsPeriod.last6Months: 'last6Months',
  AnalyticsPeriod.thisYear: 'thisYear',
};

_$EventPerformanceEntityImpl _$$EventPerformanceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EventPerformanceEntityImpl(
      eventId: json['eventId'] as String,
      eventTitle: json['eventTitle'] as String,
      revenue: (json['revenue'] as num).toDouble(),
      ticketsSold: (json['ticketsSold'] as num).toInt(),
      totalTickets: (json['totalTickets'] as num).toInt(),
      conversionRate: (json['conversionRate'] as num).toDouble(),
      bannerUrl: json['bannerUrl'] as String?,
    );

Map<String, dynamic> _$$EventPerformanceEntityImplToJson(
        _$EventPerformanceEntityImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'eventTitle': instance.eventTitle,
      'revenue': instance.revenue,
      'ticketsSold': instance.ticketsSold,
      'totalTickets': instance.totalTickets,
      'conversionRate': instance.conversionRate,
      'bannerUrl': instance.bannerUrl,
    };

_$RevenueDataPointImpl _$$RevenueDataPointImplFromJson(
        Map<String, dynamic> json) =>
    _$RevenueDataPointImpl(
      date: DateTime.parse(json['date'] as String),
      revenue: (json['revenue'] as num).toDouble(),
      ticketsSold: (json['ticketsSold'] as num).toInt(),
    );

Map<String, dynamic> _$$RevenueDataPointImplToJson(
        _$RevenueDataPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'revenue': instance.revenue,
      'ticketsSold': instance.ticketsSold,
    };

_$AnalyticsComparisonImpl _$$AnalyticsComparisonImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsComparisonImpl(
      current: OrganizerAnalyticsEntity.fromJson(
          json['current'] as Map<String, dynamic>),
      previous: OrganizerAnalyticsEntity.fromJson(
          json['previous'] as Map<String, dynamic>),
      changes:
          AnalyticsChanges.fromJson(json['changes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalyticsComparisonImplToJson(
        _$AnalyticsComparisonImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'previous': instance.previous,
      'changes': instance.changes,
    };

_$AnalyticsChangesImpl _$$AnalyticsChangesImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsChangesImpl(
      revenueChange: (json['revenueChange'] as num).toDouble(),
      ticketsSoldChange: (json['ticketsSoldChange'] as num).toDouble(),
      conversionRateChange: (json['conversionRateChange'] as num).toDouble(),
      averageTicketPriceChange:
          (json['averageTicketPriceChange'] as num).toDouble(),
    );

Map<String, dynamic> _$$AnalyticsChangesImplToJson(
        _$AnalyticsChangesImpl instance) =>
    <String, dynamic>{
      'revenueChange': instance.revenueChange,
      'ticketsSoldChange': instance.ticketsSoldChange,
      'conversionRateChange': instance.conversionRateChange,
      'averageTicketPriceChange': instance.averageTicketPriceChange,
    };
