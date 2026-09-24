import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

class CategoryRevenueBreakdown extends StatelessWidget {
  const CategoryRevenueBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        if (state.analytics != null) {
          return _buildBreakdown(context, state.analytics!);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBreakdown(
      BuildContext context, OrganizerAnalyticsEntity analytics) {
    if (analytics.revenueByCategory.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Revenue by category',
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 14.h),
        ...analytics.revenueByCategory.entries.map((entry) {
          final percentage = analytics.totalRevenue > 0
              ? (entry.value / analytics.totalRevenue) * 100
              : 0.0;

          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.06),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(entry.key, style: theme.textTheme.titleSmall),
                      ),
                      Text(
                        '${entry.value.toStringAsFixed(0)} Birr',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: colorScheme.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: LinearProgressIndicator(
                      value: (percentage / 100).clamp(0.0, 1.0),
                      minHeight: 8.h,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      color: colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${percentage.toStringAsFixed(1)}% of total',
                      style: theme.textTheme.bodySmall,
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
}
