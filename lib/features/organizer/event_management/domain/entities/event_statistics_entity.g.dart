// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_statistics_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventStatisticsImpl _$$EventStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$EventStatisticsImpl(
      eventId: json['eventId'] as String,
      totalTickets: (json['totalTickets'] as num).toInt(),
      soldTickets: (json['soldTickets'] as num).toInt(),
      availableTickets: (json['availableTickets'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      targetRevenue: (json['targetRevenue'] as num).toDouble(),
      checkedInCount: (json['checkedInCount'] as num).toInt(),
      conversionRate: (json['conversionRate'] as num).toDouble(),
      ticketTypesSold: Map<String, int>.from(json['ticketTypesSold'] as Map),
      revenueByTicketType:
          (json['revenueByTicketType'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$EventStatisticsImplToJson(
        _$EventStatisticsImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'totalTickets': instance.totalTickets,
      'soldTickets': instance.soldTickets,
      'availableTickets': instance.availableTickets,
      'totalRevenue': instance.totalRevenue,
      'targetRevenue': instance.targetRevenue,
      'checkedInCount': instance.checkedInCount,
      'conversionRate': instance.conversionRate,
      'ticketTypesSold': instance.ticketTypesSold,
      'revenueByTicketType': instance.revenueByTicketType,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
