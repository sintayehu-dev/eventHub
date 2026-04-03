import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class StaffProfileShimmer extends StatelessWidget {
  const StaffProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 90.h),
      child: Column(
        children: [
          // Profile Header Shimmer
          _buildProfileHeaderShimmer(),
          SizedBox(height: 32.h),
          
          // Profile Menu Shimmer
          _buildProfileMenuShimmer(),
          SizedBox(height: 32.h),
          
          // Logout Card Shimmer
          _buildLogoutCardShimmer(),
        ],
      ),
    );
  }

  Widget _buildProfileHeaderShimmer() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          // Profile Image Shimmer
          ShimmerCircle(size: 100.w),
          SizedBox(height: 16.h),
          
          // Name Shimmer
          ShimmerText(
            width: 150.w,
            height: 20.h,
          ),
          SizedBox(height: 8.h),
          
          // Role Shimmer
          ShimmerText(
            width: 80.w,
            height: 16.h,
          ),
          SizedBox(height: 8.h),
          
          // Email Shimmer
          ShimmerText(
            width: 200.w,
            height: 16.h,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuShimmer() {
    return Column(
      children: [
        // Menu Items
        ...List.generate(4, (index) => _buildMenuItemShimmer()),
      ],
    );
  }

  Widget _buildMenuItemShimmer() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Icon Shimmer
          ShimmerBox(
            width: 24.w,
            height: 24.h,
            borderRadius: BorderRadius.circular(12.r),
          ),
          SizedBox(width: 16.w),
          
          // Title Shimmer
          Expanded(
            child: ShimmerText(
              width: double.infinity,
              height: 16.h,
            ),
          ),
          SizedBox(width: 16.w),
          
          // Arrow Shimmer
          ShimmerBox(
            width: 16.w,
            height: 16.h,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutCardShimmer() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Icon Shimmer
          ShimmerBox(
            width: 24.w,
            height: 24.h,
            borderRadius: BorderRadius.circular(12.r),
          ),
          SizedBox(width: 16.w),
          
          // Text Shimmer
          Expanded(
            child: ShimmerText(
              width: double.infinity,
              height: 16.h,
            ),
          ),
        ],
      ),
    );
  }
}