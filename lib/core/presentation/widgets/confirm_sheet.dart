import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Slides a confirmation sheet up from the bottom.
///
/// Returns true when the user confirms, false otherwise (cancel, drag down or
/// tap outside).
Future<bool> showConfirmSheet(
  BuildContext context, {
  String? title,
  String? message,
  required String confirmLabel,
  String? cancelLabel,
  IconData icon = Icons.help_outline_rounded,
  bool destructive = false,
}) async {
  HapticFeedback.selectionClick();
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.35),
    // Longer, softer slide with a gentle deceleration; quicker on the way out.
    sheetAnimationStyle: AnimationStyle(
      duration: Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      reverseDuration: Duration(milliseconds: 260),
      reverseCurve: Curves.easeInCubic,
    ),
    builder: (sheetContext) => _ConfirmSheet(
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      icon: icon,
      destructive: destructive,
    ),
  );
  return result ?? false;
}

class _ConfirmSheet extends StatelessWidget {
  const _ConfirmSheet({
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.icon,
    required this.destructive,
  });

  final String? title;
  final String? message;
  final String confirmLabel;
  final String? cancelLabel;
  final IconData icon;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final accent = destructive ? scheme.error : scheme.primary;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h + bottom),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: scheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16.sp,
                      color: scheme.onSurface,
                    ),
                  ),
                ),
              ),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: scheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.6, end: 1),
            duration: const Duration(milliseconds: 520),
            curve: Curves.easeOutBack,
            builder: (context, value, child) => Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: Transform.scale(scale: value, child: child),
            ),
            child: Container(
              width: 68.w,
              height: 68.w,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: accent, size: 30.sp),
            ),
          ),
          if (title != null) ...[
            SizedBox(height: 18.h),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
          ],
          if (message != null) ...[
            SizedBox(height: 8.h),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
          SizedBox(height: 28.h),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            curve: const Interval(0.3, 1, curve: Curves.easeOutCubic),
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 14 * (1 - value)),
                child: child,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: destructive ? scheme.error : scheme.primary,
                  foregroundColor:
                      destructive ? scheme.onError : scheme.onPrimary,
                ),
                child: Text(confirmLabel),
              ),
            ),
          ),
          if (cancelLabel != null) ...[
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: TextButton.styleFrom(
                  foregroundColor: scheme.onSurfaceVariant,
                  shape: const StadiumBorder(),
                ),
                child: Text(cancelLabel!),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
