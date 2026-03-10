import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.outfit(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkIndigo,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.darkIndigo,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: GoogleFonts.outfit(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.darkIndigo,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Last Updated: ${DateTime.now().toString().substring(0, 10)}',
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                color: AppColors.lightIndigo,
              ),
            ),
            SizedBox(height: 24.h),
            
            _buildSection(
              title: '1. Introduction',
              content: 'Welcome to EventHub, your comprehensive event management platform. These Terms and Conditions govern your use of our application and services. By using EventHub, you agree to these terms.',
            ),
            
            _buildSection(
              title: '2. Definitions',
              content: '"App" refers to EventHub event management application.\n"Services" refers to the event creation, management, and coordination features provided.\n"User," "You," and "Your" refer to the individual using the App.\n"We," "Us," and "Our" refer to the team operating EventHub.',
            ),
            
            _buildSection(
              title: '3. Privacy & Data',
              content: 'We take your emotional well-being and privacy seriously. Your mood data and journal entries are private and protected. We collect and store your information securely and will never share your personal data without your explicit consent.',
            ),
            
            _buildSection(
              title: '4. User Content',
              content: 'The events, schedules, and information you create in EventHub are yours. While we provide tools to organize and manage your events, you are responsible for the content you create and share through the App.',
            ),
            
            _buildSection(
              title: '5. Health Disclaimer',
              content: 'EventHub is an event management and coordination tool. We are not responsible for the success or failure of events organized through our platform. Users are responsible for their own event planning and execution.',
            ),
            
            _buildSection(
              title: '6. User Guidelines',
              content: 'Use EventHub responsibly and professionally. Create accurate event information and respect the privacy of event attendees. Do not use the App for illegal activities or to harm others. Be respectful when coordinating with other users.',
            ),
            
            _buildSection(
              title: '7. App Features',
              content: 'EventHub provides event creation, management, scheduling, and coordination features. While we strive for reliability in our platform, event success depends on many factors beyond our control and should be considered a collaborative tool rather than a guarantee of event success.',
            ),
            
            _buildSection(
              title: '8. Changes & Updates',
              content: 'We may update these terms as we improve EventHub. We\'ll notify you of significant changes. Your continued use of the App after changes indicates your acceptance of the updated terms.',
            ),
            
            _buildSection(
              title: '9. Support',
              content: 'If you need help with EventHub or have questions about these terms, please contact our support team. We\'re here to help you make the most of your event management experience.',
            ),
            
            SizedBox(height: 30.h),
            
            // Accept button with gradient
            Container(
              width: double.infinity,
              height: 56.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryIndigo,
                    AppColors.lightIndigo,
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryIndigo.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                ),
                child: Text(
                  'I Accept',
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkIndigo,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              color: AppColors.lightIndigo,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
} 
