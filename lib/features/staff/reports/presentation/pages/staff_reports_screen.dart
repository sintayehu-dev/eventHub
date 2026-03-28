import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/reports/application/staff_reports/bloc/staff_reports_bloc.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';

class StaffReportsScreen extends StatelessWidget {
  const StaffReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();
    final staffId = currentUser?.uid ?? 'unknown_staff';

    return BlocProvider(
      create: (_) => getIt<StaffReportsBloc>()
        ..add(StaffReportsEvent.loadRealTimeMetrics(
          eventId: '1774346204603_176467', // Using the test event ID
          staffId: staffId,
        )),
      child: const StaffReportsView(),
    );
  }
}

class StaffReportsView extends StatefulWidget {
  const StaffReportsView({super.key});

  @override
  State<StaffReportsView> createState() => _StaffReportsViewState();
}

class _StaffReportsViewState extends State<StaffReportsView> {
  ReportTimePeriod _selectedPeriod = ReportTimePeriod.today;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: BlocConsumer<StaffReportsBloc, StaffReportsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message, _, __) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error loading reports: $message'),
                    backgroundColor: const Color(0xFFEF4444),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<StaffReportsBloc>().add(
                      const StaffReportsEvent.refreshReport(),
                    );
              },
              color: const Color(0xFF8B5CF6),
              backgroundColor: const Color(0xFF2A1B3D),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    _buildHeader(),
                    SizedBox(height: 24.h),

                    // Time Period Selector
                    _buildTimePeriodSelector(),
                    SizedBox(height: 24.h),

                    // Content based on state
                    state.when(
                      initial: (_) => _buildLoadingState(),
                      loading: (_, previousReport) => previousReport != null
                          ? _buildReportContent(previousReport)
                          : _buildLoadingState(),
                      loaded: (report, _) => _buildReportContent(report),
                      error: (message, _, previousReport) =>
                          previousReport != null
                              ? _buildReportContent(previousReport)
                              : _buildErrorState(message),
                      metricsLoaded: (metrics, _) =>
                          _buildMetricsContent(metrics),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reports',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<StaffReportsBloc>().add(
                  const StaffReportsEvent.refreshReport(),
                );
          },
          icon: Icon(
            Icons.refresh,
            color: const Color(0xFF8B5CF6),
            size: 24.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildTimePeriodSelector() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: ReportTimePeriod.values.take(3).map((period) {
          final isSelected = _selectedPeriod == period;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPeriod = period;
                });
                context.read<StaffReportsBloc>().add(
                      StaffReportsEvent.changeTimePeriod(timePeriod: period),
                    );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  period.displayName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[400],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: [
        SizedBox(height: 100.h),
        const CircularProgressIndicator(
          color: Color(0xFF8B5CF6),
        ),
        SizedBox(height: 16.h),
        Text(
          'Loading reports...',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(String message) {
    return Column(
      children: [
        SizedBox(height: 100.h),
        Icon(
          Icons.error_outline,
          color: const Color(0xFFEF4444),
          size: 48.sp,
        ),
        SizedBox(height: 16.h),
        Text(
          'Failed to load reports',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          message,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        ElevatedButton(
          onPressed: () {
            context.read<StaffReportsBloc>().add(
                  const StaffReportsEvent.refreshReport(),
                );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B5CF6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Retry',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsContent(StaffReportMetrics metrics) {
    return Column(
      children: [
        _buildKeyMetrics(metrics),
        SizedBox(height: 32.h),
        _buildCheckInChart(),
        SizedBox(height: 32.h),
        _buildEventSummary(metrics),
      ],
    );
  }

  Widget _buildReportContent(StaffReportEntity report) {
    return Column(
      children: [
        _buildKeyMetrics(report.metrics),
        SizedBox(height: 32.h),
        _buildCheckInChart(hourlyData: report.hourlyData),
        SizedBox(height: 32.h),
        _buildStaffPerformance(report.staffPerformance),
        SizedBox(height: 32.h),
        _buildEventSummary(report.metrics),
      ],
    );
  }

  Widget _buildKeyMetrics(StaffReportMetrics metrics) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'Total Check-ins',
                value: '${metrics.totalCheckIns}',
                change: '+${metrics.todayCheckIns} today',
                color: const Color(0xFF4ADE80),
                icon: Icons.check_circle,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildMetricCard(
                title: 'Avg. Wait Time',
                value: '${metrics.averageWaitTime.toStringAsFixed(1)} min',
                change: 'Real-time data',
                color: const Color(0xFF06B6D4),
                icon: Icons.timer,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'Peak Hour',
                value: metrics.peakHour,
                change: '${metrics.peakHourCheckIns} entries',
                color: const Color(0xFFF59E0B),
                icon: Icons.trending_up,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildMetricCard(
                title: 'Check-in Rate',
                value: '${metrics.checkInRate.toStringAsFixed(1)}%',
                change:
                    '${metrics.checkedInAttendees}/${metrics.totalAttendees}',
                color: const Color(0xFF8B5CF6),
                icon: Icons.analytics,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String change,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.sp,
                ),
              ),
              Icon(
                icon,
                color: color,
                size: 16.sp,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            change,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckInChart({List<HourlyCheckInData>? hourlyData}) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Check-in Activity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          if (hourlyData != null && hourlyData.isNotEmpty)
            _buildHourlyChart(hourlyData)
          else
            _buildPlaceholderChart(),
        ],
      ),
    );
  }

  Widget _buildHourlyChart(List<HourlyCheckInData> hourlyData) {
    final maxCheckIns =
        hourlyData.map((e) => e.checkIns).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 120.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:
            hourlyData.where((data) => data.checkIns > 0).take(12).map((data) {
          final height =
              maxCheckIns > 0 ? (data.checkIns / maxCheckIns) * 100.h : 0.0;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 16.w,
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF4ADE80).withValues(alpha: 0.8),
                      const Color(0xFF4ADE80).withValues(alpha: 0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '${data.hour}h',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 10.sp,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPlaceholderChart() {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF4ADE80).withValues(alpha: 0.3),
            const Color(0xFF4ADE80).withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart,
              color: const Color(0xFF4ADE80),
              size: 32.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              'Check-in Timeline',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaffPerformance(List<StaffPerformanceData> staffPerformance) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Staff Performance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...staffPerformance.take(5).map((staff) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildStaffItem(
                name: staff.staffName,
                checkIns: '${staff.checkIns}',
                avgTime: '${staff.averageWaitTime.toStringAsFixed(1)} min',
                status: staff.status,
                color: _getStatusColor(staff.status),
          ),
            )),
      ],
    );
  }

  Widget _buildEventSummary(StaffReportMetrics metrics) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event Summary',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _buildSummaryRow('Total Attendees', '${metrics.totalAttendees}'),
          _buildSummaryRow('Checked In', '${metrics.checkedInAttendees}'),
          _buildSummaryRow('Issues Resolved', '${metrics.issuesResolved}'),
          _buildSummaryRow('Pending Issues', '${metrics.pendingIssues}'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffItem({
    required String name,
    required String checkIns,
    required String avgTime,
    required String status,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.person,
              color: color,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '$checkIns check-ins • $avgTime avg',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFF4ADE80);
      case 'idle':
        return const Color(0xFFF59E0B);
      case 'offline':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF06B6D4);
    }
  }
}