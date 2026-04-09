import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

class AnalyticsKeyMetricsGrid extends StatelessWidget {
  const AnalyticsKeyMetricsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        if (state.analytics != null) {
          return _buildGrid(context, state.analytics!, state.comparison);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildGrid(BuildContext context, OrganizerAnalyticsEntity analytics,
      AnalyticsComparison? comparison) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _MetricCard(
                title: 'Total Revenue',
                value: '\$${analytics.totalRevenue.toStringAsFixed(0)}',
                change: comparison?.changes.revenueChangeFormatted ?? '+0.0%',
                isPositive: comparison?.changes.isRevenuePositive ?? true,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _MetricCard(
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
              child: _MetricCard(
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
              child: _MetricCard(
                title: 'Conversion Rate',
                value: '${analytics.conversionRate.toStringAsFixed(1)}%',
                change: comparison?.changes.conversionRateChangeFormatted ??
                    '+0.0%',
                isPositive: comparison?.changes.isConversionRatePositive ?? true,
                color: colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
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
}
