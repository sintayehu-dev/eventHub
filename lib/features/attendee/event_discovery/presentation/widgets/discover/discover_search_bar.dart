import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

class DiscoverSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const DiscoverSearchBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: scheme.shadow.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search_rounded,
                color: scheme.onSurfaceVariant, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                controller: controller,
                style: theme.textTheme.bodyMedium,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search events, venues...',
                ),
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    context.read<EventDiscoveryBloc>().add(
                          EventDiscoveryEvent.searchEvents(
                            filters: EventSearchFilters(query: query),
                            limit: 20,
                          ),
                        );
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clear();
                context.read<EventDiscoveryBloc>().add(
                      const EventDiscoveryEvent.loadUpcomingEvents(limit: 20),
                    );
              },
              behavior: HitTestBehavior.opaque,
              child: Icon(
                Icons.close_rounded,
                color: scheme.onSurfaceVariant,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
