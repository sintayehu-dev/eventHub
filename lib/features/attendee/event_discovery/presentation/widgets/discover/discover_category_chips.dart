import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class DiscoverCategoryChips extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const DiscoverCategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final categories = [
      {'name': 'All', 'category': null},
      {'name': 'Music', 'category': EventCategory.music},
      {'name': 'Tech', 'category': EventCategory.technology},
      {'name': 'Arts', 'category': EventCategory.arts},
      {'name': 'Sports', 'category': EventCategory.sports},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: categories.map((category) {
          final name = category['name'] as String;
          final isSelected = name == selectedCategory;

          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () {
                onCategorySelected(name);

                if (category['category'] == null) {
                  context.read<EventDiscoveryBloc>().add(
                        const EventDiscoveryEvent.loadUpcomingEvents(limit: 20),
                      );
                } else {
                  context.read<EventDiscoveryBloc>().add(
                        EventDiscoveryEvent.loadEventsByCategory(
                          category: category['category'] as EventCategory,
                          limit: 20,
                        ),
                      );
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? scheme.primary : scheme.surface,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getCategoryIcon(name),
                      color: isSelected ? scheme.onPrimary : scheme.primary,
                      size: 16.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      name,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color:
                            isSelected ? scheme.onPrimary : scheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Music':
        return Icons.music_note_rounded;
      case 'Tech':
        return Icons.computer_rounded;
      case 'Arts':
        return Icons.palette_rounded;
      case 'Sports':
        return Icons.sports_soccer_rounded;
      default:
        return Icons.grid_view_rounded;
    }
  }
}
