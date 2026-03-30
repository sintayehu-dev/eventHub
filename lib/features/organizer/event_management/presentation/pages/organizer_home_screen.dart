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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: Text(
            'Please log in to view your dashboard',
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: colorScheme.onSurface),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<EventManagementBloc, EventManagementState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(context),
                  SizedBox(height: 32.h),
                  
                  // Welcome Section
                  _buildWelcomeSection(context),
                  SizedBox(height: 32.h),
                  
                  // Stats Cards
                  state.when(
                    initial: () => _buildLoadingStats(context),
                    loading: () => _buildLoadingStats(context),
                    eventsLoaded: (events) =>
                        _buildStatsSection(context, events),
                    eventLoaded: (event) =>
                        _buildStatsSection(context, [event]),
                    error: (message) => _buildErrorSection(context, message),
                    eventCreated: (event) =>
                        _buildStatsSection(context, [event]),
                    eventUpdated: (event) =>
                        _buildStatsSection(context, [event]),
                    eventDeleted: () => _buildLoadingStats(context),
                    eventCancelled: (event) =>
                        _buildStatsSection(context, [event]),
                    eventDuplicated: (event) =>
                        _buildStatsSection(context, [event]),
                    eventsSearched: (events) =>
                        _buildStatsSection(context, events),
                    statisticsLoaded: (statistics) =>
                        _buildLoadingStats(context),
                    bannerUploaded: (bannerUrl) => _buildLoadingStats(context),
                    bannerDeleted: () => _buildLoadingStats(context),
                  ),
                  SizedBox(height: 32.h),
                  
                  // Quick Actions
                  _buildQuickActionsSection(context),
                  SizedBox(height: 32.h),
                  
                  // Active Events
                  state.when(
                    initial: () => _buildLoadingEvents(context),
                    loading: () => _buildLoadingEvents(context),
                    eventsLoaded: (events) => _buildActiveEventsSection(context, events),
                    eventLoaded: (event) => _buildActiveEventsSection(context, [event]),
                    error: (message) => _buildErrorSection(context, message),
                    eventCreated: (event) => _buildActiveEventsSection(context, [event]),
                    eventUpdated: (event) => _buildActiveEventsSection(context, [event]),
                    eventDeleted: () => _buildLoadingEvents(context),
                    eventCancelled: (event) => _buildActiveEventsSection(context, [event]),
                    eventDuplicated: (event) => _buildActiveEventsSection(context, [event]),
                    eventsSearched: (events) => _buildActiveEventsSection(context, events),
                    statisticsLoaded: (statistics) =>
                        _buildLoadingEvents(context),
                    bannerUploaded: (bannerUrl) => _buildLoadingEvents(context),
                    bannerDeleted: () => _buildLoadingEvents(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.secondary],
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.star,
                color: colorScheme.onPrimary,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Event Hub',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: colorScheme.primary,
            size: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organizer Dashboard',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Welcome back, Alex. Here\'s what\'s happening today.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context, List<EventEntity> events) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
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
                context: context,
                title: 'Total Revenue',
                value: totalRevenue > 0 ? '\$${totalRevenue.toStringAsFixed(0)}' : '\$0',
                change: '+12%',
                isPositive: true,
                color: colorScheme.primary,
                icon: Icons.attach_money,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildStatCard(
                context: context,
                title: 'Active Events',
                value: '${events.length}',
                change: '+3 new',
                isPositive: true,
                color: colorScheme.tertiary,
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
                context: context,
                title: 'Tickets Sold',
                value: '$totalTicketsSold',
                change: '+8%',
                isPositive: true,
                color: colorScheme.secondary,
                icon: Icons.confirmation_number,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildStatCard(
                context: context,
                title: 'Avg. Attendance',
                value: '${avgAttendance.toInt()}%',
                change: '+2.5%',
                isPositive: true,
                color: colorScheme.tertiary,
                icon: Icons.people,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingStats(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildLoadingStatCard(context)),
            SizedBox(width: 16.w),
            Expanded(child: _buildLoadingStatCard(context)),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: _buildLoadingStatCard(context)),
            SizedBox(width: 16.w),
            Expanded(child: _buildLoadingStatCard(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingStatCard(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: 60.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorSection(BuildContext context, String message) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: colorScheme.error, size: 32.sp),
          SizedBox(height: 8.h),
          Text(
            'Error loading data',
            style: theme.textTheme.titleMedium
                ?.copyWith(color: colorScheme.onSurface),
          ),
          SizedBox(height: 4.h),
          Text(
            message,
            style: theme.textTheme.bodySmall
                ?.copyWith(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String value,
    required String change,
    required bool isPositive,
    required Color color,
    required IconData icon,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
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
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
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
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? colorScheme.tertiary : colorScheme.error,
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                change,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isPositive ? colorScheme.tertiary : colorScheme.error,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionCard(
                context: context,
                title: 'New Event',
                icon: Icons.add_circle,
                color: colorScheme.primary,
                onTap: () => context.pushNamed(RouteName.createEventScreen),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                context: context,
                title: 'View Events',
                icon: Icons.event_note,
                color: colorScheme.tertiary,
                onTap: () => context.pushNamed(RouteName.organizerEvents),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                context: context,
                title: 'Analytics',
                icon: Icons.analytics,
                color: colorScheme.secondary,
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
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
                color: colorScheme.onPrimary,
                size: 24.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
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
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => context.pushNamed(RouteName.organizerEvents),
              child: Text(
                'View All',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Events',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Icon(
                Icons.event_note,
                color: colorScheme.onSurfaceVariant,
                size: 48.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                'No Active Events',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Create your first event to get started',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => context.pushNamed(RouteName.createEventScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                child: Text(
                  'Create Event',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingEvents(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Events',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...List.generate(3, (index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
                  child: _buildLoadingEventCard(context),
        )),
      ],
    );
  }

  Widget _buildLoadingEventCard(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: colorScheme.outline,
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
                    color: colorScheme.outline,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 120.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: colorScheme.outline,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 80.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: colorScheme.outline,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
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
          color: colorScheme.surfaceContainerHighest,
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
                            color: colorScheme.surface,
                            child: Center(
                              child: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                  color: colorScheme.primary,
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
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _formatDateTime(event.dateTime),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    event.location,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
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
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            revenue > 0 ? '\$${revenue.toStringAsFixed(0)}' : 'Free',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: colorScheme.outline,
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
              color: colorScheme.onSurfaceVariant,
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