import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/debug_ticket_helper.dart';
import 'package:eventhub/debug_organizer_helper.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

class QuickActionsWidget extends StatelessWidget {
  final StaffEventAssignmentEntity? selectedEvent;
  final String staffId;

  const QuickActionsWidget({
    super.key,
    this.selectedEvent,
    required this.staffId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickActionButton(
          icon: Icons.refresh,
          label: 'Reset',
          onTap: () {
            context.read<StaffEventAssignmentBloc>().add(
                  StaffEventAssignmentEvent.loadStaffEvents(staffId: staffId),
                );
          },
          theme: theme,
        ),
        _buildQuickActionButton(
          icon: Icons.add_circle,
          label: 'Test Ticket',
          onTap: () => _createTestTicket(),
          theme: theme,
        ),
        _buildQuickActionButton(
          icon: Icons.person_pin,
          label: 'Fix Organizers',
          onTap: () => _fixOrganizerNames(),
          theme: theme,
        ),
        _buildQuickActionButton(
          icon: Icons.people_outline,
          label: 'Attendees',
          onTap: selectedEvent != null
              ? () => _navigateToAttendees(context, selectedEvent!)
              : null,
          theme: theme,
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
    required ThemeData theme,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: onTap != null
              ? theme.colorScheme.surface
              : theme.colorScheme.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: theme.colorScheme.primary
                .withValues(alpha: onTap != null ? 0.3 : 0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.onSurface
                  .withValues(alpha: onTap != null ? 0.7 : 0.3),
              size: 24.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface
                    .withValues(alpha: onTap != null ? 0.7 : 0.3),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createTestTicket() async {
    try {
      await DebugTicketHelper.createTestTicket();
    } catch (e) {
      // Handle error silently for now
    }
  }

  void _fixOrganizerNames() async {
    try {
      await DebugOrganizerHelper.updateEventOrganizerNames();
    } catch (e) {
      // Handle error silently for now
    }
  }

  void _navigateToAttendees(
      BuildContext context, StaffEventAssignmentEntity selectedEvent) {
    // Use path parameters instead of query parameters
    final path = '/staff/attendees/${selectedEvent.eventId}/$staffId';
    context.go(path);
  }
}