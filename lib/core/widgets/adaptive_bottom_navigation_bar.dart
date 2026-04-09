import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class AdaptiveBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<AdaptiveBottomNavigationItem> items;

  const AdaptiveBottomNavigationBar({
    super.key,
    required this.navigationShell,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final bottomPadding = mediaQuery.padding.bottom;
    
    // Calculate adaptive dimensions based on screen size and item count
    final adaptiveDimensions = _calculateAdaptiveDimensions(screenWidth, items.length, bottomPadding);
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: adaptiveDimensions.totalHeight,
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              border: Border(
                top: BorderSide(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.15),
                  blurRadius: 25,
                  offset: const Offset(0, -8),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: adaptiveDimensions.horizontalPadding,
                    vertical: adaptiveDimensions.verticalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: items.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final isSelected = navigationShell.currentIndex == index;
                      
                      return Expanded(
                        child: _buildNavItem(
                          context,
                          item,
                          index,
                          isSelected,
                          adaptiveDimensions,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AdaptiveDimensions _calculateAdaptiveDimensions(double screenWidth, int itemCount, double bottomPadding) {
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 400;
    final hasManySections = itemCount > 4;
    
    // Base dimensions - more conservative approach
    double iconSize, fontSize, baseHeight, horizontalPadding, verticalPadding;
    
    if (isSmallScreen) {
      iconSize = hasManySections ? 14.sp : 16.sp; // Reduced further
      fontSize = hasManySections ? 7.sp : 8.sp;   // Reduced further
      baseHeight = 58.h; // Reduced from 65.h
      horizontalPadding = 2.w;
      verticalPadding = 4.h;
    } else if (isMediumScreen) {
      iconSize = hasManySections ? 16.sp : 18.sp;
      fontSize = hasManySections ? 8.sp : 9.sp;
      baseHeight = 62.h; // Reduced from 70.h
      horizontalPadding = 4.w;
      verticalPadding = 5.h;
    } else {
      iconSize = hasManySections ? 18.sp : 20.sp;
      fontSize = hasManySections ? 9.sp : 10.sp;
      baseHeight = 66.h; // Reduced from 75.h
      horizontalPadding = 6.w;
      verticalPadding = 6.h;
    }
    
    // Minimal safe area padding
    final totalHeight = baseHeight + (bottomPadding > 0 ? bottomPadding * 0.2 : 0);
    
    return AdaptiveDimensions(
      iconSize: iconSize,
      fontSize: fontSize,
      totalHeight: totalHeight,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      maxTextWidth: (screenWidth - (horizontalPadding * 2)) / itemCount - 8.w, // Reduced margin
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    AdaptiveBottomNavigationItem item,
    int index,
    bool isSelected,
    AdaptiveDimensions dimensions,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return InkWell(
      onTap: () => _onTap(index, context),
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with badge support
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(2.w), // Minimal padding
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? colorScheme.primary.withValues(alpha: 0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(
                    isSelected ? item.activeIcon : item.icon,
                    size: dimensions.iconSize,
                    color: isSelected 
                        ? colorScheme.primary
                        : colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                // Badge
                if (item.badge != null)
                  Positioned(
                    right: -1,
                    top: -1,
                    child: item.badge!,
                  ),
              ],
            ),
            
            SizedBox(height: 2.h), // Minimal spacing
            
            // Label with proper constraints
            SizedBox(
              width: dimensions.maxTextWidth,
              child: Text(
                item.label,
                style: TextStyle(
                  fontSize: dimensions.fontSize,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected 
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.7),
                  height: 0.9, // Very tight line height
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class AdaptiveDimensions {
  final double iconSize;
  final double fontSize;
  final double totalHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double maxTextWidth;

  const AdaptiveDimensions({
    required this.iconSize,
    required this.fontSize,
    required this.totalHeight,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.maxTextWidth,
  });
}

class AdaptiveBottomNavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Widget? badge;

  const AdaptiveBottomNavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.badge,
  });
}

class AdaptiveBadge extends StatelessWidget {
  final String? text;
  final bool showDot;
  final Color? backgroundColor;
  final Color? textColor;

  const AdaptiveBadge({
    super.key,
    this.text,
    this.showDot = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    if (showDot && (text == null || text!.isEmpty)) {
      return Container(
        width: 5.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.error,
          shape: BoxShape.circle,
          border: Border.all(
            color: colorScheme.surface,
            width: 0.5,
          ),
        ),
      );
    }
    
    if (text == null || text!.isEmpty) {
      return const SizedBox.shrink();
    }
    
    final isSmallScreen = MediaQuery.of(context).size.width < 360;
    final badgeSize = isSmallScreen ? 10.w : 12.w; // Reduced size
    final fontSize = isSmallScreen ? 7.sp : 8.sp;   // Reduced font
    
    return Container(
      constraints: BoxConstraints(
        minWidth: badgeSize,
        minHeight: badgeSize,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: text!.length > 1 ? 2.w : 0,
        vertical: 0.5.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.error,
        borderRadius: BorderRadius.circular(badgeSize / 2),
        border: Border.all(
          color: colorScheme.surface,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            color: textColor ?? colorScheme.onError,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            height: 0.9,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}