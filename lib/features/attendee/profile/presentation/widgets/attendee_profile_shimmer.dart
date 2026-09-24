import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

/// Skeleton that mirrors the loaded profile: hero header card, two grouped
/// menu cards and the sign-out button, with the same paddings.
class AttendeeProfileShimmer extends StatelessWidget {
  const AttendeeProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        FloatingPillNavigationBar.clearance(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerShimmer(),
          SizedBox(height: 24.h),
          _groupShimmer(context, titleWidth: 70.w, rows: 5),
          SizedBox(height: 20.h),
          _groupShimmer(context, titleWidth: 130.w, rows: 3),
          SizedBox(height: 24.h),
          ShimmerBox(
            width: double.infinity,
            height: 56.h,
            borderRadius: BorderRadius.circular(28.r),
          ),
        ],
      ),
    );
  }

  Widget _headerShimmer() {
    return ShimmerBox(
      width: double.infinity,
      height: 108.h,
      borderRadius: BorderRadius.circular(32.r),
    );
  }

  Widget _groupShimmer(BuildContext context,
      {required double titleWidth, required int rows}) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, bottom: 10.h),
          child: ShimmerText(width: titleWidth, height: 14.h),
        ),
        Container(
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Column(
            children: [
              for (var i = 0; i < rows; i++) ...[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  child: Row(
                    children: [
                      ShimmerCircle(size: 38.w),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: ShimmerText(width: double.infinity, height: 14.h),
                      ),
                      SizedBox(width: 14.w),
                      ShimmerCircle(size: 16.w),
                    ],
                  ),
                ),
                if (i != rows - 1) Divider(indent: 68.w, endIndent: 20.w),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
