import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF374151),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EventHub Terms of Service',
              style: GoogleFonts.poppins(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2937),
              ),
            ),
            
            SizedBox(height: 16.h),
            
            Text(
              'Last updated: ${DateTime.now().toString().split(' ')[0]}',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: const Color(0xFF6B7280),
              ),
            ),
            
            SizedBox(height: 24.h),
            
            _buildSection(
              'Acceptance of Terms',
              'By accessing and using EventHub, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            
            _buildSection(
              'Use License',
              'Permission is granted to temporarily download one copy of EventHub for personal, non-commercial transitory viewing only.',
            ),
            
            _buildSection(
              'User Account',
              'When you create an account with us, you must provide information that is accurate, complete, and current at all times.',
            ),
            
            _buildSection(
              'Event Creation',
              'Users may create events through our platform. You are responsible for the accuracy of event information and compliance with local laws.',
            ),
            
            _buildSection(
              'Privacy Policy',
              'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your information when you use our service.',
            ),
            
            _buildSection(
              'Prohibited Uses',
              'You may not use our service for any unlawful purpose or to solicit others to perform unlawful acts.',
            ),
            
            _buildSection(
              'Termination',
              'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever.',
            ),
            
            _buildSection(
              'Contact Information',
              'If you have any questions about these Terms and Conditions, please contact us at support@eventhub.com',
            ),
            
            SizedBox(height: 32.h),
            
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'By using EventHub, you acknowledge that you have read and understood these terms and conditions.',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: const Color(0xFF374151),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: const Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
