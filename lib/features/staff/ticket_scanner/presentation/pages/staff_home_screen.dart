import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/staff_home_header.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/scanner_frame_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/scanner_instructions_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/start_scanning_button.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/quick_actions_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/no_events_state_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/staff_home_shimmer.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    return StaffHomeView(staffId: currentUser.uid);
  }
}

class StaffHomeView extends StatelessWidget {
  final String staffId;

  const StaffHomeView({super.key, required this.staffId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child:
            BlocConsumer<StaffEventAssignmentBloc, StaffEventAssignmentState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                AppHelpers.showErrorSnackBar(context, message);
              },
              accessDenied: (message) {
                AppHelpers.showErrorSnackBar(context, message);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const StaffHomeShimmer(),
              loading: () => const StaffHomeShimmer(),
              eventsLoaded: (events, selectedEvent) => _buildContent(
                context,
                theme,
                events,
                selectedEvent ?? (events.isNotEmpty ? events.first : null),
              ),
              eventSelected: (events, selectedEvent) => _buildContent(
                context,
                theme,
                events,
                selectedEvent,
              ),
              accessGranted: (events, selectedEvent, permissions) =>
                  _buildContent(
                context,
                theme,
                events,
                selectedEvent,
              ),
              accessDenied: (message) =>
                  _buildErrorState(context, theme, message),
              assignmentsRefreshed: (events, selectedEvent) => _buildContent(
                context,
                theme,
                events,
                selectedEvent ?? (events.isNotEmpty ? events.first : null),
              ),
              error: (message) => _buildErrorState(context, theme, message),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    List<StaffEventAssignmentEntity> events,
    StaffEventAssignmentEntity? selectedEvent,
  ) {
    if (events.isEmpty) {
      return NoEventsStateWidget(staffId: staffId);
    }

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Header with event selector
          StaffHomeHeader(
            events: events,
            selectedEvent: selectedEvent,
          ),
          SizedBox(height: 40.h),

          // Scanner Frame
          const Expanded(
            child: ScannerFrameWidget(),
          ),

          // Instructions
          const ScannerInstructionsWidget(),
          SizedBox(height: 24.h),

          // Start Scanning Button
          StartScanningButton(selectedEvent: selectedEvent),
          SizedBox(height: 32.h),

          // Quick Actions
          QuickActionsWidget(
            staffId: staffId,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
      BuildContext context, ThemeData theme, String message) {
    return AppErrorRetryWidget(
      errorMessage: message,
      onRetry: () {
        context.read<StaffEventAssignmentBloc>().add(
              StaffEventAssignmentEvent.loadStaffEvents(staffId: staffId),
            );
      },
    );
  }
}