import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';

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
      bottomNavigationBar: FloatingPillNavigationBar(
        navigationShell: navigationShell,
        items: const [
          PillNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: 'Home',
          ),
          PillNavItem(
            icon: Icons.search_rounded,
            activeIcon: Icons.search_rounded,
            label: 'Explore',
          ),
          PillNavItem(
            icon: Icons.confirmation_number_outlined,
            activeIcon: Icons.confirmation_number_rounded,
            label: 'Tickets',
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
