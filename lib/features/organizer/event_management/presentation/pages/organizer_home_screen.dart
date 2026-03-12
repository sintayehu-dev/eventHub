import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizerHomeScreen extends StatelessWidget {
  const OrganizerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: SingleChildScrollView(
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
              _buildStatsSection(),
              SizedBox(height: 32.h),
              
              // Quick Actions
              _buildQuickActionsSection(),
              SizedBox(height: 32.h),
              
              // Active Events
              _buildActiveEventsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          'Event Hub',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: const Color(0xFF8B5CF6).withOpacity(0.2),
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

  Widget _buildStatsSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Total Revenue',
                value: '\$42,500',
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
                value: '12',
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
                value: '1,284',
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
                value: '88%',
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
          color: color.withOpacity(0.3),
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
                  color: color.withOpacity(0.2),
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

  Widget _buildQuickActionsSection() {
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
                onTap: () {},
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                title: 'Blast Email',
                icon: Icons.email,
                color: const Color(0xFF06B6D4),
                onTap: () {},
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildQuickActionCard(
                title: 'Promote',
                icon: Icons.share,
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
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: color.withOpacity(0.3),
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

  Widget _buildActiveEventsSection() {
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
            Text(
              'View All',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildActiveEventCard(
          title: 'Neon Nights: Electronic...',
          date: 'Dec 25, 2024 • 8:00 PM',
          venue: 'Blue Lime Arena, LA',
          soldTickets: '850',
          totalTickets: '1000',
          revenue: '\$63,750',
          color: const Color(0xFF06B6D4),
        ),
        SizedBox(height: 16.h),
        _buildActiveEventCard(
          title: 'Future Tech Summit...',
          date: 'Jan 15, 2025 • 9:00 AM',
          venue: 'Convention Center, SF',
          soldTickets: '278',
          totalTickets: '500',
          revenue: 'Free Event',
          color: const Color(0xFF4ADE80),
        ),
        SizedBox(height: 16.h),
        _buildActiveEventCard(
          title: 'Indie Soul Sessions',
          date: 'Jan 8, 2025 • 7:30 PM',
          venue: 'Music Hall, NYC',
          soldTickets: '156',
          totalTickets: '200',
          revenue: '\$7,800',
          color: const Color(0xFFF59E0B),
        ),
      ],
    );
  }

  Widget _buildActiveEventCard({
    required String title,
    required String date,
    required String venue,
    required String soldTickets,
    required String totalTickets,
    required String revenue,
    required Color color,
  }) {
    final double progress = double.parse(soldTickets) / double.parse(totalTickets);
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Event Image Placeholder
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.event,
              color: color,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          
          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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
                  date,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  venue,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11.sp,
                  ),
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
                          revenue,
                          style: TextStyle(
                            color: color,
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
                            color: color,
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
    );
  }
}