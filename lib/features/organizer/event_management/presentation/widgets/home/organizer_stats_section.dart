import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class OrganizerStatsSection extends StatelessWidget {
  const OrganizerStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventManagementBloc, EventManagementState>(
      builder: (context, state) {
        if (state.isLoading) {
          return _buildLoadingStats(context);
        }

        if (state.hasError && state.errorMessage.isNotEmpty) {
          return _buildErrorSection(context, state.errorMessage);
        }

        if (state.events.isNotEmpty) {
          return _buildStatsContent(context, state.events);
        }

        if (state.selectedEvent != null) {
          return _buildStatsContent(context, [state.selectedEvent!]);
        }

        return _buildLoadingStats(context);
      },
    );
  }

  Widget _buildStatsContent(BuildContext context, List<EventEntity> events) {
    final colorScheme = Theme.of(context).colorScheme;
    
    final totalRevenue = events.fold<double>(0.0, (sum, event) {
      return sum + event.ticketTypes.fold<double>(0.0, (ticketSum, ticket) {
        final sold = ticket.quantity - ticket.availableQuantity;
        return ticketSum + (sold * ticket.price);
      });
    });

    final totalTicketsSold = events.fold<int>(0, (sum, event) {
      return sum + event.ticketTypes.fold<int>(0, (ticketSum, ticket) {
        return ticketSum + (ticket.quantity - ticket.availableQuantity);
      });
    });

    final totalCapacity = events.fold<int>(0, (sum, event) => sum + event.maxCapacity);
    final avgAttendance = totalCapacity > 0 ? (totalTicketsSold / totalCapacity) * 100 : 0.0;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Total Revenue',
                value: totalRevenue > 0 ? '\$${totalRevenue.toStringAsFixed(0)}' : '\$0',
                change: '+12%',
                isPositive: true,
                color: colorScheme.primary,
                icon: Icons.attach_money,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _StatCard(
                title: 'Active Events',
                value: '${events.length}',
                change: '+3 new',
                isPositive: true,
                color: colorScheme.tertiary,
                icon: Icons.event,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Tickets Sold',
                value: '$totalTicketsSold',
                change: '+8%',
                isPositive: true,
                color: colorScheme.secondary,
                icon: Icons.confirmation_number,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _StatCard(
                title: 'Avg. Attendance',
                value: '${avgAttendance.toInt()}%',
                change: '+2.5%',
                isPositive: true,
                color: colorScheme.tertiary,
                icon: Icons.people,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingStats(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: _ShimmerStatCard()),
            SizedBox(width: 16.w),
            const Expanded(child: _ShimmerStatCard()),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Expanded(child: _ShimmerStatCard()),
            SizedBox(width: 16.w),
            const Expanded(child: _ShimmerStatCard()),
          ],
        ),
      ],
    );
  }

  Widget _buildErrorSection(BuildContext context, String message) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
            color: Theme.of(context).colorScheme.error.withValues(alpha: 0.3)),
      ),
      child: AppErrorRetryWidget(
        errorMessage: message,
        onRetry: () {
          // Clear error and let parent handle refresh
          context.read<EventManagementBloc>().add(
                const EventManagementEvent.clearError(),
              );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isPositive
                  ? colorScheme.tertiary.withValues(alpha: 0.1)
                  : colorScheme.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: isPositive ? colorScheme.tertiary : colorScheme.error,
                  size: 14.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  change,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isPositive ? colorScheme.tertiary : colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerStatCard extends StatelessWidget {
  const _ShimmerStatCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerBox(
                width: 36.w,
                height: 36.w,
                borderRadius: BorderRadius.circular(10.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ShimmerText(
                  width: double.infinity,
                  height: 14.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ShimmerText(
            width: 80.w,
            height: 24.h,
          ),
          SizedBox(height: 8.h),
          ShimmerBox(
            width: 60.w,
            height: 20.h,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ],
      ),
    );
  }
}
