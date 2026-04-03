import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';

class QuickActionsWidget extends StatelessWidget {
  final String staffId;

  const QuickActionsWidget({
    super.key,
    required this.staffId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuickActionButton(
          icon: Icons.refresh,
          label: 'Reset',
          onTap: () {
            context.read<StaffEventAssignmentBloc>().add(
                  StaffEventAssignmentEvent.loadStaffEvents(staffId: staffId),
                );
          },
          theme: theme,
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
    required ThemeData theme,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: onTap != null
              ? theme.colorScheme.surface
              : theme.colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: theme.colorScheme.primary
                .withValues(alpha: onTap != null ? 0.3 : 0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.onSurface
                  .withValues(alpha: onTap != null ? 0.7 : 0.3),
              size: 24.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface
                    .withValues(alpha: onTap != null ? 0.7 : 0.3),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}