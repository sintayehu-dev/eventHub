import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class DiscoverShimmerCard extends StatelessWidget {
  const DiscoverShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Shimmer
          ShimmerBox(
            height: 180.h,
            width: double.infinity,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ShimmerBox(height: 20.h, width: 60.w, borderRadius: BorderRadius.circular(8.r)),
                    SizedBox(width: 12.w),
                    ShimmerBox(height: 16.h, width: 100.w, borderRadius: BorderRadius.circular(4.r)),
                    const Spacer(),
                    ShimmerBox(height: 24.h, width: 24.w, borderRadius: BorderRadius.circular(4.r)),
                  ],
                ),
                SizedBox(height: 16.h),
                ShimmerBox(height: 24.h, width: 200.w, borderRadius: BorderRadius.circular(4.r)),
                SizedBox(height: 12.h),
                ShimmerBox(height: 16.h, width: double.infinity, borderRadius: BorderRadius.circular(4.r)),
                SizedBox(height: 8.h),
                ShimmerBox(height: 16.h, width: 150.w, borderRadius: BorderRadius.circular(4.r)),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    ShimmerBox(height: 24.h, width: 60.w, borderRadius: BorderRadius.circular(12.r)),
                    SizedBox(width: 12.w),
                    ShimmerBox(height: 16.h, width: 120.w, borderRadius: BorderRadius.circular(4.r)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
