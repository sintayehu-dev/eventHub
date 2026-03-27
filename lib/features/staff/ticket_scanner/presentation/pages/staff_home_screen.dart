import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/debug_ticket_helper.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StaffEventAssignmentBloc>()
        ..add(const StaffEventAssignmentEvent.loadStaffEvents(
            staffId: 'staff123')), // TODO: Get from auth
      child: const StaffHomeView(),
    );
  }
}

class StaffHomeView extends StatelessWidget {
  const StaffHomeView({super.key});

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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: theme.colorScheme.error,
                  ),
                );
              },
              accessDenied: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: theme.colorScheme.error,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
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
              accessDenied: (message) => _buildErrorState(theme, message),
              assignmentsRefreshed: (events, selectedEvent) => _buildContent(
                context,
                theme,
                events,
                selectedEvent ?? (events.isNotEmpty ? events.first : null),
              ),
              error: (message) => _buildErrorState(theme, message),
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
      return _buildNoEventsState(theme);
    }

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Header with event selector
          _buildHeader(context, theme, events, selectedEvent),
          SizedBox(height: 40.h),

          // Scanner Frame
          Expanded(
            child: _buildScannerFrame(theme),
          ),

          // Instructions
          _buildInstructions(theme),
          SizedBox(height: 24.h),

          // Start Scanning Button
          _buildStartScanningButton(context, theme, selectedEvent),
          SizedBox(height: 32.h),

          // Quick Actions
          _buildQuickActions(context, theme, selectedEvent),
        ],
      ),
    );
  }

  Widget _buildNoEventsState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy,
            size: 64.sp,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          SizedBox(height: 16.h),
          Text(
            'No Events Assigned',
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            'Contact your manager to get assigned to events',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(ThemeData theme, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.sp,
            color: theme.colorScheme.error,
          ),
          SizedBox(height: 16.h),
          Text(
            'Error',
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    List<StaffEventAssignmentEntity> events,
    StaffEventAssignmentEntity? selectedEvent,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back,
              color: theme.colorScheme.onSurface,
              size: 24.sp,
            ),
            Column(
              children: [
                Text(
                  'ENTRY CONTROL',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  selectedEvent != null
                      ? '${selectedEvent.eventTitle} • Gate A'
                      : 'Event Scanner • Gate A',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: theme.colorScheme.onSurface,
                size: 24.sp,
              ),
              onSelected: (eventId) {
                context.read<StaffEventAssignmentBloc>().add(
                      StaffEventAssignmentEvent.selectEvent(eventId: eventId),
                    );
              },
              itemBuilder: (context) => events.map((event) {
                return PopupMenuItem<String>(
                  value: event.eventId,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventTitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        event.eventLocation,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        if (events.length > 1) ...[
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.event,
                  size: 16.sp,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                SizedBox(width: 8.w),
                Text(
                  '${events.length} events assigned',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildScannerFrame(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          // Scanner overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          // Corner brackets
          Positioned(
            top: 40.h,
            left: 40.w,
            child: _buildCornerBracket(theme, isTopLeft: true),
          ),
          Positioned(
            top: 40.h,
            right: 40.w,
            child: _buildCornerBracket(theme, isTopRight: true),
          ),
          Positioned(
            bottom: 40.h,
            left: 40.w,
            child: _buildCornerBracket(theme, isBottomLeft: true),
          ),
          Positioned(
            bottom: 40.h,
            right: 40.w,
            child: _buildCornerBracket(theme, isBottomRight: true),
          ),
          
          // Scanning line animation
          Center(
            child: Container(
              width: 200.w,
              height: 2.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    theme.colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Center icon
          Center(
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: theme.colorScheme.primary,
                size: 40.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerBracket(
    ThemeData theme, {
    bool isTopLeft = false,
    bool isTopRight = false,
    bool isBottomLeft = false,
    bool isBottomRight = false,
  }) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary,
            width: 3,
          ),
          left: BorderSide(
            color: theme.colorScheme.primary,
            width: isTopLeft || isBottomLeft ? 3 : 0,
          ),
          right: BorderSide(
            color: theme.colorScheme.primary,
            width: isTopRight || isBottomRight ? 3 : 0,
          ),
          bottom: BorderSide(
            color: theme.colorScheme.primary,
            width: isBottomLeft || isBottomRight ? 3 : 0,
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Align ticket QR code within frame',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Tap "Start Scanning" to begin validation',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildStartScanningButton(BuildContext context, ThemeData theme,
      StaffEventAssignmentEntity? selectedEvent) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedEvent != null
            ? () => _startScanning(context, selectedEvent)
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'Start Scanning',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, ThemeData theme,
      StaffEventAssignmentEntity? selectedEvent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickActionButton(
          icon: Icons.refresh,
          label: 'Reset',
          onTap: () {
            context.read<StaffEventAssignmentBloc>().add(
                  const StaffEventAssignmentEvent.loadStaffEvents(
                      staffId: 'staff123'), // TODO: Get from auth
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
          icon: Icons.people_outline,
          label: 'Attendees',
          onTap: selectedEvent != null
              ? () => _navigateToAttendees(context, selectedEvent)
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

  void _startScanning(
      BuildContext context, StaffEventAssignmentEntity selectedEvent) {
    // Navigate to QR scanner screen with selected event
    context.push(
        '/staff/qr-scanner?eventId=${selectedEvent.eventId}&eventTitle=${selectedEvent.eventTitle}');
  }

  void _createTestTicket() async {
    try {
      await DebugTicketHelper.createTestTicket();
    } catch (e) {
      // Handle error silently for now
    }
  }

  void _navigateToAttendees(
      BuildContext context, StaffEventAssignmentEntity selectedEvent) {
    const staffId = 'staff123'; // TODO: Get from auth

    // Use path parameters instead of query parameters
    final path = '/staff/attendees/${selectedEvent.eventId}/$staffId';
    context.go(path);
  }
}