import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';
import 'package:eventhub/core/widgets/compact_bottom_navigation_bar.dart';

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
        bottomNavigationBar: CompactBottomNavigationBar(
          navigationShell: navigationShell,
          items: const [
            CompactBottomNavigationItem(
              icon: Icons.qr_code_scanner_outlined,
              activeIcon: Icons.qr_code_scanner,
              label: 'Scan',
            ),
            CompactBottomNavigationItem(
              icon: Icons.people_outline,
              activeIcon: Icons.people,
              label: 'Attendees',
            ),
            CompactBottomNavigationItem(
              icon: Icons.bar_chart_outlined,
              activeIcon: Icons.bar_chart,
              label: 'Reports',
            ),
            CompactBottomNavigationItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}