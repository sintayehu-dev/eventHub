import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendeeProfileMenu extends StatelessWidget {
  final VoidCallback? onTicketsTap;
  final VoidCallback? onPaymentTap;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onSupportTap;

  const AttendeeProfileMenu({
    super.key,
    this.onTicketsTap,
    this.onPaymentTap,
    this.onNotificationsTap,
    this.onPrivacyTap,
    this.onSupportTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        _AttendeeProfileMenuItem(
          title: 'My Tickets',
          icon: Icons.confirmation_number_outlined,
          onTap: onTicketsTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        SizedBox(height: 10.h),
        _AttendeeProfileMenuItem(
          title: 'Payment Methods',
          icon: Icons.payment_outlined,
          onTap: onPaymentTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        SizedBox(height: 10.h),
        _AttendeeProfileMenuItem(
          title: 'Notification Settings',
          icon: Icons.notifications_none_outlined,
          onTap: onNotificationsTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        SizedBox(height: 10.h),
        _AttendeeProfileMenuItem(
          title: 'Privacy & Security',
          icon: Icons.security_outlined,
          onTap: onPrivacyTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        SizedBox(height: 10.h),
        _AttendeeProfileMenuItem(
          title: 'Help & Support',
          icon: Icons.help_outline,
          onTap: onSupportTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
      ],
    );
  }
}

class _AttendeeProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _AttendeeProfileMenuItem({
    required this.title,
    required this.icon,
    this.onTap,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: colorScheme.primary,
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
}
