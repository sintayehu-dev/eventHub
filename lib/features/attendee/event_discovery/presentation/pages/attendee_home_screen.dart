import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';

import '../widgets/home/attendee_home_header.dart';
import '../widgets/home/attendee_search_bar.dart';
import '../widgets/home/attendee_categories_section.dart';
import '../widgets/home/featured_event_card.dart';
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

  void _openEvent(BuildContext context, String eventId) {
    context.pushNamed(
      RouteName.eventDetail,
      pathParameters: {'eventId': eventId},
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<EventDiscoveryBloc>().add(
                const EventDiscoveryEvent.refreshEvents(),
              );
        },
        color: scheme.primary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            20.w,
            MediaQuery.of(context).padding.top + 16.h,
            20.w,
            FloatingPillNavigationBar.clearance(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeSlideIn(child: AttendeeHomeHeader()),
              SizedBox(height: 20.h),
              FadeSlideIn(
                index: 1,
                child: AttendeeSearchBar(
                  onTap: () => context.goNamed(RouteName.attendeeDiscover),
                ),
              ),
              SizedBox(height: 20.h),
              BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
                builder: (context, state) {
                  if (state.isLoading || state.isLoadingDetails) {
                    return ShimmerBox(
                      width: double.infinity,
                      height: 232.h,
                      borderRadius: BorderRadius.circular(32.r),
                    );
                  }
                  if (state.hasError || state.events.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  final event = state.events.first;
                  return FadeSlideIn(
                    index: 2,
                    child: FeaturedEventCard(
                      event: event,
                      onTap: () => _openEvent(context, event.id),
                    ),
                  );
                },
              ),
              SizedBox(height: 28.h),
              FadeSlideIn(
                index: 3,
                child: AttendeeCategoriesSection(
                  onCategoryTap: (category) {
                    context.read<EventDiscoveryBloc>().add(
                          EventDiscoveryEvent.loadEventsByCategory(
                            category: category,
                          ),
                        );
                    context.pushNamed(RouteName.attendeeDiscover);
                  },
                ),
              ),
              SizedBox(height: 28.h),
              FadeSlideIn(
                index: 4,
                child: UpcomingEventsSection(
                  onEventTap: (eventId) => _openEvent(context, eventId),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
