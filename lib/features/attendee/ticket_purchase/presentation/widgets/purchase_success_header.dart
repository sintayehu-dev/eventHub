import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseSuccessHeader extends StatelessWidget {
  const PurchaseSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      children: [
        Container(
          width: 132.w,
          height: 132.w,
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Container(
            width: 88.w,
            height: 88.w,
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.secondary.withValues(alpha: 0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              Icons.check_rounded,
              color: colorScheme.onSecondary,
              size: 50.sp,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Purchase successful!',
          style: theme.textTheme.headlineMedium,
        ),
        SizedBox(height: 12.h),
        Text(
          'Your tickets have been purchased successfully and are now available in your wallet.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
