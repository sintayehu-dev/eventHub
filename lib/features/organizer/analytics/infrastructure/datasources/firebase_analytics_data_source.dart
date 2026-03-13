import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

abstract class FirebaseAnalyticsDataSource {
  Future<OrganizerAnalyticsEntity> getOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  });

  Stream<OrganizerAnalyticsEntity> watchOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  });
}

@Injectable(as: FirebaseAnalyticsDataSource)
class FirebaseAnalyticsDataSourceImpl implements FirebaseAnalyticsDataSource {
  final FirebaseFirestore _firestore;

  FirebaseAnalyticsDataSourceImpl(this._firestore);

  static const String _eventsCollection = 'events';

  @override
  Future<OrganizerAnalyticsEntity> getOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  }) async {
    try {
      // Get all events for the organizer (simple query without date filtering)
      final eventsQuery = await _firestore
          .collection(_eventsCollection)
          .where('organizerId', isEqualTo: organizerId)
          .get();

      final allEvents = eventsQuery.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data()))
          .toList();

      // Filter events by date range in memory (like event management does)
      final dateRange = period.dateRange;
      final filteredEvents = allEvents.where((event) {
        return event.createdAt.isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
               event.createdAt.isBefore(dateRange.end.add(const Duration(days: 1)));
      }).toList();

      return _calculateAnalytics(organizerId, period, filteredEvents);
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get analytics: $e',
      );
    }
  }

  @override
  Stream<OrganizerAnalyticsEntity> watchOrganizerAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  }) {
    // Use simple query without date filtering to avoid index requirements
    return _firestore
        .collection(_eventsCollection)
        .where('organizerId', isEqualTo: organizerId)
        .snapshots()
        .map((querySnapshot) {
      final allEvents = querySnapshot.docs
          .map((doc) => EventEntity.fromFirestoreData(doc.data()))
          .toList();

      // Filter events by date range in memory
      final dateRange = period.dateRange;
      final filteredEvents = allEvents.where((event) {
        return event.createdAt.isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
               event.createdAt.isBefore(dateRange.end.add(const Duration(days: 1)));
      }).toList();

      return _calculateAnalytics(organizerId, period, filteredEvents);
    });
  }

  OrganizerAnalyticsEntity _calculateAnalytics(
    String organizerId,
    AnalyticsPeriod period,
    List<EventEntity> events,
  ) {
    // Calculate total revenue and tickets sold
    double totalRevenue = 0.0;
    int totalTicketsSold = 0;
    int totalTickets = 0;
    
    final Map<String, double> revenueByCategory = {};
    final Map<String, int> ticketsByType = {};
    final List<EventPerformanceEntity> eventPerformances = [];

    for (final event in events) {
      double eventRevenue = 0.0;
      int eventTicketsSold = 0;
      int eventTotalTickets = 0;

      for (final ticketType in event.ticketTypes) {
        final sold = ticketType.quantity - ticketType.availableQuantity;
        final revenue = sold * ticketType.price;
        
        eventRevenue += revenue;
        eventTicketsSold += sold;
        eventTotalTickets += ticketType.quantity;
        
        // Aggregate by ticket type
        ticketsByType[ticketType.name] = (ticketsByType[ticketType.name] ?? 0) + sold;
      }

      totalRevenue += eventRevenue;
      totalTicketsSold += eventTicketsSold;
      totalTickets += eventTotalTickets;

      // Aggregate by category
      final categoryName = event.category.displayName;
      revenueByCategory[categoryName] = (revenueByCategory[categoryName] ?? 0.0) + eventRevenue;

      // Create event performance
      final conversionRate = eventTotalTickets > 0 ? (eventTicketsSold / eventTotalTickets) * 100 : 0.0;
      eventPerformances.add(EventPerformanceEntity(
        eventId: event.id,
        eventTitle: event.title,
        revenue: eventRevenue,
        ticketsSold: eventTicketsSold,
        totalTickets: eventTotalTickets,
        conversionRate: conversionRate,
        bannerUrl: event.bannerUrl,
      ));
    }

    // Sort events by revenue (top performing)
    eventPerformances.sort((a, b) => b.revenue.compareTo(a.revenue));
    final topEvents = eventPerformances.take(5).toList();

    // Calculate metrics
    final averageTicketPrice = totalTicketsSold > 0 ? totalRevenue / totalTicketsSold : 0.0;
    final conversionRate = totalTickets > 0 ? (totalTicketsSold / totalTickets) * 100 : 0.0;

    // Generate revenue chart data (simplified - daily data for the period)
    final revenueChart = _generateRevenueChart(events, period);

    return OrganizerAnalyticsEntity(
      organizerId: organizerId,
      period: period,
      totalRevenue: totalRevenue,
      totalTicketsSold: totalTicketsSold,
      totalEvents: events.length,
      averageTicketPrice: averageTicketPrice,
      conversionRate: conversionRate,
      topEvents: topEvents,
      revenueChart: revenueChart,
      revenueByCategory: revenueByCategory,
      ticketsByType: ticketsByType,
      lastUpdated: DateTime.now(),
    );
  }

  List<RevenueDataPoint> _generateRevenueChart(
    List<EventEntity> events,
    AnalyticsPeriod period,
  ) {
    final dateRange = period.dateRange;
    final dataPoints = <RevenueDataPoint>[];
    
    // Group events by date and calculate daily revenue
    final Map<String, double> dailyRevenue = {};
    final Map<String, int> dailyTickets = {};

    for (final event in events) {
      final dateKey = _formatDateKey(event.createdAt);
      
      double eventRevenue = 0.0;
      int eventTickets = 0;
      
      for (final ticketType in event.ticketTypes) {
        final sold = ticketType.quantity - ticketType.availableQuantity;
        eventRevenue += sold * ticketType.price;
        eventTickets += sold;
      }
      
      dailyRevenue[dateKey] = (dailyRevenue[dateKey] ?? 0.0) + eventRevenue;
      dailyTickets[dateKey] = (dailyTickets[dateKey] ?? 0) + eventTickets;
    }

    // Create data points for each day in the range
    DateTime currentDate = dateRange.start;
    while (currentDate.isBefore(dateRange.end) || currentDate.isAtSameMomentAs(dateRange.end)) {
      final dateKey = _formatDateKey(currentDate);
      dataPoints.add(RevenueDataPoint(
        date: currentDate,
        revenue: dailyRevenue[dateKey] ?? 0.0,
        ticketsSold: dailyTickets[dateKey] ?? 0,
      ));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dataPoints;
  }

  String _formatDateKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}