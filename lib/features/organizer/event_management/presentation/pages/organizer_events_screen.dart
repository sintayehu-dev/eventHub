import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';

class OrganizerEventsScreen extends StatelessWidget {
  const OrganizerEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _navigateToCreateEvent(context),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
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
                child: _buildEventsList(context),
              ),
            ],
          ),
        ),
      ),
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

  Widget _buildFilterTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Active',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                'Draft',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                'Completed',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return _buildEventCard(context, index);
      },
    );
  }

  Widget _buildEventCard(BuildContext context, int index) {
    final events = [
      {
        'title': 'Neon Nights: Electronic Music Festival',
        'date': 'Dec 25, 2024',
        'time': '8:00 PM',
        'venue': 'Blue Lime Arena, LA',
        'sold': '850',
        'total': '1000',
        'revenue': '\$63,750',
        'status': 'Live',
        'color': const Color(0xFF06B6D4),
      },
      {
        'title': 'Future Tech Summit 2025',
        'date': 'Jan 15, 2025',
        'time': '9:00 AM',
        'venue': 'Convention Center, SF',
        'sold': '278',
        'total': '500',
        'revenue': 'Free',
        'status': 'Selling',
        'color': const Color(0xFF4ADE80),
      },
      {
        'title': 'Indie Soul Sessions',
        'date': 'Jan 8, 2025',
        'time': '7:30 PM',
        'venue': 'Music Hall, NYC',
        'sold': '156',
        'total': '200',
        'revenue': '\$7,800',
        'status': 'Selling',
        'color': const Color(0xFFF59E0B),
      },
      {
        'title': 'Art & Wine Gallery Night',
        'date': 'Feb 2, 2025',
        'time': '6:00 PM',
        'venue': 'Modern Art Museum',
        'sold': '45',
        'total': '150',
        'revenue': '\$2,250',
        'status': 'Selling',
        'color': const Color(0xFFEF4444),
      },
      {
        'title': 'Startup Pitch Competition',
        'date': 'Feb 20, 2025',
        'time': '10:00 AM',
        'venue': 'Tech Hub, Austin',
        'sold': '89',
        'total': '300',
        'revenue': '\$4,450',
        'status': 'Selling',
        'color': const Color(0xFF8B5CF6),
      },
    ];

    final event = events[index % events.length];
    final double progress = double.parse(event['sold'] as String) / 
                           double.parse(event['total'] as String);
    
    return GestureDetector(
      onTap: () => _navigateToEventDetail(context, 'event_${index + 1}'),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: (event['color'] as Color).withValues(alpha: 0.3),
            width: 1,
          ),
        ),
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
                    color: event['status'] == 'Live' 
                        ? const Color(0xFFEF4444).withValues(alpha: 0.2)
                        : const Color(0xFF4ADE80).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (event['status'] == 'Live')
                        Container(
                          width: 6.w,
                          height: 6.h,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF4444),
                            shape: BoxShape.circle,
                          ),
                        ),
                      if (event['status'] == 'Live') SizedBox(width: 6.w),
                      Text(
                        event['status'] as String,
                        style: TextStyle(
                          color: event['status'] == 'Live' 
                              ? const Color(0xFFEF4444)
                              : const Color(0xFF4ADE80),
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
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                        'Edit Event',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'analytics',
                      child: Text(
                        'View Analytics',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'promote',
                      child: Text(
                        'Promote',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ],
                  onSelected: (value) => _handleEventAction(context, value, 'event_${index + 1}'),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            
            // Event title
            Text(
              event['title'] as String,
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
                  '${event['date']} • ${event['time']}',
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
                Text(
                  event['venue'] as String,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
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
                      '${event['sold']} / ${event['total']}',
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
                      event['revenue'] as String,
                      style: TextStyle(
                        color: event['color'] as Color,
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
                    color: event['color'] as Color,
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
    );
  }

  void _handleEventAction(BuildContext context, String action, String eventId) {
    switch (action) {
      case 'details':
        _navigateToEventDetail(context, eventId);
        break;
      case 'attendees':
        _navigateToAttendees(context, eventId);
        break;
      case 'edit':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Opening event editor...'),
            backgroundColor: const Color(0xFF8B5CF6),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
        );
        break;
      case 'analytics':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Opening analytics...'),
            backgroundColor: const Color(0xFF8B5CF6),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
        );
        break;
      case 'promote':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Opening promotion tools...'),
            backgroundColor: const Color(0xFF8B5CF6),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
        );
        break;
    }
  }
}