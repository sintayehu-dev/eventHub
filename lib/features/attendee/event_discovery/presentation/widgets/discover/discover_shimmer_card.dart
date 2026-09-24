import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class DiscoverShimmerCard extends StatelessWidget {
  const DiscoverShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          ShimmerBox(
            height: 112.h,
            width: 104.w,
            borderRadius: BorderRadius.circular(20.r),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerText(width: 50.w, height: 12.h),
                SizedBox(height: 10.h),
                ShimmerText(width: double.infinity, height: 16.h),
                SizedBox(height: 8.h),
                ShimmerText(width: 110.w, height: 12.h),
                SizedBox(height: 12.h),
                ShimmerText(width: 70.w, height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
