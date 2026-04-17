import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/core/theme/app_colors.dart';

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
    final brightness = theme.brightness;
    
    final categories = [
      {
        'name': 'Music',
        'icon': Icons.music_note,
        'category': EventCategory.music,
        'gradient': [AppColors.primary, AppColors.accentPurple],
      },
      {
        'name': 'Tech',
        'icon': Icons.computer,
        'category': EventCategory.technology,
        'gradient': [AppColors.lightIndigo, AppColors.primaryIndigo],
      },
      {
        'name': 'Sports',
        'icon': Icons.sports_soccer,
        'category': EventCategory.sports,
        'gradient': [AppColors.softGold, AppColors.chartYellow],
      },
      {
        'name': 'Arts',
        'icon': Icons.palette,
        'category': EventCategory.arts,
        'gradient': [AppColors.accentPurple, AppColors.primary],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((category) {
            final gradientColors = category['gradient'] as List<Color>;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GestureDetector(
                  onTap: () =>
                      onCategoryTap(category['category'] as EventCategory),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      gradient: brightness == Brightness.light
                          ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                gradientColors[0].withValues(alpha: 0.15),
                                gradientColors[1].withValues(alpha: 0.1),
                              ],
                            )
                          : LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                gradientColors[0].withValues(alpha: 0.3),
                                gradientColors[1].withValues(alpha: 0.2),
                              ],
                            ),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: brightness == Brightness.light
                            ? gradientColors[0].withValues(alpha: 0.2)
                            : gradientColors[0].withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                      boxShadow: brightness == Brightness.light
                          ? [
                              BoxShadow(
                                color: gradientColors[0].withValues(alpha: 0.1),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: gradientColors,
                            ),
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: gradientColors[0].withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            category['icon'] as IconData,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          category['name'] as String,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
