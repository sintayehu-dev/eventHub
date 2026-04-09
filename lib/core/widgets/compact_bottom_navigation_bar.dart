import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class CompactBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<CompactBottomNavigationItem> items;

  const CompactBottomNavigationBar({
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
    
    // Calculate if we need compact mode
    final isCompactMode = screenWidth < 380 || items.length > 4;
    
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
              child: SizedBox(
                height: isCompactMode ? 56.h : 60.h,
                child: BottomNavigationBar(
                  currentIndex: navigationShell.currentIndex,
                  onTap: (index) => _onTap(index, context),
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: colorScheme.primary,
                  unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
                  selectedLabelStyle: TextStyle(
                    fontSize: isCompactMode ? 9.sp : 10.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: isCompactMode ? 9.sp : 10.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                  ),
                  selectedFontSize: isCompactMode ? 9.sp : 10.sp,
                  unselectedFontSize: isCompactMode ? 9.sp : 10.sp,
                  iconSize: isCompactMode ? 18.sp : 20.sp,
                  items: items.map((item) => _buildBottomNavigationBarItem(
                    item,
                    colorScheme,
                    isCompactMode,
                  )).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    CompactBottomNavigationItem item,
    ColorScheme colorScheme,
    bool isCompactMode,
  ) {
    Widget iconWidget = Icon(
      item.icon,
      size: isCompactMode ? 18.sp : 20.sp,
    );
    
    Widget activeIconWidget = Icon(
      item.activeIcon,
      size: isCompactMode ? 18.sp : 20.sp,
    );

    // Add badge if present
    if (item.badge != null) {
      iconWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          iconWidget,
          Positioned(
            right: -6,
            top: -6,
            child: item.badge!,
          ),
        ],
      );
      
      activeIconWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          activeIconWidget,
          Positioned(
            right: -6,
            top: -6,
            child: item.badge!,
          ),
        ],
      );
    }

    return BottomNavigationBarItem(
      icon: iconWidget,
      activeIcon: activeIconWidget,
      label: item.label,
      tooltip: item.label, // Helps with accessibility
    );
  }

  void _onTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class CompactBottomNavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Widget? badge;

  const CompactBottomNavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.badge,
  });
}

class CompactBadge extends StatelessWidget {
  final String? text;
  final bool showDot;
  final Color? backgroundColor;
  final Color? textColor;

  const CompactBadge({
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
        width: 6.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.error,
          shape: BoxShape.circle,
        ),
      );
    }
    
    if (text == null || text!.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Container(
      constraints: BoxConstraints(
        minWidth: 12.w,
        minHeight: 12.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: text!.length > 1 ? 3.w : 0,
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.error,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            color: textColor ?? colorScheme.onError,
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}