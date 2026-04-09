import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

class StaffHomeHeader extends StatelessWidget {
  final List<StaffEventAssignmentEntity> events;
  final StaffEventAssignmentEntity? selectedEvent;

  const StaffHomeHeader({
    super.key,
    required this.events,
    this.selectedEvent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Empty space to balance the layout
            SizedBox(width: 24.sp),
            Column(
              children: [
                Text(
                  'ENTRY CONTROL',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  selectedEvent != null
                      ? '${selectedEvent!.eventTitle} • Gate A'
                      : 'Event Scanner • Gate A',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: theme.colorScheme.onSurface,
                size: 24.sp,
              ),
              onSelected: (eventId) {
                context.read<StaffEventAssignmentBloc>().add(
                      StaffEventAssignmentEvent.selectEvent(eventId: eventId),
                    );
              },
              itemBuilder: (context) => events.map((event) {
                return PopupMenuItem<String>(
                  value: event.eventId,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventTitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        event.eventLocation,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        if (events.length > 1) ...[
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.event,
                  size: 16.sp,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                SizedBox(width: 8.w),
                Text(
                  '${events.length} events assigned',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}