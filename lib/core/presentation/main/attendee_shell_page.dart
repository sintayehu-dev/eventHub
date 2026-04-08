import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/compact_bottom_navigation_bar.dart';

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
      bottomNavigationBar: CompactBottomNavigationBar(
        navigationShell: navigationShell,
        items: [
          const CompactBottomNavigationItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
          ),
          const CompactBottomNavigationItem(
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
            label: 'Search',
          ),
          CompactBottomNavigationItem(
            icon: Icons.confirmation_number_outlined,
            activeIcon: Icons.confirmation_number,
            label: 'Tickets',
            badge: CompactBadge(
              text: '2',
            ),
          ),
          const CompactBottomNavigationItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}