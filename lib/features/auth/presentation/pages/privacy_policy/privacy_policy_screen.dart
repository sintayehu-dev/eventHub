import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = AppTheme.darkTheme();
    final colorScheme = darkTheme.colorScheme;

    return Theme(
      data: darkTheme,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.primary.withValues(alpha: 0.95),
                colorScheme.primaryContainer.withValues(alpha: 0.8),
                colorScheme.surface.withValues(alpha: 0.9),
                colorScheme.surface.withValues(alpha: 0.95),
              ],
              stops: const [0.0, 0.3, 0.7, 1.0],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      AppBackButton(
                        iconColor: colorScheme.onSurface,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        'Privacy Policy',
                        style: darkTheme.textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),

                        // Last Updated
                        Text(
                          'Last Updated: April 18, 2026',
                          style: darkTheme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        SizedBox(height: 24.h),

                        // Introduction
                        _buildSection(
                          title: '1. Introduction',
                          content:
                              'Welcome to Ethio Events. We respect your privacy and are committed to protecting your personal data. This privacy policy will inform you about how we look after your personal data when you use our app and tell you about your privacy rights.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Information We Collect
                        _buildSection(
                          title: '2. Information We Collect',
                          content:
                              'We collect and process the following types of information:\n\n'
                              '• Personal Information: Name, email address, phone number\n'
                              '• Profile Information: Profile picture, user preferences\n'
                              '• Event Data: Events you create, attend, or show interest in\n'
                              '• Transaction Data: Ticket purchases and payment information\n'
                              '• Usage Data: How you interact with our app\n'
                              '• Device Information: Device type, operating system, unique device identifiers',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // How We Use Your Information
                        _buildSection(
                          title: '3. How We Use Your Information',
                          content:
                              'We use your information to:\n\n'
                              '• Provide and maintain our services\n'
                              '• Process your event registrations and ticket purchases\n'
                              '• Send you event notifications and updates\n'
                              '• Improve our app and user experience\n'
                              '• Prevent fraud and ensure security\n'
                              '• Comply with legal obligations\n'
                              '• Communicate with you about our services',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Data Sharing
                        _buildSection(
                          title: '4. Data Sharing and Disclosure',
                          content:
                              'We may share your information with:\n\n'
                              '• Event Organizers: When you register for their events\n'
                              '• Service Providers: Who help us operate our app\n'
                              '• Payment Processors: To process your transactions\n'
                              '• Legal Authorities: When required by law\n\n'
                              'We do not sell your personal information to third parties.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Data Security
                        _buildSection(
                          title: '5. Data Security',
                          content:
                              'We implement appropriate technical and organizational measures to protect your personal data against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Your Rights
                        _buildSection(
                          title: '6. Your Rights',
                          content:
                              'You have the right to:\n\n'
                              '• Access your personal data\n'
                              '• Correct inaccurate data\n'
                              '• Request deletion of your data\n'
                              '• Object to processing of your data\n'
                              '• Request data portability\n'
                              '• Withdraw consent at any time',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Data Retention
                        _buildSection(
                          title: '7. Data Retention',
                          content:
                              'We retain your personal data only for as long as necessary to fulfill the purposes outlined in this privacy policy, unless a longer retention period is required by law.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Children\'s Privacy
                        _buildSection(
                          title: '8. Children\'s Privacy',
                          content:
                              'Our services are not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Changes to Privacy Policy
                        _buildSection(
                          title: '9. Changes to This Privacy Policy',
                          content:
                              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on this page and updating the "Last Updated" date.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Contact Us
                        _buildSection(
                          title: '10. Contact Us',
                          content:
                              'If you have any questions about this privacy policy or our data practices, please contact us at:\n\n'
                              'Email: privacy@ethioevents.com\n'
                              'Address: Addis Ababa, Ethiopia',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required ThemeData darkTheme,
    required ColorScheme colorScheme,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: darkTheme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            content,
            style: darkTheme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
