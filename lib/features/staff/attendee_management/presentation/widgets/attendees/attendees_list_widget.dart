import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendee_card_widget.dart';

class AttendeesListWidget extends StatelessWidget {
  final List<AttendeeEntity> attendees;
  final String searchQuery;
  final void Function(AttendeeEntity) onManualCheckIn;

  const AttendeesListWidget({
    super.key,
    required this.attendees,
    required this.searchQuery,
    required this.onManualCheckIn,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (attendees.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 64.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No attendees found',
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 8.h),
            Text(
              searchQuery.isNotEmpty 
                  ? 'Try adjusting your search criteria'
                  : 'No attendees registered for this event yet',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: attendees.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return AttendeeCardWidget(
          attendee: attendees[index],
          onManualCheckIn: onManualCheckIn,
        );
      },
    );
  }
}