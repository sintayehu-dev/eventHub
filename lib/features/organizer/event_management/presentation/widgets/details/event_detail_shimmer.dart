import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'event_detail_header.dart';

/// Loading skeleton that mirrors the loaded organizer event detail: hero
/// image, the overlapping sheet with performance, actions and information.
class EventDetailShimmer extends StatelessWidget {
  const EventDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    Widget card({required Widget child}) => Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: child,
        );

    Widget infoRow() => Row(
          children: [
            ShimmerCircle(size: 40.w),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText(width: 70.w, height: 12.h),
                  SizedBox(height: 6.h),
                  ShimmerText(width: 180.w, height: 14.h),
                ],
              ),
            ),
          ],
        );

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // Hero, same height as the loaded header
              Stack(
                children: [
                  ShimmerBox(
                    width: double.infinity,
                    height: EventDetailHeader.expandedHeight,
                    borderRadius: BorderRadius.zero,
                  ),
                  Positioned(
                    left: 20.w,
                    right: 20.w,
                    bottom: 44.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(
                          width: 72.w,
                          height: 22.h,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        SizedBox(height: 10.h),
                        ShimmerText(width: 240.w, height: 24.h),
                      ],
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(0, -28.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.r)),
                  ),
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Performance
                      ShimmerText(width: 120.w, height: 20.h),
                      SizedBox(height: 14.h),
                      card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerText(width: 90.w, height: 12.h),
                            SizedBox(height: 10.h),
                            ShimmerText(width: 70.w, height: 32.h),
                            SizedBox(height: 14.h),
                            ShimmerBox(
                              width: double.infinity,
                              height: 8.h,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          for (var i = 0; i < 2; i++) ...[
                            if (i > 0) SizedBox(width: 12.w),
                            Expanded(
                              child: ShimmerBox(
                                width: double.infinity,
                                height: 116.h,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 32.h),

                      // Actions
                      ShimmerBox(
                        width: double.infinity,
                        height: 56.h,
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          for (var i = 0; i < 2; i++) ...[
                            if (i > 0) SizedBox(width: 12.w),
                            Expanded(
                              child: ShimmerBox(
                                width: double.infinity,
                                height: 52.h,
                                borderRadius: BorderRadius.circular(26.r),
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Information
                      ShimmerText(width: 160.w, height: 20.h),
                      SizedBox(height: 14.h),
                      card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerText(width: 70.w, height: 12.h),
                            SizedBox(height: 10.h),
                            ShimmerText(width: double.infinity, height: 14.h),
                            SizedBox(height: 6.h),
                            ShimmerText(width: 220.w, height: 14.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      card(
                        child: Column(
                          children: [
                            infoRow(),
                            SizedBox(height: 16.h),
                            infoRow(),
                            SizedBox(height: 16.h),
                            infoRow(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Back stays reachable while loading.
        Positioned(
          top: MediaQuery.of(context).padding.top + 8.h,
          left: 20.w,
          child: AppBackButton(onPressed: () => context.pop()),
        ),
      ],
    );
  }
}
