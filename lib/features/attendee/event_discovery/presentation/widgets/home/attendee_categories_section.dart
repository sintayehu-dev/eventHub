import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class AttendeeCategoriesSection extends StatelessWidget {
  final Function(EventCategory) onCategoryTap;

  const AttendeeCategoriesSection({
    super.key,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final categories = [
      {
        'name': 'Music',
        'icon': Icons.music_note,
        'category': EventCategory.music
      },
      {
        'name': 'Tech',
        'icon': Icons.computer,
        'category': EventCategory.technology
      },
      {
        'name': 'Sports',
        'icon': Icons.sports_soccer,
        'category': EventCategory.sports
      },
      {'name': 'Arts', 'icon': Icons.palette, 'category': EventCategory.arts},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => onCategoryTap(category['category'] as EventCategory),
              child: Container(
                width: 70.w,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      category['icon'] as IconData,
                      color: colorScheme.primary,
                      size: 24.sp,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      category['name'] as String,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
