import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          'Top Performing Events',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
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
