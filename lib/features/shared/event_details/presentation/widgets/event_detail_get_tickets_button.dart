import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

/// Sticky bottom bar: the price on the left, the primary action on the right.
class EventDetailGetTicketsButton extends StatelessWidget {
  final EventDiscoveryEntity event;

  const EventDetailGetTicketsButton({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isAvailable =
        event.availableTickets > 0 && event.status == EventStatus.active;

    return Container(
      padding: EdgeInsets.fromLTRB(
        24.w,
        16.h,
        24.w,
        MediaQuery.of(context).padding.bottom + 16.h,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.12),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price', style: theme.textTheme.bodySmall),
              SizedBox(height: 2.h),
              Text(
                event.priceRange,
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: scheme.primary),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: AppButton(
              label: event.isSoldOut ? 'Sold out' : 'Get tickets',
              icon: event.isSoldOut ? null : Icons.arrow_forward_rounded,
              variant: AppButtonVariant.accent,
              onPressed: isAvailable
                  ? () => context.pushNamed(
                        RouteName.ticketSelection,
                        extra: event,
                      )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
