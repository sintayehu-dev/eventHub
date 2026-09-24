import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventInfoSection extends StatelessWidget {
  final EventEntity event;

  const EventInfoSection({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    BoxDecoration cardDecoration() => BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: scheme.shadow.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Event information', style: theme.textTheme.titleLarge),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.w),
          decoration: cardDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description', style: theme.textTheme.bodySmall),
              SizedBox(height: 8.h),
              Text(
                event.description,
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(18.w),
          decoration: cardDecoration(),
          child: Column(
            children: [
              _buildInfoRow(
                context,
                'Date & time',
                _formatDateTime(event.dateTime),
                Icons.calendar_today_rounded,
              ),
              SizedBox(height: 16.h),
              _buildInfoRow(
                context,
                'Location',
                event.location,
                Icons.location_on_rounded,
              ),
              SizedBox(height: 16.h),
              _buildInfoRow(
                context,
                'Capacity',
                '${event.maxCapacity} attendees',
                Icons.people_rounded,
              ),
              if (event.ticketTypes.isNotEmpty) ...[
                SizedBox(height: 16.h),
                _buildInfoRow(
                  context,
                  'Ticket types',
                  '${event.ticketTypes.length} type${event.ticketTypes.length > 1 ? 's' : ''}',
                  Icons.confirmation_number_rounded,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
      BuildContext context, String label, String value, IconData icon) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: scheme.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: scheme.primary, size: 18.sp),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: theme.textTheme.bodySmall),
              SizedBox(height: 2.h),
              Text(value, style: theme.textTheme.titleSmall),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final year = dateTime.year;
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$month $day, $year • $displayHour:$minute $period';
  }
}
