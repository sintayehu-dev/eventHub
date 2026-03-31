import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizerProfileMenuItems extends StatelessWidget {
  const OrganizerProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        _buildMenuCard(context, 'My Events', Icons.event_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard(context, 'Create Event', Icons.add_circle_outline, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard(context, 'Revenue & Analytics', Icons.bar_chart_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard(context, 'Staff Management', Icons.people_outline, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard(context, 'Promotion Tools', Icons.campaign_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard(context, 'Help & Support', Icons.help_outline, theme, colorScheme),
      ],
    );
  }

  Widget _buildMenuCard(
      BuildContext context, String title, IconData icon, ThemeData theme, ColorScheme colorScheme) {
    return InkWell(
      onTap: () => _showToBeImplemented(context),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: colorScheme.secondary,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 16.w),
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
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _showToBeImplemented(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Feature to be implemented',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSecondary,
          ),
        ),
        backgroundColor: colorScheme.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
