import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class StaffHomeShimmer extends StatelessWidget {
  const StaffHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              // Header shimmer
              _buildHeaderShimmer(),
              SizedBox(height: 40.h),

              // Scanner Frame shimmer
              Expanded(
                child: _buildScannerFrameShimmer(),
              ),

              // Instructions shimmer
              _buildInstructionsShimmer(),
              SizedBox(height: 24.h),

              // Start Scanning Button shimmer
              _buildStartScanningButtonShimmer(),
              SizedBox(height: 32.h),

              // Quick Actions shimmer
              _buildQuickActionsShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderShimmer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Empty space to balance the layout
            SizedBox(width: 24.sp),
            Column(
              children: [
                // Title shimmer
                ShimmerText(
                  width: 140.w,
                  height: 18.h,
                ),
                SizedBox(height: 4.h),
                
                // Subtitle shimmer
                ShimmerText(
                  width: 180.w,
                  height: 14.h,
                ),
              ],
            ),
            // Menu button shimmer
            ShimmerBox(
              width: 24.w,
              height: 24.h,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        
        // Event assignment badge shimmer
        ShimmerBox(
          width: 150.w,
          height: 32.h,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ],
    );
  }

  Widget _buildScannerFrameShimmer() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
              width: 2,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Scanner icon shimmer
                ShimmerBox(
                  width: 120.w,
                  height: 120.h,
                  borderRadius: BorderRadius.circular(60.r),
                ),
                SizedBox(height: 24.h),
                
                // Scanner text shimmer
                ShimmerText(
                  width: 180.w,
                  height: 18.h,
                ),
                SizedBox(height: 8.h),
                
                // Scanner subtitle shimmer
                ShimmerText(
                  width: 140.w,
                  height: 14.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInstructionsShimmer() {
    return Column(
      children: [
        // Instructions title shimmer
        ShimmerText(
          width: 160.w,
          height: 18.h,
        ),
        SizedBox(height: 12.h),
        
        // Instructions text shimmer
        ShimmerText(
          width: double.infinity,
          height: 14.h,
        ),
        SizedBox(height: 4.h),
        
        ShimmerText(
          width: 250.w,
          height: 14.h,
        ),
      ],
    );
  }

  Widget _buildStartScanningButtonShimmer() {
    return ShimmerBox(
      width: double.infinity,
      height: 56.h,
      borderRadius: BorderRadius.circular(16.r),
    );
  }

  Widget _buildQuickActionsShimmer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuickActionButtonShimmer(),
      ],
    );
  }

  Widget _buildQuickActionButtonShimmer() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        
        return Container(
          width: 80.w,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              // Icon shimmer
              ShimmerBox(
                width: 24.w,
                height: 24.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              SizedBox(height: 8.h),
              
              // Label shimmer
              ShimmerText(
                width: 40.w,
                height: 12.h,
              ),
            ],
          ),
        );
      },
    );
  }
}