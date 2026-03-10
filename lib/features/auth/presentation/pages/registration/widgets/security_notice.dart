import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityNotice extends StatelessWidget {
  const SecurityNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w, 
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.security_outlined,
            size: 18.sp,
            color: colorScheme.onSurfaceVariant,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'Secure banking with end-to-end encryption',
              style: GoogleFonts.outfit(
                fontSize: theme.textTheme.bodySmall?.fontSize,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
