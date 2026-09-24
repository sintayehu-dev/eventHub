import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventPerformanceMetrics extends StatelessWidget {
  final EventEntity event;

  const EventPerformanceMetrics({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final soldTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + (ticket.quantity - ticket.availableQuantity),
    );
    final totalTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + ticket.quantity,
    );
    final revenue = event.ticketTypes.fold<double>(
      0.0,
      (sum, ticket) {
        final sold = ticket.quantity - ticket.availableQuantity;
        return sum + (sold * ticket.price);
      },
    );
    final progress =
        totalTickets > 0 ? (soldTickets / totalTickets).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Performance', style: theme.textTheme.titleLarge),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tickets sold', style: theme.textTheme.bodySmall),
                  Text(
                    '${(progress * 100).toInt()}% of capacity',
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: scheme.primary),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                '$soldTickets',
                style: theme.textTheme.displaySmall,
              ),
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8.h,
                  backgroundColor: scheme.surfaceContainerHighest,
                  color: scheme.secondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _MetricTile(
                title: 'Remaining',
                value: '${totalTickets - soldTickets}',
                icon: Icons.confirmation_number_rounded,
                tint: AppColors.sky,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _MetricTile(
                title: 'Revenue',
                value: '${revenue.toStringAsFixed(0)} Birr',
                icon: Icons.payments_rounded,
                tint: AppColors.peach,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color tint;

  const _MetricTile({
    required this.title,
    required this.value,
    required this.icon,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
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
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: AppColors.ink, height: 1.1),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: theme.textTheme.labelMedium
                ?.copyWith(color: AppColors.ink.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}
