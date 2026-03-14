import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/local_storage.dart';

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
      gradient: const [Color(0xFF4A2A91), Color(0xFF7986CB)], // EventHub colors
    ),
    OnboardingItem(
      title: 'Connect & Network',
      description:
          'Meet like-minded people and build meaningful connections. Expand your network at every event you attend.',
      icon: Icons.people,
      gradient: const [Color(0xFF7986CB), Color(0xFFEAB308)], // EventHub colors
    ),
    OnboardingItem(
      title: 'Create Memories',
      description:
          'Organize your own events and create unforgettable experiences. Share moments that matter with your community.',
      icon: Icons.celebration,
      gradient: const [Color(0xFFEAB308), Color(0xFF4A2A91)], // EventHub colors
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(
                    'Skip',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w500,
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
                  return _OnboardingItemWidget(item: _onboardingItems[index]);
                },
              ),
            ),

            // Page Indicator
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _onboardingItems.length,
                effect: WormEffect(
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  activeDotColor: colorScheme.primary,
                  dotColor: colorScheme.outline.withValues(alpha: 0.3),
                  spacing: 16.w,
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _previousPage,
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          side: BorderSide(color: colorScheme.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Previous',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.primary,
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
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentPage == _onboardingItems.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  const _OnboardingItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with Gradient Background
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: item.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: item.gradient.first.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              item.icon,
              size: 60.sp,
              color: colorScheme.onPrimary,
            ),
          ),

          SizedBox(height: 48.h),

          // Title
          Text(
            item.title,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 16.h),

          // Description
          Text(
            item.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
              height: 1.5,
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
