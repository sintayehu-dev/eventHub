import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Discover Events',
      description:
          'Find amazing events happening around you. From concerts to conferences, discover experiences that match your interests.',
      icon: Icons.explore,
      gradient: [AppColors.primary, AppColors.lightIndigo],
    ),
    OnboardingItem(
      title: 'Connect & Network',
      description:
          'Meet like-minded people and build meaningful connections. Expand your network at every event you attend.',
      icon: Icons.people,
      gradient: [AppColors.lightIndigo, AppColors.accentPurple],
    ),
    OnboardingItem(
      title: 'Create Memories',
      description:
          'Organize your own events and create unforgettable experiences. Share moments that matter with your community.',
      icon: Icons.celebration,
      gradient: [AppColors.accentPurple, AppColors.primary],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Force dark theme for onboarding screen
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
                // Skip Button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: TextButton(
                      onPressed: _finishOnboarding,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: darkTheme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                // Page View
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _onboardingItems.length,
                    itemBuilder: (context, index) {
                      return _OnboardingItemWidget(
                        item: _onboardingItems[index],
                        darkTheme: darkTheme,
                      );
                    },
                  ),
                ),

                // Page Indicator
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: _onboardingItems.length,
                    effect: WormEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      activeDotColor: AppColors.softGold,
                      dotColor: colorScheme.onSurface.withValues(alpha: 0.2),
                      spacing: 16.w,
                    ),
                  ),
                ),

                // Bottom Buttons
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 32.h),
                  child: Row(
                    children: [
                      if (_currentPage > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _previousPage,
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              side: BorderSide(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.3),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                            ),
                            child: Text(
                              'Previous',
                              style: darkTheme.textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      
                      if (_currentPage > 0) SizedBox(width: 16.w),
                      
                      Expanded(
                        flex: _currentPage == 0 ? 1 : 1,
                        child: ElevatedButton(
                          onPressed: _currentPage == _onboardingItems.length - 1
                              ? _finishOnboarding
                              : _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: colorScheme.onPrimary,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _currentPage == _onboardingItems.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                                style: darkTheme.textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.arrow_forward,
                                size: 18.sp,
                                color: colorScheme.onPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finishOnboarding() async {
    await LocalStorage.ensureInitialized();
    await LocalStorage.instance.setIsDoneOnboarding(true);
    if (mounted) {
      context.goNamed(RouteName.login);
    }
  }
}

class _OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;
  final ThemeData darkTheme;

  const _OnboardingItemWidget({
    required this.item,
    required this.darkTheme,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = darkTheme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with Gradient Background
          Container(
            width: 140.w,
            height: 140.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: item.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: item.gradient.first.withValues(alpha: 0.4),
                  blurRadius: 30,
                  spreadRadius: 5,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              item.icon,
              size: 70.sp,
              color: colorScheme.onPrimary,
            ),
          ),

          SizedBox(height: 56.h),

          // Title
          Text(
            item.title,
            style: darkTheme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),

          // Description
          Text(
            item.description,
            style: darkTheme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
              height: 1.6,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradient;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradient,
  });
}
