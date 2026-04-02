import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class AttendeesShimmer extends StatelessWidget {
  final bool isSearching;
  
  const AttendeesShimmer({
    super.key,
    this.isSearching = false,
  });

  @override
  Widget build(BuildContext context) {
    // Show fewer items when searching to indicate filtered results
    final itemCount = isSearching ? 3 : 8;
    
    return ListView.separated(
      itemCount: itemCount,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) => AttendeeCardShimmer(
        // Vary the shimmer content to make it look more realistic
        showButton: index % 3 != 0, // Show button for some items
        nameWidth: index % 2 == 0 ? 120.w : 140.w, // Vary name width
        emailWidth: index % 3 == 0 ? 160.w : 180.w, // Vary email width
      ),
    );
  }
}

class AttendeeCardShimmer extends StatelessWidget {
  final bool showButton;
  final double nameWidth;
  final double emailWidth;
  
  const AttendeeCardShimmer({
    super.key,
    this.showButton = true,
    this.nameWidth = 120,
    this.emailWidth = 180,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          // Avatar shimmer
          ShimmerCircle(size: 48.w),
          SizedBox(width: 16.w),
          
          // Content shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name shimmer
                ShimmerText(
                  width: nameWidth,
                  height: 18.h,
                ),
                SizedBox(height: 6.h),
                
                // Email shimmer
                ShimmerText(
                  width: emailWidth,
                  height: 14.h,
                ),
                SizedBox(height: 8.h),
                
                // Ticket type shimmer
                ShimmerBox(
                  width: 100.w,
                  height: 24.h,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ],
            ),
          ),
          
          // Status and action shimmer
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Status badge shimmer
              ShimmerBox(
                width: 80.w,
                height: 24.h,
                borderRadius: BorderRadius.circular(6.r),
              ),
              SizedBox(height: 8.h),
              
              // Action button shimmer (conditional)
              if (showButton)
                ShimmerBox(
                  width: 70.w,
                  height: 32.h,
                  borderRadius: BorderRadius.circular(8.r),
                )
              else
                // Time shimmer for checked-in attendees
                ShimmerText(
                  width: 50.w,
                  height: 12.h,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatsShimmer extends StatelessWidget {
  const StatsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildStatCardShimmer()),
        SizedBox(width: 16.w),
        Expanded(child: _buildStatCardShimmer()),
        SizedBox(width: 16.w),
        Expanded(child: _buildStatCardShimmer()),
      ],
    );
  }

  Widget _buildStatCardShimmer() {
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
            children: [
              // Icon shimmer
              ShimmerCircle(size: 24.w),
              SizedBox(height: 8.h),
              
              // Value shimmer
              ShimmerText(
                width: 40.w,
                height: 24.h,
              ),
              SizedBox(height: 4.h),
              
              // Title shimmer
              ShimmerText(
                width: 60.w,
                height: 14.h,
              ),
            ],
          ),
        );
      },
    );
  }
}