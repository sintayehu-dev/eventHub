import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

/// Big teal hero card that spotlights the next upcoming event.
class FeaturedEventCard extends StatelessWidget {
  final EventDiscoveryEntity event;
  final VoidCallback onTap;

  const FeaturedEventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Pressable(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(22.w),
        decoration: BoxDecoration(
          gradient: AppColors.heroGradient,
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withValues(alpha: 0.25),
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -40.w,
              bottom: -60.h,
              child: Container(
                width: 150.w,
                height: 150.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Happening next',
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,
                        size: 14.sp,
                        color: AppColors.white.withValues(alpha: 0.75)),
                    SizedBox(width: 6.w),
                    Text(
                      '${_months[event.dateTime.month - 1]} ${event.dateTime.day}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.white.withValues(alpha: 0.85),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Icon(Icons.location_on_rounded,
                        size: 14.sp,
                        color: AppColors.white.withValues(alpha: 0.75)),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        event.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Text(
                        'Get tickets',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: AppColors.ink,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      event.priceRange,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
