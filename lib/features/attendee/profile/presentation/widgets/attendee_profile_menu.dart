import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendeeProfileMenu extends StatelessWidget {
  final VoidCallback? onTicketsTap;
  final VoidCallback? onPaymentTap;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onSupportTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyPolicyTap;
  final VoidCallback? onDeleteAccountTap;

  const AttendeeProfileMenu({
    super.key,
    this.onTicketsTap,
    this.onPaymentTap,
    this.onNotificationsTap,
    this.onPrivacyTap,
    this.onSupportTap,
    this.onAboutTap,
    this.onTermsTap,
    this.onPrivacyPolicyTap,
    this.onDeleteAccountTap,
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
        
        // Divider for Legal & Info section
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'Legal & Information',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),
        ),

        _AttendeeProfileMenuItem(
          title: 'About Ethio Events',
          icon: Icons.info_outline,
          onTap: onAboutTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        SizedBox(height: 10.h),
        _AttendeeProfileMenuItem(
          title: 'Terms & Conditions',
          icon: Icons.description_outlined,
          onTap: onTermsTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        SizedBox(height: 10.h),
        _AttendeeProfileMenuItem(
          title: 'Privacy Policy',
          icon: Icons.privacy_tip_outlined,
          onTap: onPrivacyPolicyTap,
          theme: theme,
          colorScheme: colorScheme,
        ),
        
        // Divider for Danger Zone
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: colorScheme.error.withValues(alpha: 0.3),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'Danger Zone',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: colorScheme.error.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),
        ),

        _AttendeeProfileMenuItem(
          title: 'Delete Account',
          icon: Icons.delete_forever_outlined,
          onTap: onDeleteAccountTap,
          theme: theme,
          colorScheme: colorScheme,
          isDanger: true,
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
  final bool isDanger;

  const _AttendeeProfileMenuItem({
    required this.title,
    required this.icon,
    this.onTap,
    required this.theme,
    required this.colorScheme,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isDanger
              ? colorScheme.errorContainer.withValues(alpha: 0.3)
              : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isDanger
                ? colorScheme.error.withValues(alpha: 0.5)
                : colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: isDanger
                    ? colorScheme.errorContainer
                    : colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: isDanger ? colorScheme.error : colorScheme.primary,
                size: 18.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDanger ? colorScheme.error : null,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color:
                  isDanger ? colorScheme.error : colorScheme.onSurfaceVariant,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
