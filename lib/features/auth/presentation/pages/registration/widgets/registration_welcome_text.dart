import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Welcome text widget
class RegistrationWelcomeText extends StatelessWidget {
  const RegistrationWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create an Account',
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.headlineSmall?.fontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
            color: colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Sign up to continue',
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.bodyLarge?.fontSize,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
