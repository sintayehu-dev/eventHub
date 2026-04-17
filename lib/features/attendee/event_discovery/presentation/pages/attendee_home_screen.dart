import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';

import '../widgets/home/attendee_home_header.dart';
import '../widgets/home/attendee_categories_section.dart';
import '../widgets/home/upcoming_events_section.dart';

class AttendeeHomeScreen extends StatelessWidget {
  const AttendeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventDiscoveryBloc>()
        ..add(const EventDiscoveryEvent.loadUpcomingEvents(limit: 10)),
      child: const AttendeeHomeView(),
    );
  }
}

class AttendeeHomeView extends StatelessWidget {
  const AttendeeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<EventDiscoveryBloc>().add(
                const EventDiscoveryEvent.refreshEvents(),
              );
        },
        color: colorScheme.primary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20.w, MediaQuery.of(context).padding.top + 20.h, 20.w, 90.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AttendeeHomeHeader(),
                SizedBox(height: 24.h),
                AttendeeCategoriesSection(
                  onCategoryTap: (category) {
                    context.read<EventDiscoveryBloc>().add(
                          EventDiscoveryEvent.loadEventsByCategory(
                            category: category,
                          ),
                        );
                    context.pushNamed(RouteName.attendeeDiscover);
                  },
                ),
                SizedBox(height: 32.h),
                UpcomingEventsSection(
                  onEventTap: (eventId) {
                    context.pushNamed(
                      RouteName.eventDetail,
                      pathParameters: {'eventId': eventId},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}