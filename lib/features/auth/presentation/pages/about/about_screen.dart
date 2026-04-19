import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                        'About Ethio Events',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 32.h),

                        // App Logo
                        Container(
                          width: 120.w,
                          height: 120.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primary,
                                colorScheme.secondary,
                              ],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.event,
                            size: 60.sp,
                            color: colorScheme.onPrimary,
                          ),
                        ),

                        SizedBox(height: 24.h),

                        // App Name
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ethio ',
                                style: darkTheme.textTheme.displaySmall?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Events',
                                style: darkTheme.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        colorScheme.primary,
                                        colorScheme.secondary,
                                      ],
                                    ).createShader(
                                      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 8.h),

                        Text(
                          'Version 1.0.0',
                          style: darkTheme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Description
                        Text(
                          'WHERE EXPERIENCES CONNECT',
                          style: darkTheme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 24.h),

                        Text(
                          'Ethio Events is Ethiopia\'s premier event management platform, connecting event organizers, attendees, and staff in one seamless experience.',
                          style: darkTheme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.8),
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 40.h),

                        // Features
                        _buildFeatureCard(
                          icon: Icons.event_available,
                          title: 'Discover Events',
                          description: 'Find and attend amazing events happening around you',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        SizedBox(height: 16.h),

                        _buildFeatureCard(
                          icon: Icons.confirmation_number,
                          title: 'Digital Tickets',
                          description: 'Secure QR code tickets for seamless event entry',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        SizedBox(height: 16.h),

                        _buildFeatureCard(
                          icon: Icons.event_note,
                          title: 'Organize Events',
                          description: 'Create and manage events with powerful tools',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        SizedBox(height: 16.h),

                        _buildFeatureCard(
                          icon: Icons.analytics,
                          title: 'Real-time Analytics',
                          description: 'Track event performance and attendee insights',
                          darkTheme: darkTheme,
                          colorScheme: colorScheme,
                        ),

                        SizedBox(height: 40.h),

                        // Contact Information
                        Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Get in Touch',
                                style: darkTheme.textTheme.titleLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              _buildContactItem(
                                icon: Icons.email_outlined,
                                text: 'support@ethioevents.com',
                                darkTheme: darkTheme,
                                colorScheme: colorScheme,
                              ),
                              SizedBox(height: 12.h),
                              _buildContactItem(
                                icon: Icons.location_on_outlined,
                                text: 'Addis Ababa, Ethiopia',
                                darkTheme: darkTheme,
                                colorScheme: colorScheme,
                              ),
                              SizedBox(height: 12.h),
                              _buildContactItem(
                                icon: Icons.language_outlined,
                                text: 'www.ethioevents.com',
                                darkTheme: darkTheme,
                                colorScheme: colorScheme,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Copyright
                        Text(
                          '© 2026 Ethio Events. All rights reserved.',
                          style: darkTheme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                          textAlign: TextAlign.center,
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

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required ThemeData darkTheme,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: colorScheme.primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: darkTheme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: darkTheme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    required ThemeData darkTheme,
    required ColorScheme colorScheme,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: colorScheme.primary,
          size: 20.sp,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: darkTheme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
