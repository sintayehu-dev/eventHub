import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class TicketWalletSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  /// Soft background of the card.
  final Color tint;

  const TicketWalletSummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 18.sp),
          ),
          SizedBox(height: 14.h),
          Text(
            value,
            style: theme.textTheme.headlineSmall
                ?.copyWith(color: AppColors.ink, height: 1.1),
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: theme.textTheme.labelMedium
                ?.copyWith(color: AppColors.ink.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}
