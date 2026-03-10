import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/router/route_name.dart';

/// Sign up option widget
class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.bodyMedium?.fontSize,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(RouteName.registrationScreen);
          },
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
            minimumSize: Size(0, 30.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Sign Up',
            style: GoogleFonts.outfit(
              fontSize: theme.textTheme.bodyMedium?.fontSize,
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
} 
