import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EventAttendeesScreen extends StatefulWidget {
  final String eventId;
  
  const EventAttendeesScreen({
    super.key,
    required this.eventId,
  });

  @override
  State<EventAttendeesScreen> createState() => _EventAttendeesScreenState();
}

class _EventAttendeesScreenState extends State<EventAttendeesScreen> {
  String _selectedFilter = 'All';
  final TextEditingController _searchController = TextEditingController();
  
  // Mock attendee data
  final List<Map<String, dynamic>> _attendees = [
    {
      'id': '1',
      'name': 'Sarah Johnson',
      'email': 'sarah.johnson@email.com',
      'ticketType': 'VIP',
      'purchaseDate': '2024-03-08',
      'status': 'Confirmed',
      'avatar': 'SJ',
      'phone': '+1 (555) 123-4567',
    },
    {
      'id': '2',
      'name': 'Michael Chen',
      'email': 'michael.chen@email.com',
      'ticketType': 'General',
      'purchaseDate': '2024-03-07',
      'status': 'Confirmed',
      'avatar': 'MC',
      'phone': '+1 (555) 987-6543',
    },
    {
      'id': '3',
      'name': 'Emily Rodriguez',
      'email': 'emily.rodriguez@email.com',
      'ticketType': 'Early Bird',
      'purchaseDate': '2024-03-06',
      'status': 'Pending',
      'avatar': 'ER',
      'phone': '+1 (555) 456-7890',
    },
    {
      'id': '4',
      'name': 'David Thompson',
      'email': 'david.thompson@email.com',
      'ticketType': 'VIP',
      'purchaseDate': '2024-03-05',
      'status': 'Confirmed',
      'avatar': 'DT',
      'phone': '+1 (555) 321-0987',
    },
    {
      'id': '5',
      'name': 'Lisa Wang',
      'email': 'lisa.wang@email.com',
      'ticketType': 'General',
      'purchaseDate': '2024-03-04',
      'status': 'Confirmed',
      'avatar': 'LW',
      'phone': '+1 (555) 654-3210',
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
          'Event Attendees',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _exportAttendeeList,
            icon: Icon(Icons.download_outlined, color: colorScheme.onSurface),
          ),
          IconButton(
            onPressed: _showMoreOptions,
            icon: Icon(Icons.more_vert, color: colorScheme.onSurface),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildSearchAndFilter(),
          Expanded(child: _buildAttendeesList()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final confirmedCount = _attendees.where((a) => a['status'] == 'Confirmed').length;
    final pendingCount = _attendees.where((a) => a['status'] == 'Pending').length;
    
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withValues(alpha: 0.2),
            colorScheme.tertiary.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Neon Pulse Electronic Night',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF4ADE80),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'Active',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Total Tickets',
                  value: '${_attendees.length}',
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildStatCard(
                  title: 'Confirmed',
                  value: '$confirmedCount',
                  color: colorScheme.tertiary,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildStatCard(
                  title: 'Pending',
                  value: '$pendingCount',
                  color: colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Search Bar
          Container(
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
                      hintText: 'Search attendees...',
                      hintStyle: theme.textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.onSurfaceVariant),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All'),
                SizedBox(width: 8.w),
                _buildFilterChip('Confirmed'),
                SizedBox(width: 8.w),
                _buildFilterChip('Pending'),
                SizedBox(width: 8.w),
                _buildFilterChip('VIP'),
                SizedBox(width: 8.w),
                _buildFilterChip('General'),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF8B5CF6).withValues(alpha: 0.2)
              : const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF8B5CF6)
                : const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey[400],
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildAttendeesList() {
    List<Map<String, dynamic>> filteredAttendees = _attendees.where((attendee) {
      // Search filter
      if (_searchController.text.isNotEmpty) {
        final searchTerm = _searchController.text.toLowerCase();
        if (!attendee['name'].toLowerCase().contains(searchTerm) &&
            !attendee['email'].toLowerCase().contains(searchTerm)) {
          return false;
        }
      }
      
      // Status/Type filter
      if (_selectedFilter != 'All') {
        if (_selectedFilter == 'Confirmed' || _selectedFilter == 'Pending') {
          return attendee['status'] == _selectedFilter;
        } else {
          return attendee['ticketType'] == _selectedFilter;
        }
      }
      
      return true;
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: filteredAttendees.length,
      itemBuilder: (context, index) {
        final attendee = filteredAttendees[index];
        return _buildAttendeeCard(attendee);
      },
    );
  }

  Widget _buildAttendeeCard(Map<String, dynamic> attendee) {
    final statusColor = attendee['status'] == 'Confirmed'
        ? const Color(0xFF4ADE80)
        : const Color(0xFFF59E0B);
    
    final ticketTypeColor = attendee['ticketType'] == 'VIP'
        ? const Color(0xFF8B5CF6)
        : attendee['ticketType'] == 'Early Bird'
            ? const Color(0xFF06B6D4)
            : const Color(0xFF64748B);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF8B5CF6),
                      const Color(0xFF06B6D4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    attendee['avatar'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              
              // Attendee Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            attendee['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: statusColor, width: 0.5),
                          ),
                          child: Text(
                            attendee['status'],
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      attendee['email'],
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: ticketTypeColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            attendee['ticketType'],
                            style: TextStyle(
                              color: ticketTypeColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Purchased: ${attendee['purchaseDate']}',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Actions
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
                        Text('View Details', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'contact',
                    child: Row(
                      children: [
                        Icon(Icons.email_outlined, color: Colors.grey[400], size: 16.sp),
                        SizedBox(width: 8.w),
                        Text('Contact', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
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
        ],
      ),
    );
  }

  void _exportAttendeeList() {
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

  void _showMoreOptions() {
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
              'Send Bulk Email',
              Icons.email_outlined,
              () => _sendBulkEmail(),
            ),
            _buildBottomSheetOption(
              'Check-in All',
              Icons.check_circle_outlined,
              () => _checkInAll(),
            ),
            _buildBottomSheetOption(
              'Event Statistics',
              Icons.analytics_outlined,
              () => _showEventStats(),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetOption(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        context.pop();
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
            Icon(icon, color: const Color(0xFF8B5CF6), size: 20.sp),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAttendeeAction(String action, Map<String, dynamic> attendee) {
    switch (action) {
      case 'view':
        _showAttendeeDetails(attendee);
        break;
      case 'contact':
        _contactAttendee(attendee);
        break;
      case 'refund':
        _issueRefund(attendee);
        break;
    }
  }

  void _showAttendeeDetails(Map<String, dynamic> attendee) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Attendee Details',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Name', attendee['name']),
            _buildDetailRow('Email', attendee['email']),
            _buildDetailRow('Phone', attendee['phone']),
            _buildDetailRow('Ticket Type', attendee['ticketType']),
            _buildDetailRow('Purchase Date', attendee['purchaseDate']),
            _buildDetailRow('Status', attendee['status']),
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

  Widget _buildDetailRow(String label, String value) {
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

  void _contactAttendee(Map<String, dynamic> attendee) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening email to ${attendee['name']}...'),
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

  void _sendBulkEmail() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Opening bulk email composer...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _checkInAll() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Checking in all confirmed attendees...'),
        backgroundColor: const Color(0xFF4ADE80),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _showEventStats() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Opening event statistics...'),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}