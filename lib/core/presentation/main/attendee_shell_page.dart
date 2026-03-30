import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class AttendeeShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AttendeeShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.15),
                  blurRadius: 25,
                  offset: const Offset(0, -8),
                ),
              ],
            ),
            child: SizedBox(
              height: 70.h,
              child: BottomNavigationBar(
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => _onTap(index, context),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: colorScheme.primary,
                unselectedItemColor:
                    colorScheme.onSurface.withValues(alpha: 0.6),
                selectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.home_outlined, 0, context),
                    activeIcon: _buildNavIcon(Icons.home, 0, context),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.search_outlined, 1, context),
                    activeIcon: _buildNavIcon(Icons.search, 1, context),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildTicketsIcon(2, context),
                    activeIcon: _buildTicketsIcon(2, context),
                    label: 'Tickets',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.person_outline, 3, context),
                    activeIcon: _buildNavIcon(Icons.person, 3, context),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index, BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = navigationShell.currentIndex == index;
    
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: isSelected 
            ? colorScheme.primary.withValues(alpha: 0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(
        icon,
        size: 20.sp,
        color: isSelected 
            ? colorScheme.primary
            : colorScheme.onSurface.withValues(alpha: 0.6),
      ),
    );
  }

  Widget _buildTicketsIcon(int index, BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = navigationShell.currentIndex == index;
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: isSelected 
                ? colorScheme.primary.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            isSelected ? Icons.confirmation_number : Icons.confirmation_number_outlined,
            size: 20.sp,
            color: isSelected 
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        // Notification badge
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            width: 16.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: colorScheme.error,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: colorScheme.surface,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                '2',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onError,
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