import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendeeLogoutCard extends StatelessWidget {
  final VoidCallback onLogoutTap;

  const AttendeeLogoutCard({
    super.key,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton.icon(
        onPressed: onLogoutTap,
        icon: Icon(Icons.logout_rounded, size: 20.sp),
        label: const Text('Sign out'),
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.error,
          side: BorderSide(color: scheme.error.withValues(alpha: 0.4)),
        ),
      ),
    );
  }
}
