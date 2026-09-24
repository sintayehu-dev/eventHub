import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';

class OrganizerEventsHeader extends StatelessWidget {
  const OrganizerEventsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('My events', style: theme.textTheme.titleMedium),
        GestureDetector(
          onTap: () => context.pushNamed(RouteName.createEventScreen),
          child: Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: scheme.secondary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: scheme.secondary.withValues(alpha: 0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child:
                Icon(Icons.add_rounded, color: scheme.onSecondary, size: 24.sp),
          ),
        ),
      ],
    );
  }
}
