import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';

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
      bottomNavigationBar: FloatingPillNavigationBar(
        navigationShell: navigationShell,
        items: const [
          PillNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: 'Home',
          ),
          PillNavItem(
            icon: Icons.event_outlined,
            activeIcon: Icons.event_rounded,
            label: 'Events',
          ),
          PillNavItem(
            icon: Icons.insights_outlined,
            activeIcon: Icons.insights_rounded,
            label: 'Insights',
          ),
          PillNavItem(
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
