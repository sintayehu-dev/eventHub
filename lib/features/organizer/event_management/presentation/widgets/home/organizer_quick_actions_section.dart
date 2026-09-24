import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class OrganizerQuickActionsSection extends StatelessWidget {
  const OrganizerQuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick actions', style: theme.textTheme.titleLarge),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: _QuickActionCard(
                title: 'New event',
                icon: Icons.add_rounded,
                tint: AppColors.accent,
                onTap: () => context.pushNamed(RouteName.createEventScreen),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _QuickActionCard(
                title: 'My events',
                icon: Icons.event_note_rounded,
                tint: AppColors.sky,
                onTap: () => context.goNamed(RouteName.organizerEvents),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _QuickActionCard(
                title: 'Analytics',
                icon: Icons.insights_rounded,
                tint: AppColors.mint,
                onTap: () => context.goNamed(RouteName.organizerAnalytics),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color tint;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.tint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: tint,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Icon(icon, color: AppColors.primaryDark, size: 24.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: theme.textTheme.labelLarge,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
