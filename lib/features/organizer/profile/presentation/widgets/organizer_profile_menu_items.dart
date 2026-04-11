import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/utils/app_helpers.dart';

class OrganizerProfileMenuItems extends StatelessWidget {
  const OrganizerProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        _buildMenuCard(context, 'My Events', Icons.event_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard(context, 'Create Event', Icons.add_circle_outline, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard(context, 'Revenue & Analytics', Icons.bar_chart_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard(context, 'Staff Management', Icons.people_outline, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard(context, 'Promotion Tools', Icons.campaign_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard(context, 'Help & Support', Icons.help_outline, theme, colorScheme),
      ],
    );
  }

  Widget _buildMenuCard(
      BuildContext context, String title, IconData icon, ThemeData theme, ColorScheme colorScheme) {
    return InkWell(
      onTap: () => _showToBeImplemented(context),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: colorScheme.secondary,
                size: 18.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurfaceVariant,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _showToBeImplemented(BuildContext context) {
    AppHelpers.showInfoSnackBar(context, 'Feature to be implemented');
  }
}
