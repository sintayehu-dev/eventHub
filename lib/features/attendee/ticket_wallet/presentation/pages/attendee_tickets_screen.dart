import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendeeTicketsScreen extends StatefulWidget {
  const AttendeeTicketsScreen({super.key});

  @override
  State<AttendeeTicketsScreen> createState() => _AttendeeTicketsScreenState();
}

class _AttendeeTicketsScreenState extends State<AttendeeTicketsScreen> {
  int selectedTab = 0; // 0 for UPCOMING, 1 for PAST

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Tab Bar
            _buildTabBar(),
            
            // Tickets List
            Expanded(
              child: _buildTicketsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1B3D),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'My Tickets',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1B3D),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() => selectedTab = 0),
            child: Column(
              children: [
                Text(
                  'UPCOMING',
                  style: TextStyle(
                    color: selectedTab == 0 
                        ? const Color(0xFF8B5CF6)
                        : Colors.grey[400],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 2.h,
                  width: 60.w,
                  color: selectedTab == 0 
                      ? const Color(0xFF8B5CF6)
                      : Colors.transparent,
                ),
              ],
            ),
          ),
          SizedBox(width: 32.w),
          GestureDetector(
            onTap: () => setState(() => selectedTab = 1),
            child: Column(
              children: [
                Text(
                  'PAST',
                  style: TextStyle(
                    color: selectedTab == 1 
                        ? const Color(0xFF8B5CF6)
                        : Colors.grey[400],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 2.h,
                  width: 40.w,
                  color: selectedTab == 1 
                      ? const Color(0xFF8B5CF6)
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketsList() {
    final upcomingTickets = [
      {
        'title': 'Interstellar Live Symphony',
        'date': 'Oct 24, 2024',
        'time': '19:30',
        'seatInfo': 'Section A, Row 12, Seat 42',
        'ticketType': 'VIP Pass',
        'hasQR': true,
      },
      {
        'title': 'The Dark Knight Marathon',
        'date': 'Nov 05, 2024',
        'time': '20:00',
        'seatInfo': 'Screen 4, Seat J78',
        'ticketType': 'Standard',
        'hasQR': true,
      },
      {
        'title': 'Neon City Tech Expo',
        'date': 'Dec 12, 2024',
        'time': '10:00',
        'seatInfo': 'Hall B, General Admission',
        'ticketType': 'Early Bird',
        'hasQR': false,
      },
    ];

    final pastTickets = [
      {
        'title': 'Summer Music Festival',
        'date': 'Aug 15, 2024',
        'time': '18:00',
        'seatInfo': 'General Admission',
        'ticketType': 'Standard',
        'hasQR': false,
      },
    ];

    final tickets = selectedTab == 0 ? upcomingTickets : pastTickets;

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: tickets.length,
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        return _buildTicketCard(tickets[index]);
      },
    );
  }

  Widget _buildTicketCard(Map<String, dynamic> ticket) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
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
          // Event Image with Concert Scene
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Stack(
              children: [
                // Concert background
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF0F172A),
                        const Color(0xFF1E293B),
                        const Color(0xFF334155),
                      ],
                    ),
                  ),
                ),
                
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
                          Colors.white.withValues(alpha: 0.6),
                          Colors.cyan.withValues(alpha: 0.4),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                
                // QR Code placeholder in center
                if (ticket['hasQR'])
                  Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.black,
                          size: 40.sp,
                        ),
                      ),
                    ),
                  ),
                
                // Status badge
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: ticket['hasQR'] 
                          ? const Color(0xFF8B5CF6)
                          : Colors.grey[600],
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      ticket['hasQR'] ? 'Confirmed' : 'Pending',
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
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Title
                Text(
                  ticket['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                
                // Date and Time
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey[400],
                      size: 16.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${ticket['date']} • ${ticket['time']}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                
                // Seat Info and Ticket Type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SEAT INFO',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          ticket['seatInfo'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TICKET TYPE',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          ticket['ticketType'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                
                // View QR Code Button
                if (ticket['hasQR'])
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B5CF6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'View QR Code',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}