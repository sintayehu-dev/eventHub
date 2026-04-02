import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable widget for displaying validation error messages with different types.
/// 
/// Usage examples:
/// ```dart
/// // Error message (default)
/// AppValidationErrorWidget(errorMessage: 'Email is required')
/// 
/// // Warning message
/// AppValidationErrorWidget(
///   errorMessage: 'Password should be stronger',
///   type: ValidationErrorType.warning,
/// )
/// 
/// // Info message
/// AppValidationErrorWidget(
///   errorMessage: 'Password must be at least 8 characters',
///   type: ValidationErrorType.info,
/// )
/// ```
class AppValidationErrorWidget extends StatelessWidget {
  final String? errorMessage;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final ValidationErrorType type;

  const AppValidationErrorWidget({
    super.key,
    this.errorMessage,
    this.margin,
    this.padding,
    this.type = ValidationErrorType.error,
  });

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null || errorMessage!.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color backgroundColor;
    Color borderColor;
    Color iconColor;
    Color textColor;
    IconData icon;

    switch (type) {
      case ValidationErrorType.error:
        backgroundColor = colorScheme.error.withValues(alpha: 0.1);
        borderColor = colorScheme.error.withValues(alpha: 0.3);
        iconColor = colorScheme.error;
        textColor = colorScheme.error;
        icon = Icons.error_outline;
        break;
      case ValidationErrorType.warning:
        backgroundColor = colorScheme.tertiary.withValues(alpha: 0.1);
        borderColor = colorScheme.tertiary.withValues(alpha: 0.3);
        iconColor = colorScheme.tertiary;
        textColor = colorScheme.tertiary;
        icon = Icons.warning_outlined;
        break;
      case ValidationErrorType.info:
        backgroundColor = colorScheme.secondary.withValues(alpha: 0.1);
        borderColor = colorScheme.secondary.withValues(alpha: 0.3);
        iconColor = colorScheme.secondary;
        textColor = colorScheme.secondary;
        icon = Icons.info_outline;
        break;
    }

    return Container(
      margin: margin ?? EdgeInsets.only(top: 8.h),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 16.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              errorMessage!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ValidationErrorType {
  error,
  warning,
  info,
}