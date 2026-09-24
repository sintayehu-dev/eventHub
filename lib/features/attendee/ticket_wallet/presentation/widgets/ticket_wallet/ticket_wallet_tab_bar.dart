import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketWalletTabBar extends StatelessWidget {
  final TabController controller;

  const TicketWalletTabBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: TabBar(
        controller: controller,
        dividerColor: Colors.transparent,
        splashBorderRadius: BorderRadius.circular(22.r),
        indicator: BoxDecoration(
          color: scheme.primary,
          borderRadius: BorderRadius.circular(22.r),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: scheme.onPrimary,
        unselectedLabelColor: scheme.onSurfaceVariant,
        labelStyle: theme.textTheme.labelLarge,
        unselectedLabelStyle: theme.textTheme.labelLarge,
        tabs: const [
          Tab(text: 'Upcoming', height: 40),
          Tab(text: 'Past', height: 40),
          Tab(text: 'All', height: 40),
        ],
      ),
    );
  }
}
