import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/app_validation_error_widget.dart';

/// Soft, borderless field with a label above it. Colors and radius come from
/// the theme's [InputDecorationTheme].
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.errorText,
    this.trailingLabel,
  });

  final String label;
  final String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  /// Optional widget shown on the label row, e.g. "Forgot password?".
  final Widget? trailingLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: theme.textTheme.titleSmall),
            if (trailingLabel != null) trailingLabel!,
          ],
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon:
                prefixIcon == null ? null : Icon(prefixIcon, size: 20.sp),
            suffixIcon: suffixIcon,
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          AppValidationErrorWidget(errorMessage: errorText),
      ],
    );
  }
}
