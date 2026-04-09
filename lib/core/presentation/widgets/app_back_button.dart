import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? size;

  const AppBackButton({
    super.key,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return IconButton(
      onPressed: onPressed ??
          () {
            if (context.canPop()) {
              context.pop();
            } else {
              // Fallback navigation - go to staff scanner
              context.go('/staff/scanner');
            }
          },
      icon: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colorScheme.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.chevron_left,
          color: iconColor ?? theme.colorScheme.onSurface,
          size: size ?? 24.sp,
        ),
      ),
    );
  }
}