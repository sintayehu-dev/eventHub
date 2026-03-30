import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class OrganizerEventsScreen extends StatelessWidget {
  const OrganizerEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A0B2E),
        body: Center(
          child: Text(
            'Please log in to view your events',
            style: TextStyle(color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventManagementBloc, EventManagementState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: const Color(0xFFEF4444),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
          },
          eventDeleted: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Event deleted successfully'),
                backgroundColor: const Color(0xFF4ADE80),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
            _loadEvents(context);
          },
          eventCancelled: (event) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Event cancelled successfully'),
                backgroundColor: const Color(0xFF4ADE80),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
            _loadEvents(context);
          },
        );
      },
      builder: (context, state) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Events',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _navigateToCreateEvent(context),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.add,
                            color: colorScheme.onPrimary,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Filter Tabs
                  _buildFilterTabs(),
                  SizedBox(height: 24.h),

                  // Events List
                  Expanded(
                    child: state.when(
                      initial: () => const Center(
                        child: Text(
                          'Welcome! Create your first event.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: colorScheme.primary,
                        ),
                      ),
                      eventLoaded: (event) =>
                          _buildEventsList(context, [event]),
                      eventsLoaded: (events) =>
                          _buildEventsList(context, events),
                      error: (message) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48.sp,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Error loading events',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              message,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () => _loadEvents(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8B5CF6),
                              ),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                      eventCreated: (event) =>
                          _buildEventsList(context, [event]),
                      eventUpdated: (event) =>
                          _buildEventsList(context, [event]),
                      eventDeleted: () => const Center(
                        child: Text(
                          'Event deleted successfully',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      eventCancelled: (event) =>
                          _buildEventsList(context, [event]),
                      eventDuplicated: (event) =>
                          _buildEventsList(context, [event]),
                      eventsSearched: (events) =>
                          _buildEventsList(context, events),
                      statisticsLoaded: (statistics) => const SizedBox.shrink(),
                      bannerUploaded: (bannerUrl) => const SizedBox.shrink(),
                      bannerDeleted: () => const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToCreateEvent(BuildContext context) {
    context.pushNamed(RouteName.createEventScreen);
  }

  void _navigateToAttendees(BuildContext context, String eventId) {
    context.pushNamed(
      RouteName.eventAttendees,
      pathParameters: {'eventId': eventId},
    );
  }

  void _navigateToEventDetail(BuildContext context, String eventId) {
    context.pushNamed(
      RouteName.organizerEventDetail,
      pathParameters: {'eventId': eventId},
    );
  }

  void _loadEvents(BuildContext context) {
    context.read<EventManagementBloc>().add(
          EventManagementEvent.loadOrganizerEvents(
            organizerId: widget.organizerId,
            status: _selectedStatus,
          ),
        );
  }

  Widget _buildFilterTabs() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildFilterTab('Active', EventStatus.active),
          _buildFilterTab('Draft', EventStatus.draft),
          _buildFilterTab('Completed', EventStatus.completed),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String title, EventStatus status) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = _selectedStatus == status;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedStatus = status;
          });
          _loadEvents(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildEventsList(BuildContext context, List<EventEntity> events) {
    if (events.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_note,
              color: Colors.grey[600],
              size: 64.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              'No events found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Create your first event to get started',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => _navigateToCreateEvent(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              ),
              child: Text(
                'Create Event',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: events.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return _buildEventCard(context, events[index]);
      },
    );
  }
  Widget _buildEventCard(BuildContext context, EventEntity event) {
    final soldTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + (ticket.quantity - ticket.availableQuantity),
    );

    final totalTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + ticket.quantity,
    );

    final revenue = event.ticketTypes.fold<double>(
      0.0,
      (sum, ticket) {
        final sold = ticket.quantity - ticket.availableQuantity;
        return sum + (sold * ticket.price);
      },
    );
    
    final progress = totalTickets > 0 ? soldTickets / totalTickets : 0.0;
    final statusColor = _getStatusColor(event.status);
    
    return GestureDetector(
      onTap: () => _navigateToEventDetail(context, event.id),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: statusColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Banner Image
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: event.bannerUrl != null && event.bannerUrl!.isNotEmpty
                    ? Image.network(
                        event.bannerUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: const Color(0xFF1A0B2E),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: const Color(0xFF8B5CF6),
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return _buildPlaceholderImage();
                        },
                      )
                    : _buildPlaceholderImage(),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (event.status == EventStatus.active)
                              Container(
                                width: 6.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (event.status == EventStatus.active)
                              SizedBox(width: 6.w),
                            Text(
                              event.status.displayName,
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.grey[600],
                          size: 20.sp,
                        ),
                        color: const Color(0xFF2A1B3D),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'details',
                            child: Text(
                              'View Details',
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'attendees',
                            child: Text(
                              'View Attendees',
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                          if (event.status.isEditable)
                            PopupMenuItem(
                              value: 'edit',
                              child: Text(
                                'Edit Event',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 14.sp),
                              ),
                            ),
                          PopupMenuItem(
                            value: 'analytics',
                            child: Text(
                              'View Analytics',
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                          if (event.status.canBeCancelled)
                            PopupMenuItem(
                              value: 'cancel',
                              child: Text(
                                'Cancel Event',
                                style: TextStyle(color: Colors.red, fontSize: 14.sp),
                              ),
                            ),
                        ],
                        onSelected: (value) =>
                            _handleEventAction(context, value, event),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  
                  // Event title
                  Text(
                    event.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  
                  // Date and venue
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey[400],
                        size: 14.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        _formatDateTime(event.dateTime),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[400],
                        size: 14.sp,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          event.location,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  
                  // Progress and stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tickets Sold',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '$soldTickets / $totalTickets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Revenue',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            revenue > 0 ? '\${revenue.toStringAsFixed(0)}' : 'Free',
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  
                  // Progress bar
                  Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${(progress * 100).toInt()}% sold',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: const Color(0xFF1A0B2E),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              color: Colors.grey[600],
              size: 48.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              'No Image',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(EventStatus status) {
    switch (status) {
      case EventStatus.active:
        return const Color(0xFF4ADE80);
      case EventStatus.draft:
        return const Color(0xFFF59E0B);
      case EventStatus.completed:
        return const Color(0xFF06B6D4);
      case EventStatus.cancelled:
        return const Color(0xFFEF4444);
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final year = dateTime.year;
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$month $day, $year • $displayHour:$minute $period';
  }

  void _handleEventAction(
      BuildContext context, String action, EventEntity event) {
    switch (action) {
      case 'details':
        _navigateToEventDetail(context, event.id);
        break;
      case 'attendees':
        _navigateToAttendees(context, event.id);
        break;
      case 'edit':
        context
            .pushNamed(
          RouteName.editEventScreen,
          pathParameters: {'eventId': event.id},
          extra: event,
        )
            .then((result) {
          // If the edit screen returns an updated event, refresh the events list
          if (result is EventEntity) {
            _loadEvents(context);
          }
        });
        break;
      case 'analytics':
        context.read<EventManagementBloc>().add(
              EventManagementEvent.loadEventStatistics(
                eventId: event.id,
                organizerId: event.organizerId,
          ),
        );
        break;
      case 'cancel':
        _showCancelEventDialog(context, event);
        break;
    }
  }

  void _showCancelEventDialog(BuildContext context, EventEntity event) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        title: const Text(
          'Cancel Event',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to cancel "${event.title}"?',
              style: TextStyle(color: Colors.grey[300]),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: reasonController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Cancellation Reason',
                labelStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[600]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[600]!),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8B5CF6)),
                ),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (reasonController.text.trim().isNotEmpty) {
                context.read<EventManagementBloc>().add(
                      EventManagementEvent.cancelEvent(
                        eventId: event.id,
                        organizerId: event.organizerId,
                        cancellationReason: reasonController.text.trim(),
                      ),
                    );
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
            ),
            child: const Text('Cancel Event'),
          ),
        ],
      ),
    );
  }
}