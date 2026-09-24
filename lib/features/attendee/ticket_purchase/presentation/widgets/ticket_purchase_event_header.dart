import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

class TicketPurchaseEventHeader extends StatelessWidget {
  final EventDiscoveryEntity event;

  const TicketPurchaseEventHeader({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: event.bannerUrl != null
                ? Image.network(
                    event.bannerUrl!,
                    width: 76.w,
                    height: 76.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholder(scheme),
                  )
                : _buildPlaceholder(scheme),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: theme.textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,
                        size: 13.sp, color: scheme.secondary),
                    SizedBox(width: 6.w),
                    Text(
                      '${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded,
                        size: 14.sp, color: scheme.secondary),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        event.location,
                        style: theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(ColorScheme scheme) {
    return Container(
      width: 76.w,
      height: 76.w,
      color: scheme.primaryContainer,
      child: Icon(
        Icons.celebration_rounded,
        color: scheme.primary.withValues(alpha: 0.5),
        size: 28.sp,
      ),
    );
  }
}
