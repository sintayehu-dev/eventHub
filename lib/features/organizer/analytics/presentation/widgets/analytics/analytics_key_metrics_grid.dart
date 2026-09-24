import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
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
    final changes = comparison?.changes;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _MetricCard(
                title: 'Total revenue',
                value: '${analytics.totalRevenue.toStringAsFixed(0)} Birr',
                change: changes?.revenueChangeFormatted,
                isPositive: changes?.isRevenuePositive ?? true,
                icon: Icons.payments_rounded,
                tint: AppColors.sky,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _MetricCard(
                title: 'Tickets sold',
                value: '${analytics.totalTicketsSold}',
                change: changes?.ticketsSoldChangeFormatted,
                isPositive: changes?.isTicketsSoldPositive ?? true,
                icon: Icons.confirmation_number_rounded,
                tint: AppColors.peach,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _MetricCard(
                title: 'Avg. ticket price',
                value:
                    '${analytics.averageTicketPrice.toStringAsFixed(2)} Birr',
                change: changes?.averageTicketPriceChangeFormatted,
                isPositive: changes?.isAverageTicketPricePositive ?? true,
                icon: Icons.sell_rounded,
                tint: AppColors.mint,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _MetricCard(
                title: 'Conversion rate',
                value: '${analytics.conversionRate.toStringAsFixed(1)}%',
                change: changes?.conversionRateChangeFormatted,
                isPositive: changes?.isConversionRatePositive ?? true,
                icon: Icons.trending_up_rounded,
                tint: AppColors.peachDeep,
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

  /// Null when there is no previous period to compare against; the trend chip
  /// is hidden rather than showing a made-up number.
  final String? change;
  final bool isPositive;
  final IconData icon;
  final Color tint;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.icon,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trendColor = isPositive ? AppColors.success : AppColors.error;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 18.sp),
          ),
          SizedBox(height: 14.h),
          Text(
            title,
            style: theme.textTheme.labelMedium
                ?.copyWith(color: AppColors.ink.withValues(alpha: 0.7)),
          ),
          SizedBox(height: 2.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(color: AppColors.ink),
            ),
          ),
          if (change != null) ...[
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isPositive
                        ? Icons.trending_up_rounded
                        : Icons.trending_down_rounded,
                    color: trendColor,
                    size: 14.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    change!,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: trendColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
