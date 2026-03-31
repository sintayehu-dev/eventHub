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
    final colorScheme = theme.colorScheme;
    
    final categories = [
      {'name': 'All', 'category': null},
      {'name': 'Music', 'category': EventCategory.music},
      {'name': 'Tech', 'category': EventCategory.technology},
      {'name': 'Arts', 'category': EventCategory.arts},
      {'name': 'Sports', 'category': EventCategory.sports},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            final name = category['name'] as String;
            final isSelected = name == selectedCategory;
            
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
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
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSelected ? colorScheme.primary : colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isSelected 
                          ? colorScheme.primary 
                          : colorScheme.primary.withValues(alpha: 0.1),
                      width: 1,
                    ),
                    boxShadow: isSelected ? [
                      BoxShadow(
                        color: colorScheme.primary.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ] : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getCategoryIcon(name),
                        color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        name,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
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
