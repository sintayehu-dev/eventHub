import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
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
    final scheme = Theme.of(context).colorScheme;
    final canCancel = event.status.canBeCancelled;

    return Column(
      children: [
        AppButton(
          label: 'View all attendees',
          icon: Icons.people_alt_rounded,
          variant: AppButtonVariant.accent,
          onPressed: onViewAttendees,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52.h,
                child: OutlinedButton.icon(
                  onPressed: onBroadcast,
                  icon: Icon(Icons.campaign_outlined, size: 18.sp),
                  label: const Text('Broadcast'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: scheme.onSurface,
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SizedBox(
                height: 52.h,
                child: OutlinedButton.icon(
                  onPressed: canCancel ? onCancel : null,
                  icon: Icon(Icons.cancel_outlined, size: 18.sp),
                  label: const Text('Cancel'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: scheme.error,
                    side: BorderSide(
                      color: canCancel
                          ? scheme.error.withValues(alpha: 0.5)
                          : scheme.outlineVariant,
                      width: 1.5,
                    ),
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
