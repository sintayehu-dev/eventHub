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
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: colorScheme.primary,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                controller: controller,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search events...',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
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
              child: Icon(
                Icons.close,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
