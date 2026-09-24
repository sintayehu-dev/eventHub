import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

class AttendeeHomeHeader extends StatelessWidget {
  const AttendeeHomeHeader({super.key});

  String _firstName() {
    try {
      final name = getIt<UserService>().getCurrentUser()?.displayName?.trim();
      if (name != null && name.isNotEmpty) return name.split(' ').first;
    } catch (_) {
      // Fall through to the generic greeting.
    }
    return 'there';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final name = _firstName();

    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scheme.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: Text(
            name.characters.first.toUpperCase(),
            style: theme.textTheme.titleMedium?.copyWith(
              color: scheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $name',
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 2.h),
              Text(
                "Let's find your next event",
                style: theme.textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
