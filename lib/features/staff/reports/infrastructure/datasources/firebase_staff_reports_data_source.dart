import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';

@lazySingleton
class FirebaseStaffReportsDataSource {
  final FirebaseFirestore _firestore;

  FirebaseStaffReportsDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Get staff report data for a specific event and time period
  Future<StaffReportEntity> getStaffReport({
    required String eventId,
    required String staffId,
    required ReportTimePeriod timePeriod,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final dateRange = _getDateRange(timePeriod, startDate, endDate);
      
      // Get event details
      final eventDoc = await _firestore.collection('events').doc(eventId).get();
      final eventTitle = eventDoc.data()?['title'] ?? 'Unknown Event';

      // Get metrics, hourly data, and staff performance in parallel
      final results = await Future.wait([
        _getReportMetrics(eventId, dateRange.start, dateRange.end),
        _getHourlyCheckInData(eventId, dateRange.start, dateRange.end),
        _getStaffPerformanceData(eventId, dateRange.start, dateRange.end),
      ]);

      return StaffReportEntity(
        eventId: eventId,
        eventTitle: eventTitle,
        reportDate: DateTime.now(),
        metrics: results[0] as StaffReportMetrics,
        hourlyData: results[1] as List<HourlyCheckInData>,
        staffPerformance: results[2] as List<StaffPerformanceData>,
      );
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get real-time metrics for the dashboard
  Future<StaffReportMetrics> getRealTimeMetrics({
    required String eventId,
    required String staffId,
  }) async {
    try {
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final todayEnd = todayStart.add(const Duration(days: 1));

      return await _getReportMetrics(eventId, todayStart, todayEnd);
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get check-in analytics data
  Future<List<HourlyCheckInData>> getCheckInAnalytics({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return await _getHourlyCheckInData(eventId, startDate, endDate);
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get staff performance data
  Future<List<StaffPerformanceData>> getStaffPerformance({
    required String eventId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return await _getStaffPerformanceData(eventId, startDate, endDate);
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Private method to calculate report metrics
  Future<StaffReportMetrics> _getReportMetrics(
    String eventId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    // Get check-ins for the period - using simpler query to avoid index requirements
    final checkInsQuery = await _firestore
        .collection('checkIns')
        .where('eventId', isEqualTo: eventId)
        .get();

    // Filter by date range in memory to avoid composite index requirement
    final checkInsInRange = checkInsQuery.docs.where((doc) {
      final checkInTime = (doc.data()['checkInTime'] as Timestamp).toDate();
      return checkInTime.isAfter(startDate) && checkInTime.isBefore(endDate);
    }).toList();

    final totalCheckIns = checkInsInRange.length;

    // Get today's check-ins
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd = todayStart.add(const Duration(days: 1));
    
    final todayCheckIns = checkInsInRange.where((doc) {
      final checkInTime = (doc.data()['checkInTime'] as Timestamp).toDate();
      return checkInTime.isAfter(todayStart) && checkInTime.isBefore(todayEnd);
    }).length;

    // Calculate hourly distribution to find peak hour
    final hourlyDistribution = <int, int>{};
    for (final doc in checkInsInRange) {
      final checkInTime = (doc.data()['checkInTime'] as Timestamp).toDate();
      final hour = checkInTime.hour;
      hourlyDistribution[hour] = (hourlyDistribution[hour] ?? 0) + 1;
    }

    final peakHourEntry = hourlyDistribution.entries
        .fold<MapEntry<int, int>?>(null, (prev, current) {
      if (prev == null || current.value > prev.value) {
        return current;
      }
      return prev;
    });

    final peakHour = peakHourEntry?.key ?? 12;
    final peakHourCheckIns = peakHourEntry?.value ?? 0;

    // Get total attendees (registered tickets)
    final attendeesQuery = await _firestore
        .collection('tickets')
        .where('eventId', isEqualTo: eventId)
        .get();

    final totalAttendees = attendeesQuery.docs.length;

    // Get checked-in attendees
    final checkedInAttendeesQuery = await _firestore
        .collection('tickets')
        .where('eventId', isEqualTo: eventId)
        .where('attendeeStatus', isEqualTo: 'checkedIn')
        .get();

    final checkedInAttendees = checkedInAttendeesQuery.docs.length;
    final checkInRate = totalAttendees > 0 ? (checkedInAttendees / totalAttendees) * 100 : 0.0;

    // Calculate average wait time (mock for now - would need actual wait time tracking)
    final averageWaitTime = totalCheckIns > 0 ? 2.3 : 0.0;

    // Mock issues data (would need actual issue tracking system)
    final issuesResolved = (totalCheckIns * 0.02).round();
    final pendingIssues = (issuesResolved * 0.25).round();

    return StaffReportMetrics(
      totalCheckIns: totalCheckIns,
      todayCheckIns: todayCheckIns,
      averageWaitTime: averageWaitTime,
      peakHour: _formatHour(peakHour),
      peakHourCheckIns: peakHourCheckIns,
      issuesResolved: issuesResolved,
      pendingIssues: pendingIssues,
      totalAttendees: totalAttendees,
      checkedInAttendees: checkedInAttendees,
      checkInRate: checkInRate,
    );
  }

  /// Private method to get hourly check-in data
  Future<List<HourlyCheckInData>> _getHourlyCheckInData(
    String eventId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    // Use simpler query to avoid composite index requirement
    final checkInsQuery = await _firestore
        .collection('checkIns')
        .where('eventId', isEqualTo: eventId)
        .get();

    // Filter by date range in memory
    final checkInsInRange = checkInsQuery.docs.where((doc) {
      final checkInTime = (doc.data()['checkInTime'] as Timestamp).toDate();
      return checkInTime.isAfter(startDate) && checkInTime.isBefore(endDate);
    });

    final hourlyData = <int, List<DateTime>>{};
    
    for (final doc in checkInsInRange) {
      final checkInTime = (doc.data()['checkInTime'] as Timestamp).toDate();
      final hour = checkInTime.hour;
      hourlyData[hour] = (hourlyData[hour] ?? [])..add(checkInTime);
    }

    final result = <HourlyCheckInData>[];
    for (int hour = 0; hour < 24; hour++) {
      final checkIns = hourlyData[hour]?.length ?? 0;
      final averageWaitTime = checkIns > 0 ? 2.3 : 0.0; // Mock wait time
      
      result.add(HourlyCheckInData(
        hour: hour,
        checkIns: checkIns,
        averageWaitTime: averageWaitTime,
      ));
    }

    return result;
  }

  /// Private method to get staff performance data
  Future<List<StaffPerformanceData>> _getStaffPerformanceData(
    String eventId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    // Get all check-ins for the event - using simpler query
    final checkInsQuery = await _firestore
        .collection('checkIns')
        .where('eventId', isEqualTo: eventId)
        .get();

    // Filter by date range in memory to avoid composite index requirement
    final checkInsInRange = checkInsQuery.docs.where((doc) {
      final checkInTime = (doc.data()['checkInTime'] as Timestamp).toDate();
      return checkInTime.isAfter(startDate) && checkInTime.isBefore(endDate);
    }).toList();

    // Group by staff ID
    final staffCheckIns = <String, List<Map<String, dynamic>>>{};
    for (final doc in checkInsInRange) {
      final data = doc.data();
      final staffId = data['staffId'] as String;
      staffCheckIns[staffId] = (staffCheckIns[staffId] ?? [])..add(data);
    }

    final result = <StaffPerformanceData>[];
    
    for (final entry in staffCheckIns.entries) {
      final staffId = entry.key;
      final checkIns = entry.value;
      
      // Get staff name from users collection
      String staffName = 'Unknown Staff';
      try {
        final staffDoc = await _firestore.collection('users').doc(staffId).get();
        if (staffDoc.exists) {
          final staffData = staffDoc.data()!;
          staffName = staffData['displayName'] ?? staffData['name'] ?? staffData['email']?.split('@').first ?? 'Unknown Staff';
        }
      } catch (e) {
        // Keep default name if user lookup fails
      }

      final checkInCount = checkIns.length;
      final averageWaitTime = 2.3; // Mock wait time
      final lastActivity = checkIns.isNotEmpty 
          ? (checkIns.last['checkInTime'] as Timestamp).toDate()
          : DateTime.now().subtract(const Duration(hours: 1));
      
      // Determine status based on recent activity
      final timeSinceLastActivity = DateTime.now().difference(lastActivity);
      String status;
      if (timeSinceLastActivity.inMinutes < 30) {
        status = 'Active';
      } else if (timeSinceLastActivity.inHours < 2) {
        status = 'Idle';
      } else {
        status = 'Offline';
      }

      result.add(StaffPerformanceData(
        staffId: staffId,
        staffName: staffName,
        checkIns: checkInCount,
        averageWaitTime: averageWaitTime,
        status: status,
        lastActivity: lastActivity,
      ));
    }

    // Sort by check-in count (descending)
    result.sort((a, b) => b.checkIns.compareTo(a.checkIns));
    
    return result;
  }

  /// Helper method to get date range based on time period
  ({DateTime start, DateTime end}) _getDateRange(
    ReportTimePeriod timePeriod,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    final now = DateTime.now();
    
    switch (timePeriod) {
      case ReportTimePeriod.today:
        final todayStart = DateTime(now.year, now.month, now.day);
        return (start: todayStart, end: todayStart.add(const Duration(days: 1)));
      
      case ReportTimePeriod.thisWeek:
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        final weekStartDay = DateTime(weekStart.year, weekStart.month, weekStart.day);
        return (start: weekStartDay, end: weekStartDay.add(const Duration(days: 7)));
      
      case ReportTimePeriod.thisMonth:
        final monthStart = DateTime(now.year, now.month, 1);
        final nextMonth = DateTime(now.year, now.month + 1, 1);
        return (start: monthStart, end: nextMonth);
      
      case ReportTimePeriod.custom:
        if (startDate != null && endDate != null) {
          return (start: startDate, end: endDate);
        }
        // Fallback to today if custom dates not provided
        final todayStart = DateTime(now.year, now.month, now.day);
        return (start: todayStart, end: todayStart.add(const Duration(days: 1)));
    }
  }

  /// Helper method to format hour for display
  String _formatHour(int hour) {
    if (hour == 0) return '12:00 AM';
    if (hour < 12) return '$hour:00 AM';
    if (hour == 12) return '12:00 PM';
    return '${hour - 12}:00 PM';
  }
}