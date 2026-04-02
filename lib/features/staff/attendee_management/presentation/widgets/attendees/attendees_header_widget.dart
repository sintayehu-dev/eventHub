import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';

class AttendeesHeaderWidget extends StatelessWidget {
  final VoidCallback onRefresh;

  const AttendeesHeaderWidget({
    super.key,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        const AppBackButton(),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            'Attendees',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: onRefresh,
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.refresh,
              color: theme.colorScheme.onPrimary,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}