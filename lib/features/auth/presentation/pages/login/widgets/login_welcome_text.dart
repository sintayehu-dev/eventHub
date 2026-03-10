import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome text widget
class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.headlineSmall?.fontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
            color: colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Sign in to continue',
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.bodyLarge?.fontSize,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
} 
