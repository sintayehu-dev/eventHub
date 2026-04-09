import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/dashboard/staff_dashboard_view.dart';

class StaffDashboardScreen extends StatelessWidget {
  final String eventId;
  final String eventTitle;

  const StaffDashboardScreen({
    super.key,
    required this.eventId,
    required this.eventTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TicketScannerBloc>()..add(const TicketScannerEvent.started()),
      child: StaffDashboardView(
        eventId: eventId,
        eventTitle: eventTitle,
      ),
    );
  }
}