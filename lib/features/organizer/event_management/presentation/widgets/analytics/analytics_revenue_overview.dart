import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

class AnalyticsRevenueOverview extends StatelessWidget {
  const AnalyticsRevenueOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (analytics, _) => _buildChart(context, analytics),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildChart(BuildContext context, OrganizerAnalyticsEntity analytics) {
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
                : _buildSimpleChartGrid(context, analytics.revenueChart),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleChartGrid(
      BuildContext context, List<RevenueDataPoint> dataPoints) {
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
}
