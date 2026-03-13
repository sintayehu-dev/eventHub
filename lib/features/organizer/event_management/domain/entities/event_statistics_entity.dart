import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_statistics_entity.freezed.dart';
part 'event_statistics_entity.g.dart';

@freezed
class EventStatistics with _$EventStatistics {
  const factory EventStatistics({
    required String eventId,
    required int totalTickets,
    required int soldTickets,
    required int availableTickets,
    required double totalRevenue,
    required double targetRevenue,
    required int checkedInCount,
    required double conversionRate,
    required Map<String, int> ticketTypesSold,
    required Map<String, double> revenueByTicketType,
    required DateTime lastUpdated,
  }) = _EventStatistics;

  factory EventStatistics.fromJson(Map<String, dynamic> json) =>
      _$EventStatisticsFromJson(json);
}

extension EventStatisticsExtension on EventStatistics {
  double get salesProgress => totalTickets > 0 ? soldTickets / totalTickets : 0.0;
  
  double get revenueProgress => targetRevenue > 0 ? totalRevenue / targetRevenue : 0.0;
  
  int get remainingTickets => totalTickets - soldTickets;
  
  double get averageTicketPrice => soldTickets > 0 ? totalRevenue / soldTickets : 0.0;
  
  bool get isSoldOut => availableTickets <= 0;
  
  double get checkInRate => soldTickets > 0 ? checkedInCount / soldTickets : 0.0;
}