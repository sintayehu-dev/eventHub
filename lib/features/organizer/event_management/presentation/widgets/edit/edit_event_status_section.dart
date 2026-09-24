import 'package:flutter/material.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EditEventStatusSection extends StatelessWidget {
  final EventStatus status;

  const EditEventStatusSection({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context, status);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              status.displayName.toUpperCase(),
              style: TextStyle(
                color: statusColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              status.isEditable
                  ? 'This event can be edited'
                  : 'Limited editing available for this status',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(BuildContext context, EventStatus status) {
    switch (status) {
      case EventStatus.active:
        return AppColors.success;
      case EventStatus.draft:
        return Theme.of(context).colorScheme.primary;
      case EventStatus.completed:
        return AppColors.primaryLight;
      case EventStatus.cancelled:
        return AppColors.error;
    }
  }
}
