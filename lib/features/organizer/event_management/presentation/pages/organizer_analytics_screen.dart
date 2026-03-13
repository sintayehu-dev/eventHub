import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

class OrganizerAnalyticsScreen extends StatelessWidget {
  const OrganizerAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A0B2E),
        body: Center(
          child: Text(
            'Please log in to view analytics',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return BlocProvider(
      create: (_) => getIt<AnalyticsBloc>()
        ..add(AnalyticsEvent.loadAnalytics(
          organizerId: currentUser.uid,
          period: AnalyticsPeriod.thisMonth,
        )),
      child: const OrganizerAnalyticsView(),
    );
  }
}

class OrganizerAnalyticsView extends StatefulWidget {
  const OrganizerAnalyticsView({super.key});

  @override
  State<OrganizerAnalyticsView> createState() => _OrganizerAnalyticsViewState();
}

class _OrganizerAnalyticsViewState extends State<OrganizerAnalyticsView> {
  AnalyticsPeriod _selectedPeriod = AnalyticsPeriod.thisMonth;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnalyticsBloc, AnalyticsState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: const Color(0xFFEF4444),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF1A0B2E),
          body: SafeArea(
            child: state.when(
              initial: () => const Center(
                child: CircularProgressIndicator(color: Color(0xFF8B5CF6)),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Color(0xFF8B5CF6)),
              ),
              loaded: (analytics, comparison) =>
                  _buildLoadedContent(analytics, comparison),
              error: (message) => _buildErrorContent(message),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadedContent(
      OrganizerAnalyticsEntity analytics, AnalyticsComparison? comparison) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<AnalyticsBloc>()
            .add(const AnalyticsEvent.refreshAnalytics());
      },
      color: const Color(0xFF8B5CF6),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Analytics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),

            // Time Period Selector
            _buildTimePeriodSelector(),
            SizedBox(height: 24.h),

            // Key Metrics
            _buildKeyMetrics(analytics, comparison),
            SizedBox(height: 32.h),
            
            // Revenue Chart
            _buildRevenueChart(analytics),
            SizedBox(height: 32.h),

            // Top Events
            _buildTopEvents(analytics),
            SizedBox(height: 32.h),

            // Category Breakdown
            _buildCategoryBreakdown(analytics),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContent(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 48.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            'Error loading analytics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context
                  .read<AnalyticsBloc>()
                  .add(const AnalyticsEvent.refreshAnalytics());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B5CF6),
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
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
        children: AnalyticsPeriod.values.take(3).map((period) {
          final isSelected = _selectedPeriod == period;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPeriod = period;
                });
                context.read<AnalyticsBloc>().add(
                      AnalyticsEvent.changePeriod(period: period),
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
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
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

  Widget _buildKeyMetrics(
      OrganizerAnalyticsEntity analytics, AnalyticsComparison? comparison) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'Total Revenue',
                value: '\$${analytics.totalRevenue.toStringAsFixed(0)}',
                change: comparison?.changes.revenueChangeFormatted ?? '+0.0%',
                isPositive: comparison?.changes.isRevenuePositive ?? true,
                color: const Color(0xFF8B5CF6),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildMetricCard(
                title: 'Tickets Sold',
                value: '${analytics.totalTicketsSold}',
                change:
                    comparison?.changes.ticketsSoldChangeFormatted ?? '+0.0%',
                isPositive: comparison?.changes.isTicketsSoldPositive ?? true,
                color: const Color(0xFF4ADE80),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'Avg. Ticket Price',
                value: '\$${analytics.averageTicketPrice.toStringAsFixed(2)}',
                change: comparison?.changes.averageTicketPriceChangeFormatted ??
                    '+0.0%',
                isPositive:
                    comparison?.changes.isAverageTicketPricePositive ?? true,
                color: const Color(0xFF06B6D4),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildMetricCard(
                title: 'Conversion Rate',
                value: '${analytics.conversionRate.toStringAsFixed(1)}%',
                change: comparison?.changes.conversionRateChangeFormatted ??
                    '+0.0%',
                isPositive:
                    comparison?.changes.isConversionRatePositive ?? true,
                color: const Color(0xFFF59E0B),
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
    required bool isPositive,
    required Color color,
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
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12.sp,
            ),
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
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? const Color(0xFF4ADE80) : const Color(0xFFEF4444),
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                change,
                style: TextStyle(
                  color: isPositive ? const Color(0xFF4ADE80) : const Color(0xFFEF4444),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueChart(OrganizerAnalyticsEntity analytics) {
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
            'Revenue Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                  const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: analytics.revenueChart.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: const Color(0xFF8B5CF6),
                          size: 32.sp,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'No revenue data yet',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  )
                : _buildSimpleChart(analytics.revenueChart),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleChart(List<RevenueDataPoint> dataPoints) {
    if (dataPoints.isEmpty) return const SizedBox.shrink();

    final maxRevenue =
        dataPoints.map((e) => e.revenue).reduce((a, b) => a > b ? a : b);
    if (maxRevenue == 0) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: dataPoints.take(7).map((point) {
          final height = (point.revenue / maxRevenue) * 80.h;
          return Container(
            width: 8.w,
            height: height.clamp(2.h, 80.h),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6),
              borderRadius: BorderRadius.circular(4.r),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTopEvents(OrganizerAnalyticsEntity analytics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Performing Events',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        if (analytics.topEvents.isEmpty)
          Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1B3D),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.event_note,
                    color: Colors.grey[600],
                    size: 48.sp,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No events yet',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Create your first event to see analytics',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...analytics.topEvents.asMap().entries.map((entry) {
            final index = entry.key;
            final event = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildTopEventItem(
                rank: index + 1,
                title: event.eventTitle,
                revenue: '\$${event.revenue.toStringAsFixed(0)}',
                tickets: '${event.ticketsSold} sold',
                color: _getEventRankColor(index),
              ),
            );
          }),
      ],
    );
  }

  Color _getEventRankColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF06B6D4);
      case 1:
        return const Color(0xFFF59E0B);
      case 2:
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF8B5CF6);
    }
  }

  Widget _buildCategoryBreakdown(OrganizerAnalyticsEntity analytics) {
    if (analytics.revenueByCategory.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revenue by Category',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...analytics.revenueByCategory.entries.map((entry) {
          final percentage = analytics.totalRevenue > 0
              ? (entry.value / analytics.totalRevenue) * 100
              : 0.0;

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1B3D),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '${percentage.toStringAsFixed(1)}% of total',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${entry.value.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTopEventItem({
    required int rank,
    required String title,
    required String revenue,
    required String tickets,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  tickets,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Text(
            revenue,
            style: TextStyle(
              color: color,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}