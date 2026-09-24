import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
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

        return _buildStatsContent(context, const []);
      },
    );
  }

  Widget _buildStatsContent(BuildContext context, List<EventEntity> events) {
    final totalRevenue = events.fold<double>(0.0, (sum, event) {
      return sum +
          event.ticketTypes.fold<double>(0.0, (ticketSum, ticket) {
            final sold = ticket.quantity - ticket.availableQuantity;
            return ticketSum + (sold * ticket.price);
          });
    });

    final totalTicketsSold = events.fold<int>(0, (sum, event) {
      return sum +
          event.ticketTypes.fold<int>(0, (ticketSum, ticket) {
            return ticketSum + (ticket.quantity - ticket.availableQuantity);
          });
    });

    final totalCapacity =
        events.fold<int>(0, (sum, event) => sum + event.maxCapacity);
    final avgAttendance =
        totalCapacity > 0 ? (totalTicketsSold / totalCapacity) * 100 : 0.0;

    return Column(
      children: [
        _RevenueCard(
          revenue: totalRevenue,
          caption: events.isEmpty
              ? 'Create your first event to start earning'
              : '$totalTicketsSold ticket${totalTicketsSold == 1 ? '' : 's'} sold across ${events.length} event${events.length == 1 ? '' : 's'}',
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                title: 'Active events',
                value: '${events.length}',
                icon: Icons.event_rounded,
                tint: AppColors.sky,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _StatTile(
                title: 'Tickets sold',
                value: '$totalTicketsSold',
                icon: Icons.confirmation_number_rounded,
                tint: AppColors.peach,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _StatTile(
                title: 'Filled',
                value: '${avgAttendance.toInt()}%',
                icon: Icons.people_rounded,
                tint: AppColors.mint,
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
        ShimmerBox(
          width: double.infinity,
          height: 128.h,
          borderRadius: BorderRadius.circular(32.r),
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            for (var i = 0; i < 3; i++) ...[
              if (i > 0) SizedBox(width: 12.w),
              Expanded(
                child: ShimmerBox(
                  width: double.infinity,
                  height: 104.h,
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildErrorSection(BuildContext context, String message) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
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

class _RevenueCard extends StatelessWidget {
  final double revenue;
  final String caption;

  const _RevenueCard({required this.revenue, required this.caption});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22.w),
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.25),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40.w,
            bottom: -70.h,
            child: Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.payments_rounded,
                        size: 16.sp, color: AppColors.ink),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Total revenue',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Text(
                '${revenue.toStringAsFixed(0)} Birr',
                style: theme.textTheme.displaySmall
                    ?.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 6.h),
              Text(
                caption,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color tint;

  const _StatTile({
    required this.title,
    required this.value,
    required this.icon,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(24.r),
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
            value,
            style: theme.textTheme.headlineSmall
                ?.copyWith(color: AppColors.ink, height: 1.1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium
                ?.copyWith(color: AppColors.ink.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}
