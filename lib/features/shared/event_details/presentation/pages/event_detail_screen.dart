import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventDetailScreen extends StatelessWidget {
  final String? eventId;
  
  const EventDetailScreen({
    super.key,
    this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    if (eventId == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A0B2E),
        body: Center(
          child: Text(
            'Event not found',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return BlocProvider(
      create: (_) => getIt<EventDiscoveryBloc>()
        ..add(EventDiscoveryEvent.loadEventDetails(
          eventId: eventId!,
          userId: 'current_user_id', // TODO: Get from auth
        )),
      child: EventDetailView(eventId: eventId!),
    );
  }
}

class EventDetailView extends StatelessWidget {
  final String eventId;

  const EventDetailView({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingState(),
            loading: () => _buildLoadingState(),
            loadingDetails: () => _buildLoadingState(),
            loaded: (events, isSearchResult, selectedCategory, searchFilters) =>
                _buildLoadingState(), // This shouldn't happen for event details
            eventDetailsLoaded: (event) =>
                _buildEventDetailContent(context, event),
            error: (networkException) =>
                _buildErrorState(networkException.toString()),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFF8B5CF6),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
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
            'Failed to load event details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
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
    );
  }

  Widget _buildEventDetailContent(
      BuildContext context, EventDiscoveryEntity event) {
    return CustomScrollView(
      slivers: [
        // App Bar with Image
        _buildSliverAppBar(event),

        // Event Details
        SliverToBoxAdapter(
          child: _buildEventDetails(context, event),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(EventDiscoveryEntity event) {
    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      backgroundColor: const Color(0xFF1A0B2E),
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: IconButton(
            onPressed: () {
              // TODO: Implement favorite toggle
            },
            icon: Icon(
              event.isFavorite == true ? Icons.favorite : Icons.favorite_border,
              color: event.isFavorite == true ? Colors.red : Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Event Banner Image or Placeholder
            event.bannerUrl != null
                ? Image.network(
                    event.bannerUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildImagePlaceholder(),
                  )
                : _buildImagePlaceholder(),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
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
            top: 80.h,
            left: 0,
            right: 0,
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    Colors.white.withValues(alpha: 0.8),
                    Colors.cyan.withValues(alpha: 0.6),
                    Colors.purple.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Additional stage lights
          Positioned(
            top: 100.h,
            left: 80.w,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.pink.withValues(alpha: 0.8),
                    Colors.purple.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 100.h,
            right: 80.w,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.blue.withValues(alpha: 0.8),
                    Colors.cyan.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Crowd silhouette
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetails(BuildContext context, EventDiscoveryEntity event) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Category
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              event.category.name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          
          // Event Title
          Text(
            event.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          SizedBox(height: 24.h),
          
          // Event Info Cards
          _buildInfoCard(
            icon: Icons.calendar_today,
            title: 'Date & Time',
            subtitle: _formatDateTime(event.dateTime),
          ),
          SizedBox(height: 16.h),
          
          _buildInfoCard(
            icon: Icons.confirmation_number,
            title: 'Entry Price',
            subtitle: event.priceRange,
          ),
          SizedBox(height: 24.h),
          
          // Location Section
          _buildLocationSection(event),
          SizedBox(height: 24.h),
          
          // Organizer Section
          _buildOrganizerSection(event),
          SizedBox(height: 24.h),
          
          // About Event Section
          _buildAboutSection(event),
          SizedBox(height: 32.h),
          
          // Get Tickets Button
          _buildGetTicketsButton(context, event),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF8B5CF6),
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(EventDiscoveryEntity event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: const Color(0xFF8B5CF6),
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'Location',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        
        Container(
          padding: EdgeInsets.all(16.w),
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
              // Location image placeholder
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF4ADE80).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.location_city,
                  color: const Color(0xFF4ADE80),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    if (event.distance != null)
                      Text(
                        '${event.distance!.toStringAsFixed(1)} km away',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                      ),
                  ],
                ),
              ),
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'View Map',
                  style: TextStyle(
                    color: const Color(0xFF8B5CF6),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrganizerSection(EventDiscoveryEntity event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organizer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        
        Container(
          padding: EdgeInsets.all(16.w),
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
              // Organizer avatar
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    _getInitials(event.organizerName),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.organizerName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Event Organizer',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutSection(EventDiscoveryEntity event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Event',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        
        Text(
          event.description,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 15.sp,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildGetTicketsButton(
      BuildContext context, EventDiscoveryEntity event) {
    final isAvailable =
        event.availableTickets > 0 && event.status == EventStatus.active;
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isAvailable
            ? () {
                context.pushNamed(
                  RouteName.ticketSelection,
                  extra: event,
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isAvailable ? const Color(0xFF8B5CF6) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 18.h),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.confirmation_number,
              color: Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              event.isSoldOut ? 'Sold Out' : 'Get Tickets Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    final weekday = weekdays[dateTime.weekday - 1];
    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final hour = dateTime.hour;
    final minute = dateTime.minute;

    final timeString =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    return '$weekday, $month $day • $timeString';
  }

  String _getInitials(String name) {
    final words = name.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    } else if (words.isNotEmpty) {
      return words[0].substring(0, words[0].length >= 2 ? 2 : 1).toUpperCase();
    }
    return 'EO'; // Event Organizer fallback
  }
}