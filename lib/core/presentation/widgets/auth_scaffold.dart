import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';

/// Teal hero header with a sheet sliding up over it. Shared by the sign-in and
/// sign-up screens.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.leading,
    this.headerHeight,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? leading;
  final double? headerHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = headerHeight ?? 210.h;
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Column(
        children: [
          SizedBox(
            height: height + top,
            width: double.infinity,
            child: Stack(
              children: [
                const Positioned.fill(child: _HeaderArt()),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, top + 12.h, 24.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (leading != null) leading!,
                      const Spacer(),
                      Text(
                        title,
                        style: theme.textTheme.headlineLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.white.withValues(alpha: 0.75),
                        ),
                      ),
                      SizedBox(height: 44.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(32.r)),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(32.r)),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderArt extends StatelessWidget {
  const _HeaderArt();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            right: -50.w,
            top: -30.h,
            child: _Dot(size: 190.w, color: AppColors.white, alpha: 0.06),
          ),
          Positioned(
            right: 40.w,
            top: 60.h,
            child: _Dot(size: 70.w, color: AppColors.accent, alpha: 0.9),
          ),
          Positioned(
            left: -40.w,
            bottom: 10.h,
            child: _Dot(size: 120.w, color: AppColors.white, alpha: 0.05),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.color, required this.alpha});

  final double size;
  final Color color;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: alpha),
      ),
    );
  }
}
