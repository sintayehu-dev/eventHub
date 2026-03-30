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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: Text(
            'Please log in to view analytics',
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: colorScheme.onSurface),
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
            final colorScheme = Theme.of(context).colorScheme;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: colorScheme.error,
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
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            child: state.when(
              initial: () => Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<AnalyticsBloc>()
            .add(const AnalyticsEvent.refreshAnalytics());
      },
      color: colorScheme.primary,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Analytics',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: colorScheme.error,
            size: 48.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            'Error loading analytics',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
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
              backgroundColor: colorScheme.primary,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePeriodSelector() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
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
                  color: isSelected ? colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  period.displayName,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
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
                color: colorScheme.primary,
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
                color: colorScheme.tertiary,
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
                color: colorScheme.secondary,
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
                color: colorScheme.tertiary,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
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
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? colorScheme.tertiary : colorScheme.error,
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                change,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isPositive ? colorScheme.tertiary : colorScheme.error,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Revenue Overview',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
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
                  colorScheme.primary.withValues(alpha: 0.3),
                  colorScheme.primary.withValues(alpha: 0.1),
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
                          color: colorScheme.primary,
                          size: 32.sp,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'No revenue data yet',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
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
    final colorScheme = Theme.of(context).colorScheme;
    
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
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(4.r),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTopEvents(OrganizerAnalyticsEntity analytics) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Performing Events',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        if (analytics.topEvents.isEmpty)
          Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.event_note,
                    color: colorScheme.onSurfaceVariant,
                    size: 48.sp,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No events yet',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Create your first event to see analytics',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    if (analytics.revenueByCategory.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revenue by Category',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
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
                color: colorScheme.surfaceContainerHighest,
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
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '${percentage.toStringAsFixed(1)}% of total',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${entry.value.toStringAsFixed(0)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
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
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onPrimary,
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
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  tickets,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Text(
            revenue,
            style: theme.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}