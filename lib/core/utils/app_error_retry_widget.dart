import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorRetryWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final String? buttonText;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;

  const AppErrorRetryWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.buttonText,
    this.icon,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200.h,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon ?? Icons.error_outline,
                  color: iconColor ?? colorScheme.error,
                  size: 32.sp,
                ),
                SizedBox(height: 12.h),
                Flexible(
                  child: Text(
                    errorMessage,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: textColor ?? colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: Icon(
                    Icons.refresh_rounded,
                    size: 18.sp,
                  ),
                  label: Text(buttonText ?? 'Try Again'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
