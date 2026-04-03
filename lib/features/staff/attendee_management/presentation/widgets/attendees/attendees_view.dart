import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/staff/attendee_management/application/attendee_management/bloc/attendee_management_bloc.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_header_widget.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_search_widget.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_stats_widget.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_filter_tabs_widget.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees/attendees_list_widget.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/widgets/attendees_shimmer.dart';

class AttendeesView extends StatefulWidget {
  final String eventId;
  final String staffId;

  const AttendeesView({
    super.key,
    required this.eventId,
    required this.staffId,
  });

  @override
  State<AttendeesView> createState() => _AttendeesViewState();
}

class _AttendeesViewState extends State<AttendeesView> {
  final TextEditingController _searchController = TextEditingController();
  AttendeeStatus? _selectedStatus;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.isEmpty) {
      context.read<AttendeeManagementBloc>().add(
        AttendeeManagementEvent.loadEventAttendees(
          eventId: widget.eventId,
          staffId: widget.staffId,
          status: _selectedStatus,
        ),
      );
    } else {
      context.read<AttendeeManagementBloc>().add(
        AttendeeManagementEvent.searchAttendees(
          eventId: widget.eventId,
          staffId: widget.staffId,
          query: query,
          status: _selectedStatus,
        ),
      );
    }
  }

  void _onStatusFilter(AttendeeStatus? status) {
    setState(() {
      _selectedStatus = status;
    });
    
    final query = _searchController.text;
    if (query.isEmpty) {
      context.read<AttendeeManagementBloc>().add(
        AttendeeManagementEvent.loadEventAttendees(
          eventId: widget.eventId,
          staffId: widget.staffId,
          status: status,
        ),
      );
    } else {
      context.read<AttendeeManagementBloc>().add(
        AttendeeManagementEvent.searchAttendees(
          eventId: widget.eventId,
          staffId: widget.staffId,
          query: query,
          status: status,
        ),
      );
    }
  }

  void _onManualCheckIn(AttendeeEntity attendee) {
    context.read<AttendeeManagementBloc>().add(
      AttendeeManagementEvent.manualCheckIn(
        attendeeId: attendee.id,
        eventId: widget.eventId,
        staffId: widget.staffId,
      ),
    );
  }

  void _onRefresh() {
    context.read<AttendeeManagementBloc>().add(
      AttendeeManagementEvent.refreshAttendees(
        eventId: widget.eventId,
        staffId: widget.staffId,
      ),
    );
    context.read<AttendeeManagementBloc>().add(
      AttendeeManagementEvent.loadAttendeeStats(
        eventId: widget.eventId,
        staffId: widget.staffId,
      ),
    );
  }

  void _onRetry() {
    context.read<AttendeeManagementBloc>().add(
      AttendeeManagementEvent.loadEventAttendees(
        eventId: widget.eventId,
        staffId: widget.staffId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20.w, 20.w + MediaQuery.of(context).padding.top, 20.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            AttendeesHeaderWidget(onRefresh: _onRefresh),
            SizedBox(height: 24.h),

            // Search Bar
            AttendeesSearchWidget(
              controller: _searchController,
              onSearch: _onSearch,
            ),
            SizedBox(height: 16.h),

            // Stats Section
            BlocBuilder<AttendeeManagementBloc, AttendeeManagementState>(
              builder: (context, state) {
                if (state.isLoadingStats) {
                  return const StatsShimmer();
                }

                if (state.stats != null) {
                  return AttendeesStatsWidget(stats: state.stats!);
                }

                return const SizedBox.shrink();
              },
            ),
            SizedBox(height: 24.h),

            // Filter Tabs
            AttendeesFilterTabsWidget(
              selectedStatus: _selectedStatus,
              onStatusFilter: _onStatusFilter,
            ),
            SizedBox(height: 24.h),

            // Attendees List
            Expanded(
              child:
                  BlocConsumer<AttendeeManagementBloc, AttendeeManagementState>(
                listener: (context, state) {
                  if (state.hasError && state.errorMessage.isNotEmpty) {
                    AppHelpers.showErrorSnackBar(context, state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return const AttendeesShimmer();
                  }

                  if (state.hasError && state.attendees.isEmpty) {
                    return AppErrorRetryWidget(
                      errorMessage: state.errorMessage,
                      onRetry: _onRetry,
                    );
                  }

                  return AttendeesListWidget(
                    attendees: state.attendees,
                    searchQuery: _searchController.text,
                    onManualCheckIn: _onManualCheckIn,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}