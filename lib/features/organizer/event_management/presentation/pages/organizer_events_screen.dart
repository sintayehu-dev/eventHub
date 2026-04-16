import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import '../widgets/events/organizer_events_header.dart';
import '../widgets/events/organizer_events_filter_section.dart';
import '../widgets/events/organizer_events_list_section.dart';

class OrganizerEventsScreen extends StatelessWidget {
  const OrganizerEventsScreen({super.key});

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
      child: OrganizerEventsView(organizerId: currentUser.uid),
    );
  }
}

class OrganizerEventsView extends StatefulWidget {
  final String organizerId;

  const OrganizerEventsView({
    super.key,
    required this.organizerId,
  });

  @override
  State<OrganizerEventsView> createState() => _OrganizerEventsViewState();
}

class _OrganizerEventsViewState extends State<OrganizerEventsView> {
  EventStatus _selectedStatus = EventStatus.active;

  @override
  void initState() {
    super.initState();
    // Reload events when returning to this screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEvents(context);
    });
  }

  void _loadEvents(BuildContext context) {
    context.read<EventManagementBloc>().add(
          EventManagementEvent.loadOrganizerEvents(
            organizerId: widget.organizerId,
            status: _selectedStatus,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<EventManagementBloc, EventManagementState>(
      listener: (context, state) {
        if (state.hasError && state.errorMessage.isNotEmpty) {
          AppHelpers.showErrorSnackBar(context, state.errorMessage);
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          _loadEvents(context);
          // Wait a bit for the events to load
          await Future.delayed(const Duration(milliseconds: 500));
        },
        child: Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OrganizerEventsHeader(),
                        SizedBox(height: 24.h),
                        OrganizerEventsFilterSection(
                          selectedStatus: _selectedStatus,
                          onStatusChanged: (status) {
                            setState(() {
                              _selectedStatus = status;
                            });
                            _loadEvents(context);
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
                const OrganizerEventsListSection(),
                SliverPadding(padding: EdgeInsets.only(bottom: 90.h)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}