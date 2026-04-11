import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<EventManagementBloc>()
            ..add(EventManagementEvent.loadOrganizerEvents(
              organizerId: currentUser.uid,
              status: EventStatus.active,
            )),
        ),
        BlocProvider(
          create: (_) => getIt<UserProfileBloc>()
            ..add(UserProfileEvent.loadUserProfile(userId: currentUser.uid)),
        ),
      ],
      child: const OrganizerHomeView(),
    );
  }
}

class OrganizerHomeView extends StatelessWidget {
  const OrganizerHomeView({super.key});

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
      context.read<UserProfileBloc>().add(
            UserProfileEvent.refreshProfile(userId: currentUser.uid),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          color: colorScheme.primary,
          backgroundColor: colorScheme.surface,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 90.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrganizerHeader(),
                SizedBox(height: 32.h),
                BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, state) {
                    final organizerName = state.whenOrNull(
                          loaded: (profile) => profile.name,
                          profileUpdated: (profile) => profile.name,
                          profileRefreshed: (profile) => profile.name,
                        ) ??
                        getIt<UserService>().getCurrentUser()?.displayName ??
                        'Organizer';

                    return OrganizerWelcomeSection(
                        organizerName: organizerName);
                  },
                ),
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
      ),
    );
  }
}
