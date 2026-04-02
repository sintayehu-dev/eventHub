import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';

class AttendeeCardWidget extends StatelessWidget {
  final AttendeeEntity attendee;
  final void Function(AttendeeEntity) onManualCheckIn;

  const AttendeeCardWidget({
    super.key,
    required this.attendee,
    required this.onManualCheckIn,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCheckedIn = attendee.status == AttendeeStatus.checkedIn;
    final statusColor = _getStatusColor(attendee.status);
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _getInitials(attendee.name),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          
          // Attendee Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendee.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  attendee.email,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        attendee.ticketType,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (attendee.phone != null) ...[
                      SizedBox(width: 8.w),
                      Text(
                        '• ${attendee.phone}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          
          // Status and Actions
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getStatusIcon(attendee.status),
                      color: statusColor,
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      attendee.status.displayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCheckedIn && attendee.checkInTime != null) ...[
                SizedBox(height: 8.h),
                Text(
                  _formatTime(attendee.checkInTime!),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
              if (!isCheckedIn) ...[
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () => onManualCheckIn(attendee),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    minimumSize: Size.zero,
                  ),
                  child: Text(
                    'Check In',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _getInitials(String name) {
    return name.split(' ').map((e) => e.isNotEmpty ? e[0] : '').join().toUpperCase();
  }

  Color _getStatusColor(AttendeeStatus status) {
    switch (status) {
      case AttendeeStatus.checkedIn:
        return Colors.green;
      case AttendeeStatus.registered:
        return Colors.orange;
      case AttendeeStatus.noShow:
        return Colors.red;
      case AttendeeStatus.cancelled:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(AttendeeStatus status) {
    switch (status) {
      case AttendeeStatus.checkedIn:
        return Icons.check_circle;
      case AttendeeStatus.registered:
        return Icons.pending;
      case AttendeeStatus.noShow:
        return Icons.cancel;
      case AttendeeStatus.cancelled:
        return Icons.block;
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}