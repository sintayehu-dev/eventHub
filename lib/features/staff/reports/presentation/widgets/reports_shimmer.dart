import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class ReportsShimmer extends StatelessWidget {
  const ReportsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Key Metrics Shimmer
        const MetricsShimmer(),
        SizedBox(height: 32.h),
        
        // Staff Performance Shimmer
        const StaffPerformanceShimmer(),
        SizedBox(height: 32.h),
        
        // Event Summary Shimmer
        const EventSummaryShimmer(),
      ],
    );
  }
}

class MetricsShimmer extends StatelessWidget {
  const MetricsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildMetricCardShimmer()),
            SizedBox(width: 16.w),
            Expanded(child: _buildMetricCardShimmer()),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: _buildMetricCardShimmer()),
            SizedBox(width: 16.w),
            Expanded(child: _buildMetricCardShimmer()),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCardShimmer() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerText(
                    width: 80.w,
                    height: 14.h,
                  ),
                  ShimmerCircle(size: 16.w),
                ],
              ),
              SizedBox(height: 8.h),
              ShimmerText(
                width: 60.w,
                height: 24.h,
              ),
              SizedBox(height: 4.h),
              ShimmerText(
                width: 100.w,
                height: 12.h,
              ),
            ],
          ),
        );
      },
    );
  }
}

class StaffPerformanceShimmer extends StatelessWidget {
  const StaffPerformanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerText(
          width: 140.w,
          height: 20.h,
        ),
        SizedBox(height: 16.h),
        ...List.generate(4, (index) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _buildStaffItemShimmer(),
        )),
      ],
    );
  }

  Widget _buildStaffItemShimmer() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              ShimmerBox(
                width: 40.w,
                height: 40.h,
                borderRadius: BorderRadius.circular(10.r),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerText(
                      width: 100.w,
                      height: 16.h,
                    ),
                    SizedBox(height: 4.h),
                    ShimmerText(
                      width: 140.w,
                      height: 12.h,
                    ),
                  ],
                ),
              ),
              ShimmerBox(
                width: 60.w,
                height: 24.h,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EventSummaryShimmer extends StatelessWidget {
  const EventSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerText(
            width: 120.w,
            height: 18.h,
          ),
          SizedBox(height: 16.h),
          ...List.generate(4, (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerText(
                  width: 100.w,
                  height: 14.h,
                ),
                ShimmerText(
                  width: 40.w,
                  height: 14.h,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class TimePeriodSelectorShimmer extends StatelessWidget {
  const TimePeriodSelectorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: List.generate(3, (index) => Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ShimmerText(
              width: 60.w,
              height: 16.h,
            ),
          ),
        )),
      ),
    );
  }
}