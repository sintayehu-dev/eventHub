import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: Text(
            'Please log in to view your events',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
      );
    }

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
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          eventDeleted: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Event deleted successfully')),
            );
            _loadEvents(context);
          },
          eventCancelled: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Event cancelled successfully')),
            );
            _loadEvents(context);
          },
          eventDuplicated: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Event duplicated successfully')),
            );
            _loadEvents(context);
          },
        );
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: CustomScrollView(
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
            SliverPadding(padding: EdgeInsets.only(bottom: 100.h)),
          ],
        ),
      ),
    );
  }
}