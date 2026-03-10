import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationFooter extends StatelessWidget {
  const RegistrationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      children: [
        Divider(
          color: colorScheme.outlineVariant,
          thickness: 1,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFooterItem(
              context: context,
              title: 'SWIFT CODE',
              value: 'GOBTETAA',
            ),
            Container(
              height: 24.h,
              width: 1,
              color: colorScheme.outlineVariant,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            _buildFooterItem(
              context: context,
              title: 'CUSTOMER SERVICE',
              value: '+251-116-687967',
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          "© 2024 Goh Betoch Bank. All rights reserved.",
          style: GoogleFonts.outfit(
            fontSize: 10.sp,
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
  
  Widget _buildFooterItem({required BuildContext context, required String title, required String value}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.bodySmall?.fontSize,
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: theme.textTheme.bodySmall?.fontSize,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
