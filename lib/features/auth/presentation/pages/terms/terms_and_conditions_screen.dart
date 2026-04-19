import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
                        'Terms & Conditions',
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
                          title: '1. Acceptance of Terms',
                          content:
                              'Welcome to Ethio Events. By accessing and using our mobile application and services, you accept and agree to be bound by the terms and provisions of this agreement. If you do not agree to these terms, please do not use our services.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Account Registration
                        _buildSection(
                          title: '2. Account Registration',
                          content:
                              'To use certain features of Ethio Events, you must register for an account. When creating an account, you agree to:\n\n'
                              '• Provide accurate, current, and complete information\n'
                              '• Maintain and update your information to keep it accurate\n'
                              '• Maintain the security of your password\n'
                              '• Accept responsibility for all activities under your account\n'
                              '• Notify us immediately of any unauthorized use\n\n'
                              'You may register as an Attendee, Organizer, or Staff member, each with specific rights and responsibilities.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // User Roles and Responsibilities
                        _buildSection(
                          title: '3. User Roles and Responsibilities',
                          content: 'Attendees:\n'
                              '• May browse and register for events\n'
                              '• Must provide accurate information when purchasing tickets\n'
                              '• Are responsible for their own attendance and conduct\n\n'
                              'Organizers:\n'
                              '• May create and manage events\n'
                              '• Must provide accurate event information\n'
                              '• Are responsible for event execution and attendee safety\n'
                              '• Must comply with all applicable laws and regulations\n\n'
                              'Staff:\n'
                              '• May assist with event operations as assigned\n'
                              '• Must follow organizer instructions\n'
                              '• Are responsible for professional conduct',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Event Creation and Management
                        _buildSection(
                          title: '4. Event Creation and Management',
                          content: 'Event organizers agree to:\n\n'
                              '• Provide accurate and complete event information\n'
                              '• Comply with all local laws and regulations\n'
                              '• Obtain necessary permits and licenses\n'
                              '• Ensure event safety and security\n'
                              '• Honor all ticket sales and commitments\n'
                              '• Handle refunds according to stated policies\n\n'
                              'Ethio Events reserves the right to remove any event that violates these terms or applicable laws.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Ticket Purchases and Payments
                        _buildSection(
                          title: '5. Ticket Purchases and Payments',
                          content:
                              'When purchasing tickets through Ethio Events:\n\n'
                              '• All sales are subject to event organizer policies\n'
                              '• Prices are displayed in Ethiopian Birr (ETB)\n'
                              '• Payment processing is handled securely\n'
                              '• Refund policies are set by event organizers\n'
                              '• Digital tickets are provided via QR codes\n'
                              '• Tickets are non-transferable unless specified',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Prohibited Uses
                        _buildSection(
                          title: '6. Prohibited Uses',
                          content: 'You may not use Ethio Events to:\n\n'
                              '• Violate any laws or regulations\n'
                              '• Infringe on intellectual property rights\n'
                              '• Transmit harmful or malicious code\n'
                              '• Harass, abuse, or harm others\n'
                              '• Impersonate others or misrepresent affiliations\n'
                              '• Collect user information without consent\n'
                              '• Create fraudulent events or tickets\n'
                              '• Engage in any unlawful activity',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Intellectual Property
                        _buildSection(
                          title: '7. Intellectual Property',
                          content:
                              'The Ethio Events app, including its design, features, and content, is owned by us and protected by copyright, trademark, and other intellectual property laws. You may not:\n\n'
                              '• Copy, modify, or distribute our content\n'
                              '• Reverse engineer our software\n'
                              '• Use our trademarks without permission\n'
                              '• Create derivative works',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Limitation of Liability
                        _buildSection(
                          title: '8. Limitation of Liability',
                          content:
                              'Ethio Events provides the platform "as is" without warranties. We are not liable for:\n\n'
                              '• Event cancellations or changes\n'
                              '• Disputes between users and organizers\n'
                              '• Loss of data or service interruptions\n'
                              '• Indirect, incidental, or consequential damages\n'
                              '• Actions or omissions of event organizers\n\n'
                              'Our total liability shall not exceed the amount paid by you in the past 12 months.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Termination
                        _buildSection(
                          title: '9. Termination',
                          content:
                              'We may terminate or suspend your account immediately, without prior notice, for:\n\n'
                              '• Violation of these terms\n'
                              '• Fraudulent activity\n'
                              '• Harmful behavior toward other users\n'
                              '• Any reason at our sole discretion\n\n'
                              'Upon termination, your right to use the service will cease immediately.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Changes to Terms
                        _buildSection(
                          title: '10. Changes to Terms',
                          content:
                              'We reserve the right to modify these terms at any time. We will notify users of significant changes via email or app notification. Continued use of the service after changes constitutes acceptance of the new terms.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Governing Law
                        _buildSection(
                          title: '11. Governing Law',
                          content:
                              'These terms shall be governed by and construed in accordance with the laws of Ethiopia. Any disputes shall be resolved in the courts of Addis Ababa, Ethiopia.',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Contact Information
                        _buildSection(
                          title: '12. Contact Us',
                          content:
                              'If you have any questions about these Terms and Conditions, please contact us at:\n\n'
                              'Email: support@ethioevents.com\n'
                              'Address: Addis Ababa, Ethiopia',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        // Acknowledgment Box
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: colorScheme.primary.withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: colorScheme.primary,
                                size: 24.sp,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  'By using Ethio Events, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
                                  style:
                                      darkTheme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.9),
                                    height: 1.5,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
