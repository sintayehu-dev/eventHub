import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class OrganizerHeader extends StatelessWidget {
  const OrganizerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                Icons.confirmation_number_rounded,
                color: AppColors.white,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Text('Ethio Events', style: theme.textTheme.titleLarge),
          ],
        ),
        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: scheme.surface,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_none_rounded,
            color: scheme.primary,
            size: 22.sp,
          ),
        ),
      ],
    );
  }
}
