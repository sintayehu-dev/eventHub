import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/staff/attendee_management/application/attendee_management/bloc/attendee_management_bloc.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_view.dart';

class AttendeesScreen extends StatelessWidget {
  final String eventId;
  final String staffId;

  const AttendeesScreen({
    super.key,
    required this.eventId,
    required this.staffId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AttendeeManagementBloc>()
        ..add(AttendeeManagementEvent.loadEventAttendees(
          eventId: eventId,
          staffId: staffId,
        ))
        ..add(AttendeeManagementEvent.loadAttendeeStats(
          eventId: eventId,
          staffId: staffId,
        )),
      child: AttendeesView(eventId: eventId, staffId: staffId),
    );
  }
}

