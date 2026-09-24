import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

class TopPerformingEventsList extends StatelessWidget {
  const TopPerformingEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        if (state.analytics != null) {
          return _buildList(context, state.analytics!);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(BuildContext context, OrganizerAnalyticsEntity analytics) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top performing events',
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 14.h),
        if (analytics.topEvents.isEmpty)
          _buildEmptyState(context)
        else
          ...analytics.topEvents.asMap().entries.map((entry) {
            final index = entry.key;
            final event = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _TopEventItem(
                rank: index + 1,
                title: event.eventTitle,
                revenue: '${event.revenue.toStringAsFixed(0)} Birr',
                tickets: '${event.ticketsSold} sold',
                color: _getEventRankColor(index),
              ),
            );
          }),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(28.r),
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
    );
  }

  Color _getEventRankColor(int index) {
    switch (index) {
      case 0:
        return AppColors.accent;
      case 1:
        return AppColors.primary;
      case 2:
        return AppColors.primaryLight;
      default:
        return AppColors.inkSoft;
    }
  }
}

class _TopEventItem extends StatelessWidget {
  final int rank;
  final String title;
  final String revenue;
  final String tickets;
  final Color color;

  const _TopEventItem({
    required this.rank,
    required this.title,
    required this.revenue,
    required this.tickets,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(14.w),
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
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: rank == 1 ? AppColors.ink : AppColors.white,
                  fontWeight: FontWeight.w800,
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
                  style: theme.textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
            style: theme.textTheme.titleMedium
                ?.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
