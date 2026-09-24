import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/confirm_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_event.dart';

class OrganizerProfileLogoutCard extends StatelessWidget {
  const OrganizerProfileLogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton.icon(
        onPressed: () => _showLogoutDialog(context),
        icon: Icon(Icons.logout_rounded, size: 20.sp),
        label: const Text('Sign out'),
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.error,
          side: BorderSide(color: colorScheme.error.withValues(alpha: 0.4)),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final confirmed = await showConfirmSheet(
      context,
      title: 'Sign out?',
      message: 'You will need to sign in again to see your account.',
      confirmLabel: 'Sign out',
      icon: Icons.logout_rounded,
      destructive: true,
    );
    if (confirmed && context.mounted) {
      context.read<AuthStatusBloc>().add(const AuthStatusEvent.signOut());
    }
  }
}
