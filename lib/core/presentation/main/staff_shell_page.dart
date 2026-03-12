import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StaffShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const StaffShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1A0B2E),
        border: Border(
          top: BorderSide(
            color: const Color(0xFF8B5CF6).withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(index, context),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFF8B5CF6),
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.qr_code_scanner_outlined, 0),
            activeIcon: _buildNavIcon(Icons.qr_code_scanner, 0),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.people_outline, 1),
            activeIcon: _buildNavIcon(Icons.people, 1),
            label: 'Attendees',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Hidden for FAB
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.bar_chart_outlined, 3),
            activeIcon: _buildNavIcon(Icons.bar_chart, 3),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.settings_outlined, 4),
            activeIcon: _buildNavIcon(Icons.settings, 4),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    final isSelected = navigationShell.currentIndex == index;
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: isSelected 
            ? const Color(0xFF8B5CF6).withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        size: 24.sp,
        color: isSelected 
            ? const Color(0xFF8B5CF6)
            : Colors.grey[600],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5CF6).withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () => _onTap(2, context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.emergency,
          color: Colors.white,
          size: 28.sp,
        ),
      ),
    );
  }

  void _onTap(int index, BuildContext context) {
    if (index == 2) {
      // Handle emergency action
      _showEmergencyDialog(context);
      return;
    }
    
    navigationShell.goBranch(
      index > 2 ? index - 1 : index, // Adjust for FAB
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(
              Icons.emergency,
              color: const Color(0xFFEF4444),
              size: 24.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'Emergency Actions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildEmergencyOption(
              icon: Icons.security,
              title: 'Security Alert',
              subtitle: 'Report security incident',
              color: const Color(0xFFEF4444),
              onTap: () {
                Navigator.of(dialogContext).pop();
                // Handle security alert
              },
            ),
            SizedBox(height: 12.h),
            _buildEmergencyOption(
              icon: Icons.medical_services,
              title: 'Medical Emergency',
              subtitle: 'Request medical assistance',
              color: const Color(0xFFF59E0B),
              onTap: () {
                Navigator.of(dialogContext).pop();
                // Handle medical emergency
              },
            ),
            SizedBox(height: 12.h),
            _buildEmergencyOption(
              icon: Icons.block,
              title: 'Block Entry',
              subtitle: 'Temporarily block gate access',
              color: const Color(0xFF6B7280),
              onTap: () {
                Navigator.of(dialogContext).pop();
                // Handle block entry
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}