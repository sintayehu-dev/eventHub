import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class PillNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const PillNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

/// Floating dark pill navigation. The selected destination expands into an
/// orange capsule with its label; the rest stay as quiet icons.
class FloatingPillNavigationBar extends StatelessWidget {
  const FloatingPillNavigationBar({
    super.key,
    required this.navigationShell,
    required this.items,
  });

  final StatefulNavigationShell navigationShell;
  final List<PillNavItem> items;

  /// Space a screen should reserve at its bottom so content clears the bar.
  static double clearance(BuildContext context) =>
      MediaQuery.of(context).padding.bottom + 96.h;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, bottom > 0 ? bottom : 16.h),
      child: Container(
        height: 68.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(34.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withValues(alpha: 0.35),
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: [
            for (var i = 0; i < items.length; i++)
              _NavButton(
                item: items[i],
                selected: navigationShell.currentIndex == i,
                onTap: () {
                  if (i != navigationShell.currentIndex) {
                    HapticFeedback.selectionClick();
                  }
                  navigationShell.goBranch(
                    i,
                    initialLocation: i == navigationShell.currentIndex,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final PillNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      flex: selected ? 2 : 1,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: selected ? 16.w : 12.w),
            decoration: BoxDecoration(
              color: selected ? AppColors.accent : Colors.transparent,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  selected ? item.activeIcon : item.icon,
                  size: 22.sp,
                  color: selected
                      ? AppColors.primaryDark
                      : AppColors.white.withValues(alpha: 0.6),
                ),
                if (selected) ...[
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
