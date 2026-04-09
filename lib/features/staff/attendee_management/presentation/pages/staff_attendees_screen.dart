import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';
import 'package:eventhub/features/staff/attendee_management/application/attendee_management/bloc/attendee_management_bloc.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_view.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';

class StaffAttendeesScreen extends StatelessWidget {
  const StaffAttendeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser()!;

    return BlocProvider(
      create: (context) => getIt<AttendeeManagementBloc>(),
      child: StaffAttendeesView(staffId: currentUser.uid),
    );
  }
}

class StaffAttendeesView extends StatefulWidget {
  final String staffId;

  const StaffAttendeesView({super.key, required this.staffId});

  @override
  State<StaffAttendeesView> createState() => _StaffAttendeesViewState();
}

class _StaffAttendeesViewState extends State<StaffAttendeesView> {
  String? currentEventId;
  bool hasLoadedAttendees = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaffEventAssignmentBloc, StaffEventAssignmentState>(
      listener: (context, state) {
        // Handle any state changes if needed
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          eventsLoaded: (events, selectedEvent) => _buildAttendeesContent(
            context,
            events.isNotEmpty ? events.first : null,
          ),
          eventSelected: (events, selectedEvent) => _buildAttendeesContent(
            context,
            selectedEvent,
          ),
          accessGranted: (events, selectedEvent, permissions) =>
              _buildAttendeesContent(
            context,
            selectedEvent,
          ),
          accessDenied: (message) => Scaffold(
            body: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.w + MediaQuery.of(context).padding.top, 20.w, 0),
              child: AppErrorRetryWidget(
                errorMessage: message,
                onRetry: () {
                  context.read<StaffEventAssignmentBloc>().add(
                        StaffEventAssignmentEvent.loadStaffEvents(
                            staffId: widget.staffId),
                      );
                },
              ),
            ),
          ),
          assignmentsRefreshed: (events, selectedEvent) =>
              _buildAttendeesContent(
            context,
            selectedEvent ?? (events.isNotEmpty ? events.first : null),
          ),
          error: (message) => Scaffold(
            body: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.w + MediaQuery.of(context).padding.top, 20.w, 0),
              child: AppErrorRetryWidget(
                errorMessage: message,
                onRetry: () {
                  context.read<StaffEventAssignmentBloc>().add(
                        StaffEventAssignmentEvent.loadStaffEvents(
                            staffId: widget.staffId),
                      );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAttendeesContent(BuildContext context, selectedEvent) {
    if (selectedEvent == null) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.w + MediaQuery.of(context).padding.top, 20.w, 0),
          child: const Center(
            child: Text(
              'No event assigned.\nPlease contact your organizer.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }

    // Load attendees only if we haven't loaded for this event yet
    if (currentEventId != selectedEvent.eventId || !hasLoadedAttendees) {
      currentEventId = selectedEvent.eventId;
      hasLoadedAttendees = true;
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<AttendeeManagementBloc>().add(
              AttendeeManagementEvent.loadEventAttendees(
                eventId: selectedEvent.eventId,
                staffId: widget.staffId,
              ),
            );
        context.read<AttendeeManagementBloc>().add(
              AttendeeManagementEvent.loadAttendeeStats(
                eventId: selectedEvent.eventId,
                staffId: widget.staffId,
              ),
            );
      });
    }

    return AttendeesView(
      eventId: selectedEvent.eventId,
      staffId: widget.staffId,
    );
  }
}