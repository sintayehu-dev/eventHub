import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrganizerShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const OrganizerShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1A0B2E),
        border: Border(
          top: BorderSide(
            color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
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
            icon: _buildNavIcon(Icons.home_outlined, 0),
            activeIcon: _buildNavIcon(Icons.home, 0),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.event_outlined, 1),
            activeIcon: _buildNavIcon(Icons.event, 1),
            label: 'MY EVENTS',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.analytics_outlined, 2),
            activeIcon: _buildNavIcon(Icons.analytics, 2),
            label: 'ANALYTICS',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.person_outline, 3),
            activeIcon: _buildNavIcon(Icons.person, 3),
            label: 'PROFILE',
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
            ? const Color(0xFF8B5CF6).withValues(alpha: 0.2)
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

  void _onTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}