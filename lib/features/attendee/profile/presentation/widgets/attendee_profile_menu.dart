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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MenuGroup(
          title: 'Account',
          items: [
            _MenuEntry('My tickets', Icons.confirmation_number_outlined,
                onTicketsTap),
            _MenuEntry(
                'Payment methods', Icons.payment_outlined, onPaymentTap),
            _MenuEntry('Notifications', Icons.notifications_none_outlined,
                onNotificationsTap),
            _MenuEntry(
                'Privacy & security', Icons.security_outlined, onPrivacyTap),
            _MenuEntry('Help & support', Icons.help_outline, onSupportTap),
          ],
        ),
        SizedBox(height: 20.h),
        _MenuGroup(
          title: 'Legal & information',
          items: [
            _MenuEntry('About Ethio Events', Icons.info_outline, onAboutTap),
            _MenuEntry(
                'Terms & conditions', Icons.description_outlined, onTermsTap),
            _MenuEntry('Privacy policy', Icons.privacy_tip_outlined,
                onPrivacyPolicyTap),
          ],
        ),
      ],
    );
  }
}

class _MenuEntry {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const _MenuEntry(this.title, this.icon, this.onTap);
}

class _MenuGroup extends StatelessWidget {
  final String title;
  final List<_MenuEntry> items;

  const _MenuGroup({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, bottom: 10.h),
          child: Text(title, style: theme.textTheme.titleSmall),
        ),
        Container(
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: Column(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  _MenuRow(entry: items[i]),
                  if (i != items.length - 1)
                    Divider(indent: 68.w, endIndent: 20.w),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuRow extends StatelessWidget {
  final _MenuEntry entry;

  const _MenuRow({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return InkWell(
      onTap: entry.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: scheme.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(entry.icon, color: scheme.primary, size: 19.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(entry.title, style: theme.textTheme.titleSmall),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: scheme.onSurfaceVariant,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
