import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class EventDetailShimmer extends StatelessWidget {
  const EventDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 280.h,
          pinned: true,
          backgroundColor: colorScheme.surface,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          ),
          title: Text(
            'Event Details',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            ShimmerBox(
              width: 40.w,
              height: 40.h,
              borderRadius: BorderRadius.circular(20.r),
            ),
            SizedBox(width: 8.w),
            ShimmerBox(
              width: 40.w,
              height: 40.h,
              borderRadius: BorderRadius.circular(20.r),
            ),
            SizedBox(width: 16.w),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                ShimmerWidget(
                  child: Container(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        colorScheme.shadow.withValues(alpha: 0.3),
                        colorScheme.shadow.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80.h,
                  left: 20.w,
                  right: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: 80.w,
                        height: 20.h,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      SizedBox(height: 12.h),
                      ShimmerText(
                        width: double.infinity,
                        height: 28.h,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          ShimmerBox(
                            width: 16.w,
                            height: 16.h,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          SizedBox(width: 4.w),
                          ShimmerText(
                            width: 200.w,
                            height: 14.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerText(
                      width: 180.w,
                      height: 18.h,
                    ),
                    ShimmerText(
                      width: 60.w,
                      height: 12.h,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: _buildShimmerMetricCard(context),
                        )),
                SizedBox(height: 32.h),
                ShimmerBox(
                  width: double.infinity,
                  height: 50.h,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: ShimmerBox(
                        width: double.infinity,
                        height: 42.h,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ShimmerBox(
                        width: double.infinity,
                        height: 42.h,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                ShimmerText(
                  width: 150.w,
                  height: 18.h,
                ),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerText(
                        width: 80.w,
                        height: 14.h,
                      ),
                      SizedBox(height: 8.h),
                      ShimmerText(
                        width: double.infinity,
                        height: 14.h,
                      ),
                      SizedBox(height: 4.h),
                      ShimmerText(
                        width: double.infinity,
                        height: 14.h,
                      ),
                      SizedBox(height: 4.h),
                      ShimmerText(
                        width: 200.w,
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: List.generate(
                        4,
                        (index) => Padding(
                              padding:
                                  EdgeInsets.only(bottom: index < 3 ? 12.h : 0),
                              child: Row(
                                children: [
                                  ShimmerBox(
                                    width: 16.w,
                                    height: 16.h,
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ShimmerText(
                                          width: 80.w,
                                          height: 12.h,
                                        ),
                                        SizedBox(height: 2.h),
                                        ShimmerText(
                                          width: 150.w,
                                          height: 14.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerMetricCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerText(
                width: 100.w,
                height: 14.h,
              ),
              ShimmerBox(
                width: 28.w,
                height: 28.h,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShimmerText(
                width: 80.w,
                height: 28.h,
              ),
              SizedBox(width: 8.w),
              ShimmerBox(
                width: 40.w,
                height: 16.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ShimmerBox(
            width: double.infinity,
            height: 4.h,
            borderRadius: BorderRadius.circular(2.r),
          ),
          SizedBox(height: 6.h),
          ShimmerText(
            width: 120.w,
            height: 11.h,
          ),
        ],
      ),
    );
  }
}
