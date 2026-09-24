import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';

/// Dark hero header with a curved bottom edge, a small eyebrow line and a big
/// title, above a plain form area. Shared by the sign-in and sign-up screens.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.child,
    this.leading,
    this.headerHeight,
  });

  final String eyebrow;
  final String title;
  final Widget child;
  final Widget? leading;
  final double? headerHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = headerHeight ?? 210.h;
    final top = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            ClipPath(
              clipper: _CurvedBottomClipper(),
              child: Container(
                height: height + top,
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: AppColors.heroGradient),
                child: Stack(
                  children: [
                    // Concentric rings, fading outward
                    Positioned(
                      right: -70.w,
                      top: -70.h,
                      child: const _Ring(size: 260, alpha: 0.07),
                    ),
                    Positioned(
                      right: -30.w,
                      top: -30.h,
                      child: const _Ring(size: 180, alpha: 0.10),
                    ),
                    // Glowing orange orb
                    Positioned(
                      right: 46.w,
                      top: 50.h,
                      child: Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFFC069), AppColors.accentDark],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withValues(alpha: 0.45),
                              blurRadius: 28,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Small peach satellite
                    Positioned(
                      right: 120.w,
                      top: 34.h,
                      child: Container(
                        width: 14.w,
                        height: 14.w,
                        decoration: const BoxDecoration(
                          color: AppColors.peach,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -40.w,
                      bottom: -10.h,
                      child: const _Dot(size: 130, alpha: 0.06),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, top + 12.h, 24.w, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (leading != null) leading!,
                          const Spacer(),
                          Text(
                            eyebrow,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            title,
                            style: theme.textTheme.displaySmall
                                ?.copyWith(color: AppColors.white),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

/// Flat top, bottom edge sweeping from low on the left to higher on the right.
class _CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height * 1.0,
        size.width,
        size.height * 0.72,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// Thin outlined circle used for the header's concentric rings.
class _Ring extends StatelessWidget {
  const _Ring({required this.size, required this.alpha});

  final double size;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white.withValues(alpha: alpha),
          width: 1.5,
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.alpha});

  final double size;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withValues(alpha: alpha),
      ),
    );
  }
}
