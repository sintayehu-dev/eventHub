import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class OrganizerHomeScreen extends StatelessWidget {
  const OrganizerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A0B2E),
        body: Center(
          child: Text(
            'Please log in to view your dashboard',
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
      child: const OrganizerHomeView(),
    );
  }
}

class OrganizerHomeView extends StatelessWidget {
  const OrganizerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: BlocBuilder<EventManagementBloc, EventManagementState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(),
                  SizedBox(height: 32.h),
                  
                  // Welcome Section
                  _buildWelcomeSection(),
                  SizedBox(height: 32.h),
                  
                  // Stats Cards
                  state.when(
                    initial: () => _buildLoadingStats(),
                    loading: () => _buildLoadingStats(),
                    eventsLoaded: (events) => _buildStatsSection(events),
                    eventLoaded: (event) => _buildStatsSection([event]),
                    error: (message) => _buildErrorSection(message),
                    eventCreated: (event) => _buildStatsSection([event]),
                    eventUpdated: (event) => _buildStatsSection([event]),
                    eventDeleted: () => _buildLoadingStats(),
                    eventCancelled: (event) => _buildStatsSection([event]),
                    eventDuplicated: (event) => _buildStatsSection([event]),
                    eventsSearched: (events) => _buildStatsSection(events),
                    statisticsLoaded: (statistics) => _buildLoadingStats(),
                    bannerUploaded: (bannerUrl) => _buildLoadingStats(),
                    bannerDeleted: () => _buildLoadingStats(),
                  ),
                  SizedBox(height: 32.h),
                  
                  // Quick Actions
                  _buildQuickActionsSection(context),
                  SizedBox(height: 32.h),
                  
                  // Active Events
                  state.when(
                    initial: () => _buildLoadingEvents(),
                    loading: () => _buildLoadingEvents(),
                    eventsLoaded: (events) => _buildActiveEventsSection(context, events),
                    eventLoaded: (event) => _buildActiveEventsSection(context, [event]),
                    error: (message) => _buildErrorSection(message),
                    eventCreated: (event) => _buildActiveEventsSection(context, [event]),
                    eventUpdated: (event) => _buildActiveEventsSection(context, [event]),
                    eventDeleted: () => _buildLoadingEvents(),
                    eventCancelled: (event) => _buildActiveEventsSection(context, [event]),
                    eventDuplicated: (event) => _buildActiveEventsSection(context, [event]),
                    eventsSearched: (events) => _buildActiveEventsSection(context, events),
                    statisticsLoaded: (statistics) => _buildLoadingEvents(),
                    bannerUploaded: (bannerUrl) => _buildLoadingEvents(),
                    bannerDeleted: () => _buildLoadingEvents(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)],
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.star,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Event Hub',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: const Color(0xFF8B5CF6),
            size: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organizer Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Welcome back, Alex. Here\'s what\'s happening today.',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(List<EventEntity> events) {
    // Calculate stats from real events
    final totalRevenue = events.fold<double>(0.0, (sum, event) {
      return sum + event.ticketTypes.fold<double>(0.0, (ticketSum, ticket) {
        final sold = ticket.quantity - ticket.availableQuantity;
        return ticketSum + (sold * ticket.price);
      });
    });

    final totalTicketsSold = events.fold<int>(0, (sum, event) {
      return sum + event.ticketTypes.fold<int>(0, (ticketSum, ticket) {
        return ticketSum + (ticket.quantity - ticket.availableQuantity);
      });
    });

    final totalCapacity = events.fold<int>(0, (sum, event) => sum + event.maxCapacity);
    final avgAttendance = totalCapacity > 0 ? (totalTicketsSold / totalCapacity) * 100 : 0.0;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Total Revenue',
                value: totalRevenue > 0 ? '\$${totalRevenue.toStringAsFixed(0)}' : '\$0',
                change: '+12%',
                isPositive: true,
                color: const Color(0xFF8B5CF6),
                icon: Icons.attach_money,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildStatCard(
                title: 'Active Events',
                value: '${events.length}',
                change: '+3 new',
                isPositive: true,
                color: const Color(0xFF06B6D4),
                icon: Icons.event,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Tickets Sold',
                value: '$totalTicketsSold',
                change: '+8%',
                isPositive: true,
                color: const Color(0xFF4ADE80),
                icon: Icons.confirmation_number,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildStatCard(
                title: 'Avg. Attendance',
                value: '${avgAttendance.toInt()}%',
                change: '+2.5%',
                isPositive: true,
                color: const Color(0xFFF59E0B),
                icon: Icons.people,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingStats() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildLoadingStatCard()),
            SizedBox(width: 16.w),
            Expanded(child: _buildLoadingStatCard()),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: _buildLoadingStatCard()),
            SizedBox(width: 16.w),
            Expanded(child: _buildLoadingStatCard()),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingStatCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: 60.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorSection(String message) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 32.sp),
          SizedBox(height: 8.h),
          Text(
            'Error loading data',
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            message,
            style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget _buildStatCard({
    required String title,
    required String value,
    required String change,
    required bool isPositive,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.sp,
                ),
              ),
              Container(
                width: 32.w,
                height: 32.h,
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
          SizedBox(height: 12.h),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? const Color(0xFF4ADE80) : const Color(0xFFEF4444),
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                change,
                style: TextStyle(
                  color: isPositive ? const Color(0xFF4ADE80) : const Color(0xFFEF4444),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                title: 'New Event',
                icon: Icons.add_circle,
                color: const Color(0xFF8B5CF6),
                onTap: () => context.pushNamed(RouteName.createEventScreen),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                title: 'View Events',
                icon: Icons.event_note,
                color: const Color(0xFF06B6D4),
                onTap: () => context.pushNamed(RouteName.organizerEvents),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                title: 'Analytics',
                icon: Icons.analytics,
                color: const Color(0xFF4ADE80),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveEventsSection(BuildContext context, List<EventEntity> events) {
    if (events.isEmpty) {
      return _buildEmptyEventsSection(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active Events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => context.pushNamed(RouteName.organizerEvents),
              child: Text(
                'View All',
                style: TextStyle(
                  color: const Color(0xFF8B5CF6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ...events.take(3).map((event) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: _buildActiveEventCard(context, event),
        )),
      ],
    );
  }

  Widget _buildEmptyEventsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Events',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2A1B3D),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Icon(
                Icons.event_note,
                color: Colors.grey[600],
                size: 48.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                'No Active Events',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Create your first event to get started',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => context.pushNamed(RouteName.createEventScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                child: Text(
                  'Create Event',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Events',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...List.generate(3, (index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: _buildLoadingEventCard(),
        )),
      ],
    );
  }

  Widget _buildLoadingEventCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 120.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 80.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveEventCard(BuildContext context, EventEntity event) {
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
      onTap: () => context.pushNamed(
        RouteName.organizerEventDetail,
        pathParameters: {'eventId': event.id},
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: statusColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Event Image with Placeholder
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: event.bannerUrl != null && event.bannerUrl!.isNotEmpty
                    ? Image.network(
                        event.bannerUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: const Color(0xFF1A0B2E),
                            child: Center(
                              child: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                  color: const Color(0xFF8B5CF6),
                                  strokeWidth: 2,
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return _buildEventImagePlaceholder(statusColor);
                        },
                      )
                    : _buildEventImagePlaceholder(statusColor),
              ),
            ),
            SizedBox(width: 16.w),
            
            // Event Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _formatDateTime(event.dateTime),
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    event.location,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 11.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  
                  // Progress Bar
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$soldTickets / $totalTickets sold',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            revenue > 0 ? '\$${revenue.toStringAsFixed(0)}' : 'Free',
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
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
                              color: statusColor,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // More Options
            Icon(
              Icons.more_vert,
              color: Colors.grey[600],
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventImagePlaceholder(Color color) {
    return Container(
      color: color.withValues(alpha: 0.2),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: color,
          size: 24.sp,
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
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$month $day • $displayHour:$minute $period';
  }
}