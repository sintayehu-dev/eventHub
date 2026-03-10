import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/constants/app_constants.dart';

/// Logo widget with bank name
class RegistrationLogo extends StatelessWidget {
  const RegistrationLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Image.asset(
                AppConstants.gohbetochLogoVertical,
                height: 70.h,
                width: 70.w,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Logo text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GOH BETOCH BANK",
                style: GoogleFonts.outfit(
                  color: colorScheme.onBackground,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                width: 120.w,
                height: 2.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withOpacity(0.5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Bank of the Generation",
                style: GoogleFonts.outfit(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
