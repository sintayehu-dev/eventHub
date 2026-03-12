import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              // Header
              _buildHeader(),
              SizedBox(height: 40.h),
              
              // Scanner Frame
              Expanded(
                child: _buildScannerFrame(),
              ),
              
              // Instructions
              _buildInstructions(),
              SizedBox(height: 24.h),
              
              // Manual Entry Button
              _buildManualEntryButton(),
              SizedBox(height: 32.h),
              
              // Quick Actions
              _buildQuickActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24.sp,
        ),
        Column(
          children: [
            Text(
              'ENTRY CONTROL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Neon Nights • Gate A',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
          size: 24.sp,
        ),
      ],
    );
  }

  Widget _buildScannerFrame() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withOpacity(0.3),
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
                  const Color(0xFF1A0B2E).withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          // Corner brackets
          Positioned(
            top: 40.h,
            left: 40.w,
            child: _buildCornerBracket(isTopLeft: true),
          ),
          Positioned(
            top: 40.h,
            right: 40.w,
            child: _buildCornerBracket(isTopRight: true),
          ),
          Positioned(
            bottom: 40.h,
            left: 40.w,
            child: _buildCornerBracket(isBottomLeft: true),
          ),
          Positioned(
            bottom: 40.h,
            right: 40.w,
            child: _buildCornerBracket(isBottomRight: true),
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
                    const Color(0xFF8B5CF6),
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
                color: const Color(0xFF8B5CF6).withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF8B5CF6),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: const Color(0xFF8B5CF6),
                size: 40.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerBracket({
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
            color: const Color(0xFF8B5CF6),
            width: 3,
          ),
          left: BorderSide(
            color: const Color(0xFF8B5CF6),
            width: isTopLeft || isBottomLeft ? 3 : 0,
          ),
          right: BorderSide(
            color: const Color(0xFF8B5CF6),
            width: isTopRight || isBottomRight ? 3 : 0,
          ),
          bottom: BorderSide(
            color: const Color(0xFF8B5CF6),
            width: isBottomLeft || isBottomRight ? 3 : 0,
          ),
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return Column(
      children: [
        Text(
          'Align ticket QR code within frame',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Validating Entry Point Access',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildManualEntryButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard,
            color: Colors.white,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Text(
            'Enter Code Manually',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickActionButton(
          icon: Icons.refresh,
          label: 'Reset',
          onTap: () {},
        ),
        _buildQuickActionButton(
          icon: Icons.info_outline,
          label: 'Support',
          onTap: () {},
        ),
        _buildQuickActionButton(
          icon: Icons.people_outline,
          label: 'Stats',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFF8B5CF6).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.grey[400],
              size: 24.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}