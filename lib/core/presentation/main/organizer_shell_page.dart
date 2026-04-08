import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/compact_bottom_navigation_bar.dart';

class OrganizerShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const OrganizerShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: CompactBottomNavigationBar(
        navigationShell: navigationShell,
        items: const [
          CompactBottomNavigationItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
          ),
          CompactBottomNavigationItem(
            icon: Icons.event_outlined,
            activeIcon: Icons.event,
            label: 'Events',
          ),
          CompactBottomNavigationItem(
            icon: Icons.analytics_outlined,
            activeIcon: Icons.analytics,
            label: 'Analytics',
          ),
          CompactBottomNavigationItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}