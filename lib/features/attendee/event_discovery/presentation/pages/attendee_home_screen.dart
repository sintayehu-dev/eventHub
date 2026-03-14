import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class AttendeeHomeScreen extends StatelessWidget {
  const AttendeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventDiscoveryBloc>()
        ..add(const EventDiscoveryEvent.loadUpcomingEvents(limit: 10)),
      child: const AttendeeHomeView(),
    );
  }
}

class AttendeeHomeView extends StatelessWidget {
  const AttendeeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<EventDiscoveryBloc>().add(
                  const EventDiscoveryEvent.refreshEvents(),
                );
          },
          color: const Color(0xFF8B5CF6),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(),
                  SizedBox(height: 24.h),

                  // Search Bar
                  _buildSearchBar(context),
                  SizedBox(height: 24.h),
                  
                  // Categories
                  _buildCategories(context),
                  SizedBox(height: 32.h),
                  
                  // Upcoming Events Section
                  _buildUpcomingEventsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to EventHub',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Discover amazing events near you',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.attendeeDiscover);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: const Color(0xFF8B5CF6),
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'Search events...',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = [
      {
        'name': 'Music',
        'icon': Icons.music_note,
        'category': EventCategory.music
      },
      {
        'name': 'Tech',
        'icon': Icons.computer,
        'category': EventCategory.technology
      },
      {
        'name': 'Sports',
        'icon': Icons.sports_soccer,
        'category': EventCategory.sports
      },
      {'name': 'Arts', 'icon': Icons.palette, 'category': EventCategory.arts},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                context.read<EventDiscoveryBloc>().add(
                      EventDiscoveryEvent.loadEventsByCategory(
                        category: category['category'] as EventCategory,
                      ),
                    );
                context.pushNamed(RouteName.attendeeDiscover);
              },
              child: Container(
                width: 70.w,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A1B3D),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      category['icon'] as IconData,
                      color: const Color(0xFF8B5CF6),
                      size: 24.sp,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      category['name'] as String,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildUpcomingEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to discover screen to see all events
              },
              child: Text(
                'See All',
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
        BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildLoadingState(),
              loading: () => _buildLoadingState(),
              loadingDetails: () => _buildLoadingState(),
              loaded:
                  (events, isSearchResult, selectedCategory, searchFilters) =>
                      _buildEventsList(context, events),
              eventDetailsLoaded: (event) => _buildEventsList(context, [event]),
              error: (networkException) =>
                  _buildErrorState(networkException.toString()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return SizedBox(
      height: 200.h,
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF8B5CF6),
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFEF4444).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: const Color(0xFFEF4444),
              size: 48.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              'Failed to load events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsList(
      BuildContext context, List<EventDiscoveryEntity> events) {
    if (events.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: events
          .take(3)
          .map((event) => _buildEventCard(context, event))
          .toList(),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              color: const Color(0xFF8B5CF6),
              size: 48.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              'No events found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Check back later for new events',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, EventDiscoveryEntity event) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.eventDetail,
          pathParameters: {'eventId': event.id},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2A1B3D),
              Color(0xFF1A0B2E),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image Placeholder
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0F172A),
                    Color(0xFF1E293B),
                    Color(0xFF334155),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Stage lights effect
                  Positioned(
                    top: 20.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.8,
                          colors: [
                            Colors.white.withValues(alpha: 0.9),
                            Colors.cyan.withValues(alpha: 0.6),
                            Colors.blue.withValues(alpha: 0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Price tag
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        event.priceRange,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Event Details
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Location
                  Text(
                    '${_formatDate(event.dateTime)} • ${event.location}',
                    style: TextStyle(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  
                  // Event Title
                  Text(
                    event.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),

                  // Organizer
                  Text(
                    'by ${event.organizerName}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.sp,
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

  String _formatDate(DateTime dateTime) {
    final months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return '${months[dateTime.month - 1]} ${dateTime.day}';
  }
}