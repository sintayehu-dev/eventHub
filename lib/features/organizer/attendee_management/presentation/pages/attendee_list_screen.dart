import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AttendeeListScreen extends StatefulWidget {
  final String eventId;
  
  const AttendeeListScreen({
    super.key,
    required this.eventId,
  });

  @override
  State<AttendeeListScreen> createState() => _AttendeeListScreenState();
}

class _AttendeeListScreenState extends State<AttendeeListScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  // Mock attendee data based on the image
  final List<Map<String, dynamic>> _attendees = [
    {
      'id': '1',
      'name': 'Alex Rivera',
      'purchaseDate': 'Oct 10, 2024',
      'ticketType': 'VIP ACCESS',
      'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'isCheckedIn': true,
      'status': 'checked_in',
    },
    {
      'id': '2',
      'name': 'Samantha Bloom',
      'purchaseDate': 'Oct 15, 2024',
      'ticketType': 'GENERAL ADMISSION',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'isCheckedIn': false,
      'status': 'not_checked_in',
    },
    {
      'id': '3',
      'name': 'Marcus Thorne',
      'purchaseDate': 'Oct 18, 2024',
      'ticketType': 'VIP ACCESS',
      'avatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      'isCheckedIn': true,
      'status': 'checked_in',
    },
    {
      'id': '4',
      'name': 'Elena Rodriguez',
      'purchaseDate': 'Oct 19, 2024',
      'ticketType': 'EARLY BIRD',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'isCheckedIn': false,
      'status': 'not_checked_in',
    },
    {
      'id': '5',
      'name': 'Jordan Lee',
      'purchaseDate': 'Oct 19, 2024',
      'ticketType': 'GENERAL ADMISSION',
      'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
      'isCheckedIn': false,
      'status': 'not_checked_in',
    },
    {
      'id': '6',
      'name': 'Sarah Jenkins',
      'purchaseDate': 'Oct 20, 2024',
      'ticketType': 'VIP ACCESS',
      'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
      'isCheckedIn': true,
      'status': 'checked_in',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final totalTickets = _attendees.length;
    final checkedInCount = _attendees.where((a) => a['isCheckedIn'] == true).length;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
        ),
        title: Text(
          'Attendee List',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: ElevatedButton.icon(
              onPressed: _exportList,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              icon: Icon(
                Icons.download_outlined,
                color: colorScheme.onPrimary,
                size: 16.sp,
              ),
              label: Text(
                'Export List',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildStatsHeader(totalTickets, checkedInCount),
          Expanded(child: _buildAttendeesList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: colorScheme.onSurfaceVariant,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: 'Search by name or email...',
                hintStyle: theme.textTheme.bodyMedium
                    ?.copyWith(color: colorScheme.onSurfaceVariant),
                border: InputBorder.none,
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsHeader(int totalTickets, int checkedInCount) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TOTAL TICKETS',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '1,248',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.w,
            height: 60.h,
            color: colorScheme.outline,
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CHECKED IN',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '842',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendeesList() {
    List<Map<String, dynamic>> filteredAttendees = _attendees.where((attendee) {
      if (_searchController.text.isNotEmpty) {
        final searchTerm = _searchController.text.toLowerCase();
        return attendee['name'].toLowerCase().contains(searchTerm);
      }
      return true;
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(
          20.w, 20.w, 20.w, 100.h), // Added bottom padding for nav bar
      itemCount: filteredAttendees.length,
      itemBuilder: (context, index) {
        final attendee = filteredAttendees[index];
        return _buildAttendeeCard(attendee);
      },
    );
  }

  Widget _buildAttendeeCard(Map<String, dynamic> attendee) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final ticketTypeColor = _getTicketTypeColor(attendee['ticketType']);
    
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          // Avatar with check-in status
          Stack(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF8B5CF6),
                      const Color(0xFF06B6D4),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    attendee['name'].split(' ').map((n) => n[0]).join(''),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (attendee['isCheckedIn'])
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: colorScheme.tertiary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.surfaceContainerHighest,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          
          // Attendee Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendee['name'],
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Purchased: ${attendee['purchaseDate']}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ticketTypeColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: ticketTypeColor.withValues(alpha: 0.5),
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    attendee['ticketType'],
                    style: TextStyle(
                      color: ticketTypeColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Actions Menu
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey[400],
              size: 20.sp,
            ),
            color: const Color(0xFF2A1B3D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
              ),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'view',
                child: Row(
                  children: [
                    Icon(Icons.visibility_outlined, color: Colors.grey[400], size: 16.sp),
                    SizedBox(width: 8.w),
                    Text('View Profile', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'checkin',
                child: Row(
                  children: [
                    Icon(
                      attendee['isCheckedIn'] ? Icons.check_circle : Icons.check_circle_outline,
                      color: attendee['isCheckedIn'] ? const Color(0xFF4ADE80) : Colors.grey[400],
                      size: 16.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      attendee['isCheckedIn'] ? 'Check Out' : 'Check In',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'contact',
                child: Row(
                  children: [
                    Icon(Icons.email_outlined, color: Colors.grey[400], size: 16.sp),
                    SizedBox(width: 8.w),
                    Text('Send Message', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'refund',
                child: Row(
                  children: [
                    Icon(Icons.money_off_outlined, color: Colors.red[400], size: 16.sp),
                    SizedBox(width: 8.w),
                    Text('Issue Refund', style: TextStyle(color: Colors.red[400], fontSize: 12.sp)),
                  ],
                ),
              ),
            ],
            onSelected: (value) => _handleAttendeeAction(value, attendee),
          ),
        ],
      ),
    );
  }

  Color _getTicketTypeColor(String ticketType) {
    switch (ticketType) {
      case 'VIP ACCESS':
        return const Color(0xFF8B5CF6);
      case 'GENERAL ADMISSION':
        return const Color(0xFF06B6D4);
      case 'EARLY BIRD':
        return const Color(0xFF4ADE80);
      default:
        return const Color(0xFF64748B);
    }
  }

  void _exportList() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Export Attendee List',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildExportOption('CSV Format', Icons.table_chart_outlined),
            SizedBox(height: 12.h),
            _buildExportOption('PDF Report', Icons.picture_as_pdf_outlined),
            SizedBox(height: 12.h),
            _buildExportOption('Excel Format', Icons.grid_on_outlined),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExportOption(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Exporting attendee list as $title...'),
            backgroundColor: const Color(0xFF8B5CF6),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A0B2E),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF8B5CF6), size: 20.sp),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAttendeeAction(String action, Map<String, dynamic> attendee) {
    switch (action) {
      case 'view':
        _showAttendeeProfile(attendee);
        break;
      case 'checkin':
        _toggleCheckIn(attendee);
        break;
      case 'contact':
        _sendMessage(attendee);
        break;
      case 'refund':
        _issueRefund(attendee);
        break;
    }
  }

  void _showAttendeeProfile(Map<String, dynamic> attendee) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Attendee Profile',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileRow('Name', attendee['name']),
            _buildProfileRow('Purchase Date', attendee['purchaseDate']),
            _buildProfileRow('Ticket Type', attendee['ticketType']),
            _buildProfileRow('Status', attendee['isCheckedIn'] ? 'Checked In' : 'Not Checked In'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Close',
              style: TextStyle(color: const Color(0xFF8B5CF6), fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleCheckIn(Map<String, dynamic> attendee) {
    setState(() {
      attendee['isCheckedIn'] = !attendee['isCheckedIn'];
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${attendee['name']} ${attendee['isCheckedIn'] ? 'checked in' : 'checked out'} successfully',
        ),
        backgroundColor: attendee['isCheckedIn'] ? const Color(0xFF4ADE80) : const Color(0xFFF59E0B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _sendMessage(Map<String, dynamic> attendee) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening message composer for ${attendee['name']}...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _issueRefund(Map<String, dynamic> attendee) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Issue Refund',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Text(
          'Are you sure you want to issue a refund to ${attendee['name']}? This action cannot be undone.',
          style: TextStyle(color: Colors.grey[300], fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
          ),
          TextButton(
            onPressed: () {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Refund issued to ${attendee['name']}'),
                  backgroundColor: const Color(0xFF4ADE80),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                ),
              );
            },
            child: Text(
              'Issue Refund',
              style: TextStyle(color: Colors.red[400], fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}