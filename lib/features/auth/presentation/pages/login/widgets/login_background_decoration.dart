import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Background decorative elements widget
class LoginBackgroundDecoration extends StatelessWidget {
  const LoginBackgroundDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -50,
          child: Container(
            height: 200.h,
            width: 200.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withOpacity(0.05),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: -70,
          child: Container(
            height: 180.h,
            width: 180.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.secondary.withOpacity(0.07),
            ),
          ),
        ),
      ],
    );
  }
} 
