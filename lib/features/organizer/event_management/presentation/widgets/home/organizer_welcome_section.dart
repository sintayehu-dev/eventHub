import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizerWelcomeSection extends StatelessWidget {
  final String organizerName;

  const OrganizerWelcomeSection({
    super.key,
    required this.organizerName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstName = organizerName.trim().split(' ').first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello, $firstName', style: theme.textTheme.bodyMedium),
        SizedBox(height: 4.h),
        Text('Your dashboard', style: theme.textTheme.headlineMedium),
      ],
    );
  }
}
