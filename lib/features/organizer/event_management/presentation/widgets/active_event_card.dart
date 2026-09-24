import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'organizer_event_utils.dart';

class ActiveEventCard extends StatelessWidget {
  final EventEntity event;
  final VoidCallback onTap;

  const ActiveEventCard({
    super.key,
    required this.event,
    required this.onTap,
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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: SizedBox(
                width: 72.w,
                height: 72.w,
                child: event.bannerUrl != null && event.bannerUrl!.isNotEmpty
                    ? Image.network(
                        event.bannerUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) =>
                            loadingProgress == null
                                ? child
                                : _placeholder(scheme),
                        errorBuilder: (_, __, ___) => _placeholder(scheme),
                      )
                    : _placeholder(scheme),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    OrganizerEventUtils.formatDateTime(event.dateTime),
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$soldTickets / $totalTickets sold',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '${revenue.toStringAsFixed(0)} Birr',
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: scheme.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6.h,
                      backgroundColor: scheme.surfaceContainerHighest,
                      color: scheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder(ColorScheme scheme) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [scheme.primaryContainer, scheme.secondaryContainer],
        ),
      ),
      child: Icon(Icons.celebration_rounded,
          size: 26.sp, color: scheme.primary.withValues(alpha: 0.4)),
    );
  }
}
