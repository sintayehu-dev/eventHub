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
    final colorScheme = theme.colorScheme;

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

    final progress = totalTickets > 0 ? soldTickets / totalTickets : 0.0;
    final statusColor =
        OrganizerEventUtils.getStatusColor(context, event.status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: statusColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Event Image with Placeholder
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: event.bannerUrl != null && event.bannerUrl!.isNotEmpty
                    ? Image.network(
                        event.bannerUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: colorScheme.surface,
                            child: Center(
                              child: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                  color: colorScheme.primary,
                                  strokeWidth: 2,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return _buildEventImagePlaceholder(statusColor);
                        },
                      )
                    : _buildEventImagePlaceholder(statusColor),
              ),
            ),
            SizedBox(width: 16.w),

            // Event Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    OrganizerEventUtils.formatDateTime(event.dateTime),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    event.location,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  // Progress Bar
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$soldTickets / $totalTickets sold',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            revenue > 0
                                ? '\$${revenue.toStringAsFixed(0)}'
                                : 'Free',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: colorScheme.outline,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // More Options
            Icon(
              Icons.more_vert,
              color: colorScheme.onSurfaceVariant,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventImagePlaceholder(Color color) {
    return Container(
      color: color.withValues(alpha: 0.2),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: color,
          size: 24.sp,
        ),
      ),
    );
  }
}
