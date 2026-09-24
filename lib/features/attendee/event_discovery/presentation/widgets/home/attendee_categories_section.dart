import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/section_header.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class AttendeeCategoriesSection extends StatelessWidget {
  final Function(EventCategory) onCategoryTap;

  const AttendeeCategoriesSection({
    super.key,
    required this.onCategoryTap,
  });

  static const _categories = [
    (
      name: 'Music',
      icon: Icons.music_note_rounded,
      category: EventCategory.music,
      tint: AppColors.peach,
    ),
    (
      name: 'Tech',
      icon: Icons.computer_rounded,
      category: EventCategory.technology,
      tint: AppColors.sky,
    ),
    (
      name: 'Sports',
      icon: Icons.sports_soccer_rounded,
      category: EventCategory.sports,
      tint: AppColors.mint,
    ),
    (
      name: 'Arts',
      icon: Icons.palette_rounded,
      category: EventCategory.arts,
      tint: AppColors.peachDeep,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Categories'),
        SizedBox(height: 14.h),
        Row(
          children: [
            for (final c in _categories)
              Expanded(
                child: GestureDetector(
                  onTap: () => onCategoryTap(c.category),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                          color: c.tint,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Icon(c.icon,
                            color: AppColors.primaryDark, size: 28.sp),
                      ),
                      SizedBox(height: 8.h),
                      Text(c.name, style: theme.textTheme.labelLarge),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
