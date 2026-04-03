import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';

class StaffShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const StaffShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser()!;

    return BlocProvider(
      create: (context) => getIt<StaffEventAssignmentBloc>()
        ..add(StaffEventAssignmentEvent.loadStaffEvents(
            staffId: currentUser.uid)),
      child: Scaffold(
        extendBody: true,
        body: navigationShell,
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            border: Border(
              top: BorderSide(
                color: colorScheme.primary.withValues(alpha: 0.2),
                width: 1,
              ),
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
            height: 60.h,
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => _onTap(index, context),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
              selectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              items: [
                BottomNavigationBarItem(
                  icon:
                      _buildNavIcon(Icons.qr_code_scanner_outlined, 0, context),
                  activeIcon: _buildNavIcon(Icons.qr_code_scanner, 0, context),
                  label: 'Scan',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(Icons.people_outline, 1, context),
                  activeIcon: _buildNavIcon(Icons.people, 1, context),
                  label: 'Attendees',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon(Icons.bar_chart_outlined, 2, context),
                  activeIcon: _buildNavIcon(Icons.bar_chart, 2, context),
                  label: 'Reports',
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

  void _onTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}