import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendeesScreen extends StatelessWidget {
  const AttendeesScreen({super.key});

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
                    'Attendees',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B5CF6),
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
              SizedBox(height: 24.h),
              
              // Stats Cards
              _buildStatsSection(),
              SizedBox(height: 24.h),
              
              // Filter Tabs
              _buildFilterTabs(),
              SizedBox(height: 24.h),
              
              // Attendees List
              Expanded(
                child: _buildAttendeesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Checked In',
            value: '847',
            color: const Color(0xFF4ADE80),
            icon: Icons.check_circle,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: 'Pending',
            value: '153',
            color: const Color(0xFFF59E0B),
            icon: Icons.pending,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: 'Total',
            value: '1000',
            color: const Color(0xFF8B5CF6),
            icon: Icons.people,
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
  }) {
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
                'All',
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
                'Checked In',
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
                'Pending',
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

  Widget _buildAttendeesList() {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return _buildAttendeeCard(index);
      },
    );
  }

  Widget _buildAttendeeCard(int index) {
    final attendees = [
      {
        'name': 'John Smith',
        'email': 'john.smith@email.com',
        'ticketType': 'VIP',
        'checkInTime': '8:45 PM',
        'status': 'checked_in',
        'gate': 'Gate A',
      },
      {
        'name': 'Sarah Johnson',
        'email': 'sarah.j@email.com',
        'ticketType': 'General',
        'checkInTime': null,
        'status': 'pending',
        'gate': null,
      },
      {
        'name': 'Mike Davis',
        'email': 'mike.davis@email.com',
        'ticketType': 'Premium',
        'checkInTime': '8:32 PM',
        'status': 'checked_in',
        'gate': 'Gate B',
      },
      {
        'name': 'Emily Wilson',
        'email': 'emily.w@email.com',
        'ticketType': 'General',
        'checkInTime': '8:55 PM',
        'status': 'checked_in',
        'gate': 'Gate A',
      },
      {
        'name': 'David Brown',
        'email': 'david.brown@email.com',
        'ticketType': 'VIP',
        'checkInTime': null,
        'status': 'pending',
        'gate': null,
      },
    ];

    final attendee = attendees[index % attendees.length];
    final isCheckedIn = attendee['status'] == 'checked_in';
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isCheckedIn 
              ? const Color(0xFF4ADE80).withOpacity(0.3)
              : const Color(0xFFF59E0B).withOpacity(0.3),
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
              gradient: LinearGradient(
                colors: isCheckedIn 
                    ? [const Color(0xFF4ADE80), const Color(0xFF10B981)]
                    : [const Color(0xFFF59E0B), const Color(0xFFD97706)],
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (attendee['name'] as String).split(' ').map((e) => e[0]).join(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
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
                  attendee['name'] as String,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  attendee['email'] as String,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        attendee['ticketType'] as String,
                        style: TextStyle(
                          color: const Color(0xFF8B5CF6),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isCheckedIn) ...[
                      SizedBox(width: 8.w),
                      Text(
                        '• ${attendee['gate']}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          
          // Status and Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isCheckedIn 
                      ? const Color(0xFF4ADE80).withOpacity(0.2)
                      : const Color(0xFFF59E0B).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isCheckedIn ? Icons.check_circle : Icons.pending,
                      color: isCheckedIn 
                          ? const Color(0xFF4ADE80)
                          : const Color(0xFFF59E0B),
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      isCheckedIn ? 'In' : 'Pending',
                      style: TextStyle(
                        color: isCheckedIn 
                            ? const Color(0xFF4ADE80)
                            : const Color(0xFFF59E0B),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCheckedIn) ...[
                SizedBox(height: 8.h),
                Text(
                  attendee['checkInTime'] as String,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}