import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

/// Loading skeleton for the wallet body. Mirrors the loaded layout: the three
/// summary tiles, then ticket-stub cards, with the same paddings.
class AttendeeTicketsLoading extends StatelessWidget {
  const AttendeeTicketsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20.w,
        8.h,
        20.w,
        FloatingPillNavigationBar.clearance(context),
      ),
      children: [
        Row(
          children: [
            for (var i = 0; i < 3; i++) ...[
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
        SizedBox(height: 20.h),
        for (var i = 0; i < 3; i++) ...[
          if (i > 0) SizedBox(height: 16.h),
          const _TicketStubShimmer(),
        ],
      ],
    );
  }
}

class _TicketStubShimmer extends StatelessWidget {
  const _TicketStubShimmer();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(
                  width: 84.w,
                  height: 84.w,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: 64.w,
                        height: 18.h,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      SizedBox(height: 8.h),
                      ShimmerText(width: double.infinity, height: 16.h),
                      SizedBox(height: 6.h),
                      ShimmerText(width: 110.w, height: 12.h),
                      SizedBox(height: 4.h),
                      ShimmerText(width: 140.w, height: 12.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(color: scheme.outlineVariant),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 18.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerText(width: 60.w, height: 14.h),
                      SizedBox(height: 6.h),
                      ShimmerText(width: 90.w, height: 12.h),
                    ],
                  ),
                ),
                ShimmerBox(
                  width: 112.w,
                  height: 42.h,
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
