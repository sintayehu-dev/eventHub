import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/debug_ticket_helper.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              // Header
              _buildHeader(theme),
              SizedBox(height: 40.h),
              
              // Scanner Frame
              Expanded(
                child: _buildScannerFrame(theme),
              ),
              
              // Instructions
              _buildInstructions(theme),
              SizedBox(height: 24.h),
              
              // Start Scanning Button
              _buildStartScanningButton(context, theme),
              SizedBox(height: 32.h),
              
              // Quick Actions
              _buildQuickActions(context, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back,
          color: theme.colorScheme.onSurface,
          size: 24.sp,
        ),
        Column(
          children: [
            Text(
              'ENTRY CONTROL',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Event Scanner • Gate A',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Icon(
          Icons.more_vert,
          color: theme.colorScheme.onSurface,
          size: 24.sp,
        ),
      ],
    );
  }

  Widget _buildScannerFrame(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          // Scanner overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          // Corner brackets
          Positioned(
            top: 40.h,
            left: 40.w,
            child: _buildCornerBracket(theme, isTopLeft: true),
          ),
          Positioned(
            top: 40.h,
            right: 40.w,
            child: _buildCornerBracket(theme, isTopRight: true),
          ),
          Positioned(
            bottom: 40.h,
            left: 40.w,
            child: _buildCornerBracket(theme, isBottomLeft: true),
          ),
          Positioned(
            bottom: 40.h,
            right: 40.w,
            child: _buildCornerBracket(theme, isBottomRight: true),
          ),
          
          // Scanning line animation
          Center(
            child: Container(
              width: 200.w,
              height: 2.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    theme.colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Center icon
          Center(
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: theme.colorScheme.primary,
                size: 40.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerBracket(
    ThemeData theme, {
    bool isTopLeft = false,
    bool isTopRight = false,
    bool isBottomLeft = false,
    bool isBottomRight = false,
  }) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary,
            width: 3,
          ),
          left: BorderSide(
            color: theme.colorScheme.primary,
            width: isTopLeft || isBottomLeft ? 3 : 0,
          ),
          right: BorderSide(
            color: theme.colorScheme.primary,
            width: isTopRight || isBottomRight ? 3 : 0,
          ),
          bottom: BorderSide(
            color: theme.colorScheme.primary,
            width: isBottomLeft || isBottomRight ? 3 : 0,
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Align ticket QR code within frame',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Tap "Start Scanning" to begin validation',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildStartScanningButton(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _startScanning(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'Start Scanning',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickActionButton(
          icon: Icons.refresh,
          label: 'Reset',
          onTap: () {},
          theme: theme,
        ),
        _buildQuickActionButton(
          icon: Icons.add_circle,
          label: 'Test Ticket',
          onTap: () => _createTestTicket(),
          theme: theme,
        ),
        _buildQuickActionButton(
          icon: Icons.people_outline,
          label: 'Attendees',
          onTap: () => _navigateToAttendees(context),
          theme: theme,
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required ThemeData theme,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              size: 24.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startScanning(BuildContext context) {
    // Use the actual event ID from your database
    const eventId = '1774346204603_176467';
    const eventTitle = 'gg'; // Your event title from the database

    // Navigate to QR scanner screen
    context.push('/staff/qr-scanner?eventId=$eventId&eventTitle=$eventTitle');
  }

  void _createTestTicket() async {
    try {
      await DebugTicketHelper.createTestTicket();
      print('✅ Test ticket created! You can now scan the QR code.');
    } catch (e) {
      print('❌ Error creating test ticket: $e');
    }
  }

  void _navigateToAttendees(BuildContext context) {
    // Use the actual event ID and a sample staff ID
    const eventId = '1774346204603_176467';
    const staffId =
        'staff123'; // You can get this from auth state in a real app

    print(
        'Navigating to attendees with eventId: "$eventId", staffId: "$staffId"'); // Debug log

    // Use path parameters instead of query parameters
    final path = '/staff/attendees/$eventId/$staffId';
    print('Navigation path: $path'); // Debug log
    context.go(path);
  }
}