import 'package:json_annotation/json_annotation.dart';
import 'package:eventhub/core/value_object/value_objects.dart';

part 'event_statistics_entity.g.dart';

// Event statistics entity
@JsonSerializable()
class EventStatistics {
  @JsonKey(fromJson: _uniqueIdFromJson, toJson: _uniqueIdToJson)
  final UniqueId eventId;
  final int totalTickets;
  final int soldTickets;
  final int availableTickets;
  final double totalRevenue;
  final double targetRevenue;
  final int checkedInCount;
  final double conversionRate;
  final Map<String, int> ticketTypesSold;
  final Map<String, double> revenueByTicketType;
  final DateTime lastUpdated;

  const EventStatistics({
    required this.eventId,
    required this.totalTickets,
    required this.soldTickets,
    required this.availableTickets,
    required this.totalRevenue,
    required this.targetRevenue,
    required this.checkedInCount,
    required this.conversionRate,
    required this.ticketTypesSold,
    required this.revenueByTicketType,
    required this.lastUpdated,
  });

  factory EventStatistics.fromJson(Map<String, dynamic> json) => _$EventStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$EventStatisticsToJson(this);

  // Helper methods for value object serialization
  static UniqueId _uniqueIdFromJson(String json) => UniqueId.fromString(json);
  static String _uniqueIdToJson(UniqueId id) => id.getOrCrash();
}

extension EventStatisticsExtension on EventStatistics {
  double get salesProgress => totalTickets > 0 ? soldTickets / totalTickets : 0.0;
  
  double get revenueProgress => targetRevenue > 0 ? totalRevenue / targetRevenue : 0.0;
  
  int get remainingTickets => totalTickets - soldTickets;
  
  double get averageTicketPrice => soldTickets > 0 ? totalRevenue / soldTickets : 0.0;
  
  bool get isSoldOut => availableTickets <= 0;
  
  double get checkInRate => soldTickets > 0 ? checkedInCount / soldTickets : 0.0;
}