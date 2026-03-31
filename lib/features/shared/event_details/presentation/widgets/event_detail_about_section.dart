import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailAboutSection extends StatelessWidget {
  final String description;

  const EventDetailAboutSection({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Event',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 15.sp,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
