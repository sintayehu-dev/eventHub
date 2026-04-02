import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import '../widgets/home/organizer_header.dart';
import '../widgets/home/organizer_welcome_section.dart';
import '../widgets/home/organizer_stats_section.dart';
import '../widgets/home/organizer_quick_actions_section.dart';
import '../widgets/home/organizer_active_events_section.dart';

class OrganizerHomeScreen extends StatelessWidget {
  const OrganizerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    return BlocProvider(
      create: (_) => getIt<EventManagementBloc>()
        ..add(EventManagementEvent.loadOrganizerEvents(
          organizerId: currentUser.uid,
          status: EventStatus.active,
        )),
      child: const OrganizerHomeView(
          organizerName: 'Alex'), // Hardcoded for now as per current UI
    );
  }
}

class OrganizerHomeView extends StatelessWidget {
  final String organizerName;

  const OrganizerHomeView({
    super.key,
    required this.organizerName,
  });

  Future<void> _onRefresh(BuildContext context) async {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser != null) {
      context.read<EventManagementBloc>().add(
            EventManagementEvent.loadOrganizerEvents(
              organizerId: currentUser.uid,
              status: EventStatus.active,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        color: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 100.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrganizerHeader(),
              SizedBox(height: 32.h),
              OrganizerWelcomeSection(organizerName: organizerName),
              SizedBox(height: 32.h),
              const OrganizerStatsSection(),
              SizedBox(height: 32.h),
              const OrganizerQuickActionsSection(),
              SizedBox(height: 32.h),
              const OrganizerActiveEventsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
