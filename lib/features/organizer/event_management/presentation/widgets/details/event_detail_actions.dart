import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventDetailActions extends StatelessWidget {
  final EventEntity event;
  final VoidCallback onViewAttendees;
  final VoidCallback onBroadcast;
  final VoidCallback onCancel;

  const EventDetailActions({
    super.key,
    required this.event,
    required this.onViewAttendees,
    required this.onBroadcast,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onViewAttendees,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline,
                  color: colorScheme.onPrimary,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'View All Attendees',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onBroadcast,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: colorScheme.outline),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.broadcast_on_personal_outlined,
                      color: colorScheme.onSurfaceVariant,
                      size: 18.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Broadcast',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: OutlinedButton(
                onPressed: event.status.canBeCancelled ? onCancel : null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: event.status.canBeCancelled
                        ? colorScheme.error
                        : colorScheme.outline,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: event.status.canBeCancelled
                            ? colorScheme.error
                            : colorScheme.outline,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Cancel Event',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: event.status.canBeCancelled
                            ? colorScheme.error
                            : colorScheme.outline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
