import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AttendeeShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AttendeeShellPage({
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.search_outlined, 1),
            activeIcon: _buildNavIcon(Icons.search, 1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _buildTicketsIcon(2),
            activeIcon: _buildTicketsIcon(2),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.person_outline, 3),
            activeIcon: _buildNavIcon(Icons.person, 3),
            label: 'Profile',
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

  Widget _buildTicketsIcon(int index) {
    final isSelected = navigationShell.currentIndex == index;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: isSelected 
                ? const Color(0xFF8B5CF6).withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            isSelected ? Icons.confirmation_number : Icons.confirmation_number_outlined,
            size: 24.sp,
            color: isSelected 
                ? const Color(0xFF8B5CF6)
                : Colors.grey[600],
          ),
        ),
        // Notification badge
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: const Color(0xFFEF4444),
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(
                color: const Color(0xFF1A0B2E),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}