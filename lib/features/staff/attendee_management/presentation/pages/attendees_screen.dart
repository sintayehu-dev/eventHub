import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';
import 'package:eventhub/features/staff/attendee_management/application/attendee_management/bloc/attendee_management_bloc.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';

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
  AttendeeSearchResult? _currentResult;
  AttendeeStats? _currentStats;

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const AppBackButton(),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Attendees',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<AttendeeManagementBloc>().add(
                        AttendeeManagementEvent.refreshAttendees(
                          eventId: widget.eventId,
                          staffId: widget.staffId,
                        ),
                      );
                    },
                    icon: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: theme.colorScheme.onPrimary,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              
              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: _onSearch,
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Search by name, email, or ticket ID...',
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              
              // Stats Section
              BlocBuilder<AttendeeManagementBloc, AttendeeManagementState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    attendeeStatsLoaded: (stats) {
                      _currentStats = stats;
                      return _buildStatsSection(stats, theme);
                    },
                    orElse: () => _currentStats != null 
                        ? _buildStatsSection(_currentStats!, theme)
                        : _buildLoadingStats(theme),
                  );
                },
              ),
              SizedBox(height: 24.h),
              
              // Filter Tabs
              _buildFilterTabs(theme),
              SizedBox(height: 24.h),
              
              // Attendees List
              Expanded(
                child: BlocConsumer<AttendeeManagementBloc, AttendeeManagementState>(
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
                      attendeeCheckedIn: (attendee) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${attendee.name} checked in successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // Refresh the list and stats
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
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return state.when(
                      initial: () => Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      attendeesLoaded: (result) {
                        _currentResult = result;
                        return _buildAttendeesList(result, theme);
                      },
                      attendeesSearched: (result) {
                        _currentResult = result;
                        return _buildAttendeesList(result, theme);
                      },
                      attendeesRefreshed: (result) {
                        _currentResult = result;
                        return _buildAttendeesList(result, theme);
                      },
                      error: (message) => Center(
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
                              'Error loading attendees',
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
                            SizedBox(height: 24.h),
                            ElevatedButton(
                              onPressed: () {
                                context.read<AttendeeManagementBloc>().add(
                                  AttendeeManagementEvent.loadEventAttendees(
                                    eventId: widget.eventId,
                                    staffId: widget.staffId,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.primary,
                                foregroundColor: theme.colorScheme.onPrimary,
                              ),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                      attendeeLoaded: (_) => _currentResult != null 
                          ? _buildAttendeesList(_currentResult!, theme)
                          : Center(
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                      attendeeStatusUpdated: (_) => _currentResult != null 
                          ? _buildAttendeesList(_currentResult!, theme)
                          : Center(
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                      attendeeStatsLoaded: (_) => _currentResult != null 
                          ? _buildAttendeesList(_currentResult!, theme)
                          : Center(
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                      attendeeCheckedIn: (_) => _currentResult != null 
                          ? _buildAttendeesList(_currentResult!, theme)
                          : Center(
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildStatsSection(AttendeeStats stats, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Checked In',
            value: stats.checkedIn.toString(),
            color: Colors.green,
            icon: Icons.check_circle,
            theme: theme,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: 'Registered',
            value: (stats.totalRegistered - stats.checkedIn).toString(),
            color: Colors.orange,
            icon: Icons.pending,
            theme: theme,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: 'Total',
            value: stats.totalRegistered.toString(),
            color: colorScheme.primary,
            icon: Icons.people,
            theme: theme,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingStats(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Checked In',
            value: '...',
            color: Colors.green,
            icon: Icons.check_circle,
            theme: theme,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: 'Registered',
            value: '...',
            color: Colors.orange,
            icon: Icons.pending,
            theme: theme,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: 'Total',
            value: '...',
            color: colorScheme.primary,
            icon: Icons.people,
            theme: theme,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
    required ThemeData theme,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _onStatusFilter(null),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: _selectedStatus == null 
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'All',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _selectedStatus == null 
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _onStatusFilter(AttendeeStatus.checkedIn),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: _selectedStatus == AttendeeStatus.checkedIn 
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Checked In',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _selectedStatus == AttendeeStatus.checkedIn 
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _onStatusFilter(AttendeeStatus.registered),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: _selectedStatus == AttendeeStatus.registered 
                      ? theme.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Registered',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _selectedStatus == AttendeeStatus.registered 
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendeesList(AttendeeSearchResult result, ThemeData theme) {
    if (result.attendees.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 64.sp,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No attendees found',
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 8.h),
            Text(
              _searchController.text.isNotEmpty 
                  ? 'Try adjusting your search criteria'
                  : 'No attendees registered for this event yet',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: result.attendees.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return _buildAttendeeCard(result.attendees[index], theme);
      },
    );
  }

  Widget _buildAttendeeCard(AttendeeEntity attendee, ThemeData theme) {
    final isCheckedIn = attendee.status == AttendeeStatus.checkedIn;
    final statusColor = _getStatusColor(attendee.status);
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _getInitials(attendee.name),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          
          // Attendee Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendee.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  attendee.email,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        attendee.ticketType,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (attendee.phone != null) ...[
                      SizedBox(width: 8.w),
                      Text(
                        '• ${attendee.phone}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          
          // Status and Actions
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getStatusIcon(attendee.status),
                      color: statusColor,
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      attendee.status.displayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCheckedIn && attendee.checkInTime != null) ...[
                SizedBox(height: 8.h),
                Text(
                  _formatTime(attendee.checkInTime!),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
              if (!isCheckedIn) ...[
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () => _onManualCheckIn(attendee),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    minimumSize: Size.zero,
                  ),
                  child: Text(
                    'Check In',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _getInitials(String name) {
    return name.split(' ').map((e) => e.isNotEmpty ? e[0] : '').join().toUpperCase();
  }

  Color _getStatusColor(AttendeeStatus status) {
    switch (status) {
      case AttendeeStatus.checkedIn:
        return Colors.green;
      case AttendeeStatus.registered:
        return Colors.orange;
      case AttendeeStatus.noShow:
        return Colors.red;
      case AttendeeStatus.cancelled:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(AttendeeStatus status) {
    switch (status) {
      case AttendeeStatus.checkedIn:
        return Icons.check_circle;
      case AttendeeStatus.registered:
        return Icons.pending;
      case AttendeeStatus.noShow:
        return Icons.cancel;
      case AttendeeStatus.cancelled:
        return Icons.block;
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}