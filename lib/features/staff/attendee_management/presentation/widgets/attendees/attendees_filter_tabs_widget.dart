import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';

class AttendeesFilterTabsWidget extends StatelessWidget {
  final AttendeeStatus? selectedStatus;
  final void Function(AttendeeStatus?) onStatusFilter;

  const AttendeesFilterTabsWidget({
    super.key,
    required this.selectedStatus,
    required this.onStatusFilter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildFilterTab(
              context: context,
              title: 'All',
              isSelected: selectedStatus == null,
              onTap: () => onStatusFilter(null),
            ),
          ),
          Expanded(
            child: _buildFilterTab(
              context: context,
              title: 'Checked In',
              isSelected: selectedStatus == AttendeeStatus.checkedIn,
              onTap: () => onStatusFilter(AttendeeStatus.checkedIn),
            ),
          ),
          Expanded(
            child: _buildFilterTab(
              context: context,
              title: 'Registered',
              isSelected: selectedStatus == AttendeeStatus.registered,
              onTap: () => onStatusFilter(AttendeeStatus.registered),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected 
              ? theme.colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isSelected 
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}