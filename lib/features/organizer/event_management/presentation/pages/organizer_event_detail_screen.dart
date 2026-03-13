import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class OrganizerEventDetailScreen extends StatelessWidget {
  final String eventId;
  
  const OrganizerEventDetailScreen({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventManagementBloc>()
        ..add(EventManagementEvent.loadEventById(eventId: eventId)),
      child: OrganizerEventDetailView(eventId: eventId),
    );
  }
}

class OrganizerEventDetailView extends StatefulWidget {
  final String eventId;

  const OrganizerEventDetailView({
    super.key,
    required this.eventId,
  });

  @override
  State<OrganizerEventDetailView> createState() =>
      _OrganizerEventDetailViewState();
}

class _OrganizerEventDetailViewState extends State<OrganizerEventDetailView> {
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
            context.pop();
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
            context.pop();
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => _buildLoadingScaffold(),
          loading: () => _buildLoadingScaffold(),
          eventLoaded: (event) => _buildEventDetailScaffold(context, event),
          eventsLoaded: (events) => events.isNotEmpty
              ? _buildEventDetailScaffold(context, events.first)
              : _buildErrorScaffold('Event not found'),
          error: (message) => _buildErrorScaffold(message),
          eventCreated: (event) => _buildEventDetailScaffold(context, event),
          eventUpdated: (event) => _buildEventDetailScaffold(context, event),
          eventDeleted: () => _buildErrorScaffold('Event has been deleted'),
          eventCancelled: (event) => _buildEventDetailScaffold(context, event),
          eventDuplicated: (event) => _buildEventDetailScaffold(context, event),
          eventsSearched: (events) => events.isNotEmpty
              ? _buildEventDetailScaffold(context, events.first)
              : _buildErrorScaffold('Event not found'),
          statisticsLoaded: (statistics) => _buildLoadingScaffold(),
          bannerUploaded: (bannerUrl) => _buildLoadingScaffold(),
          bannerDeleted: () => _buildLoadingScaffold(),
        );
      },
    );
  }

  Widget _buildLoadingScaffold() {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0B2E),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Event Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF8B5CF6),
        ),
      ),
    );
  }

  Widget _buildErrorScaffold(String message) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0B2E),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Event Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
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
              'Error',
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
              onPressed: () {
                context.read<EventManagementBloc>().add(
                      EventManagementEvent.loadEventById(
                          eventId: widget.eventId),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetailScaffold(BuildContext context, EventEntity event) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context, event),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEventHeader(event),
                  SizedBox(height: 32.h),
                  _buildActionButtons(context, event),
                  SizedBox(height: 24.h),
                  _buildEventInfo(event),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, EventEntity event) {
    return SliverAppBar(
      expandedHeight: 280.h,
      pinned: true,
      backgroundColor: const Color(0xFF1A0B2E),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: Text(
        'Event Details',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        if (event.status.isEditable)
          IconButton(
            onPressed: () => _editEvent(context, event),
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
          ),
        IconButton(
          onPressed: () => _showMoreOptions(context, event),
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Event Banner Image or Placeholder
            event.bannerUrl != null && event.bannerUrl!.isNotEmpty
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
                      return _buildEventBannerPlaceholder();
                    },
                  )
                : _buildEventBannerPlaceholder(),

            // Gradient overlay for better text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
            
            // Content overlay
            Positioned(
              bottom: 80.h,
              left: 20.w,
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: _getStatusColor(event.status),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      event.status.displayName.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    event.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey[300],
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          event.location,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventBannerPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1A0B2E),
            const Color(0xFF2A1B3D),
            const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                    const Color(0xFF06B6D4).withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: CustomPaint(
                painter: _EventBackgroundPainter(),
              ),
            ),
          ),
          // Placeholder icon
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: Colors.white.withValues(alpha: 0.3),
                  size: 64.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  'No Banner Image',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildEventHeader(EventEntity event) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Performance Overview Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Performance Overview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Live Data',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        
        // Tickets Sold Card
        _buildMetricCard(
          title: 'Tickets Sold',
          value: soldTickets.toString(),
          subtitle: '${(progress * 100).toInt()}% OF CAPACITY',
          percentage: soldTickets > 0
              ? '+${((soldTickets / totalTickets) * 100).toInt()}%'
              : null,
          color: const Color(0xFF8B5CF6),
          progress: progress,
          icon: Icons.confirmation_number_outlined,
        ),
        SizedBox(height: 12.h),
        
        // Remaining Card
        _buildMetricCard(
          title: 'Remaining',
          value: (totalTickets - soldTickets).toString(),
          subtitle: 'Tickets left to sell',
          color: const Color(0xFF8B5CF6),
          icon: Icons.people_outline,
          showProgress: false,
        ),
        SizedBox(height: 12.h),
        
        // Revenue Card
        _buildMetricCard(
          title: 'Revenue',
          value: revenue > 0 ? '\$${revenue.toStringAsFixed(0)}' : 'Free Event',
          subtitle: 'Total earnings',
          percentage: revenue > 0
              ? '+${((revenue / (totalTickets * (event.ticketTypes.isNotEmpty ? event.ticketTypes.first.price : 1))) * 100).toInt()}%'
              : null,
          color: const Color(0xFF4ADE80),
          icon: Icons.attach_money_outlined,
          showProgress: false,
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required IconData icon,
    String? percentage,
    double? progress,
    bool showProgress = true,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          
          // Value and Percentage
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (percentage != null) ...[
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4ADE80).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    percentage,
                    style: TextStyle(
                      color: const Color(0xFF4ADE80),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 8.h),
          
          // Progress Bar (only for tickets sold)
          if (showProgress && progress != null) ...[
            Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
          ],
          
          // Subtitle
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, EventEntity event) {
    return Column(
      children: [
        // View All Attendees Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _viewAllAttendees(context, event.id),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B5CF6),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline,
                  color: Colors.white,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'View All Attendees',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        
        // Secondary Action Buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _broadcastMessage(context, event),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey[600]!),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.broadcast_on_personal_outlined,
                      color: Colors.grey[400],
                      size: 18.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Broadcast',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: OutlinedButton(
                onPressed: event.status.canBeCancelled
                    ? () => _cancelEvent(context, event)
                    : null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: event.status.canBeCancelled
                        ? const Color(0xFFEF4444)
                        : Colors.grey[600]!,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: event.status.canBeCancelled
                            ? const Color(0xFFEF4444)
                            : Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Cancel Event',
                      style: TextStyle(
                        color: event.status.canBeCancelled
                            ? const Color(0xFFEF4444)
                            : Colors.grey[600],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEventInfo(EventEntity event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Information',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        
        // Event Description
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2A1B3D),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                event.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        
        // Event Details
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2A1B3D),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              _buildInfoRow(
                'Date & Time',
                _formatDateTime(event.dateTime),
                Icons.calendar_today,
              ),
              SizedBox(height: 12.h),
              _buildInfoRow(
                'Location',
                event.location,
                Icons.location_on,
              ),
              SizedBox(height: 12.h),
              _buildInfoRow(
                'Capacity',
                '${event.maxCapacity} attendees',
                Icons.people,
              ),
              if (event.ticketTypes.isNotEmpty) ...[
                SizedBox(height: 12.h),
                _buildInfoRow(
                  'Ticket Types',
                  '${event.ticketTypes.length} type${event.ticketTypes.length > 1 ? 's' : ''}',
                  Icons.confirmation_number,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF8B5CF6),
          size: 16.sp,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.sp,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
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

  void _editEvent(BuildContext context, EventEntity event) {
    context
        .pushNamed(
      RouteName.editEventScreen,
      pathParameters: {'eventId': event.id},
      extra: event,
    )
        .then((result) {
      // If the edit screen returns an updated event, refresh the current view
      if (result is EventEntity) {
        context.read<EventManagementBloc>().add(
              EventManagementEvent.loadEventById(eventId: event.id),
            );
      }
    });
  }

  void _showMoreOptions(BuildContext context, EventEntity event) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2A1B3D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            _buildBottomSheetOption(
              'Duplicate Event',
              Icons.copy_outlined,
              () => _duplicateEvent(context, event),
            ),
            _buildBottomSheetOption(
              'Share Event',
              Icons.share_outlined,
              () => _shareEvent(context, event),
            ),
            _buildBottomSheetOption(
              'Export Data',
              Icons.download_outlined,
              () => _exportData(context, event),
            ),
            _buildBottomSheetOption(
              'Event Settings',
              Icons.settings_outlined,
              () => _eventSettings(context, event),
            ),
            if (event.status != EventStatus.cancelled)
              _buildBottomSheetOption(
                'Delete Event',
                Icons.delete_outline,
                () => _deleteEvent(context, event),
                isDestructive: true,
              ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetOption(
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1A0B2E),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive
                  ? const Color(0xFFEF4444)
                  : const Color(0xFF8B5CF6),
              size: 20.sp,
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                color: isDestructive ? const Color(0xFFEF4444) : Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _viewAllAttendees(BuildContext context, String eventId) {
    context.pushNamed(
      RouteName.attendeeList,
      pathParameters: {'eventId': eventId},
    );
  }

  void _broadcastMessage(BuildContext context, EventEntity event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Broadcast functionality coming soon...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _cancelEvent(BuildContext context, EventEntity event) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Cancel Event',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to cancel "${event.title}"? This action cannot be undone and all attendees will be notified.',
              style: TextStyle(color: Colors.grey[300], fontSize: 14.sp),
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
              'Keep Event',
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
          ),
          TextButton(
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
            child: Text(
              'Cancel Event',
              style: TextStyle(color: Colors.red[400], fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  void _duplicateEvent(BuildContext context, EventEntity event) {
    context.read<EventManagementBloc>().add(
          EventManagementEvent.duplicateEvent(
            eventId: event.id,
            organizerId: event.organizerId,
            newTitle: '${event.title} (Copy)',
            newDateTime: event.dateTime.add(const Duration(days: 7)),
          ),
        );
  }

  void _shareEvent(BuildContext context, EventEntity event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Share functionality coming soon...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _exportData(BuildContext context, EventEntity event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Export functionality coming soon...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _eventSettings(BuildContext context, EventEntity event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Settings functionality coming soon...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _deleteEvent(BuildContext context, EventEntity event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Delete Event',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Text(
          'Are you sure you want to permanently delete "${event.title}"? This action cannot be undone.',
          style: TextStyle(color: Colors.grey[300], fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<EventManagementBloc>().add(
                    EventManagementEvent.deleteEvent(
                      eventId: event.id,
                      organizerId: event.organizerId,
                ),
              );
              Navigator.of(context).pop();
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red[400], fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    // Draw mountain-like shapes
    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.5,
      size.width * 0.5, size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.7,
      size.width, size.height * 0.5,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw additional decorative elements
    paint.color = Colors.white.withValues(alpha: 0.03);
    final path2 = Path();
    path2.moveTo(0, size.height * 0.8);
    path2.quadraticBezierTo(
      size.width * 0.3, size.height * 0.6,
      size.width * 0.6, size.height * 0.75,
    );
    path2.quadraticBezierTo(
      size.width * 0.8, size.height * 0.85,
      size.width, size.height * 0.7,
    );
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}