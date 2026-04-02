import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerFrameWidget extends StatelessWidget {
  const ScannerFrameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          // Scanner overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          // Corner brackets
          Positioned(
            top: 40.h,
            left: 40.w,
            child: _buildCornerBracket(theme, isTopLeft: true),
          ),
          Positioned(
            top: 40.h,
            right: 40.w,
            child: _buildCornerBracket(theme, isTopRight: true),
          ),
          Positioned(
            bottom: 40.h,
            left: 40.w,
            child: _buildCornerBracket(theme, isBottomLeft: true),
          ),
          Positioned(
            bottom: 40.h,
            right: 40.w,
            child: _buildCornerBracket(theme, isBottomRight: true),
          ),
          
          // Scanning line animation
          Center(
            child: Container(
              width: 200.w,
              height: 2.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    theme.colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Center icon
          Center(
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: theme.colorScheme.primary,
                size: 40.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerBracket(
    ThemeData theme, {
    bool isTopLeft = false,
    bool isTopRight = false,
    bool isBottomLeft = false,
    bool isBottomRight = false,
  }) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary,
            width: 3,
          ),
          left: BorderSide(
            color: theme.colorScheme.primary,
            width: isTopLeft || isBottomLeft ? 3 : 0,
          ),
          right: BorderSide(
            color: theme.colorScheme.primary,
            width: isTopRight || isBottomRight ? 3 : 0,
          ),
          bottom: BorderSide(
            color: theme.colorScheme.primary,
            width: isBottomLeft || isBottomRight ? 3 : 0,
          ),
        ),
      ),
    );
  }
}