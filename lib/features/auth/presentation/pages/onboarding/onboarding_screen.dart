import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/core/utils/local_storage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = const [
    OnboardingItem(
      title: 'Discover events\nnear you',
      description:
          'From concerts to conferences, find experiences that match your interests.',
      icon: Icons.explore_rounded,
      chipIcon: Icons.location_on_rounded,
      chipLabel: 'Addis Ababa',
    ),
    OnboardingItem(
      title: 'Tickets in\nyour pocket',
      description:
          'Buy in seconds and keep every ticket ready to scan, even offline.',
      icon: Icons.confirmation_number_rounded,
      chipIcon: Icons.qr_code_2_rounded,
      chipLabel: 'Scan at the gate',
    ),
    OnboardingItem(
      title: 'Never miss\nthe moment',
      description:
          'Follow the events you love and share unforgettable nights with your people.',
      icon: Icons.celebration_rounded,
      chipIcon: Icons.event_available_rounded,
      chipLabel: 'Saturday, 8 PM',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLast => _currentPage == _items.length - 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8.h, 12.w, 0),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isLast ? 0 : 1,
                  child: TextButton(
                    onPressed: _isLast ? null : _finishOnboarding,
                    child: Text(
                      'Skip',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemCount: _items.length,
                itemBuilder: (context, i) =>
                    _OnboardingItemWidget(item: _items[i]),
              ),
            ),
            SizedBox(height: 20.h),
            SmoothPageIndicator(
              controller: _pageController,
              count: _items.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8.h,
                dotWidth: 8.h,
                expansionFactor: 3.5,
                spacing: 6.w,
                activeDotColor: AppColors.accent,
                dotColor: AppColors.line,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 24.h),
              child: AppButton(
                label: _isLast ? 'Get started' : 'Next',
                icon: Icons.arrow_forward_rounded,
                onPressed: _isLast ? _finishOnboarding : _nextPage,
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Expanded(child: _Illustration(item: item)),
          SizedBox(height: 28.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(item.title, style: theme.textTheme.displaySmall),
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.description,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Stacked teal hero card, peach card and floating chip, echoing the app UI.
class _Illustration extends StatelessWidget {
  const _Illustration({required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, box) {
        final w = box.maxWidth;
        final h = box.maxHeight;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: w * 0.16,
              top: h * 0.02,
              bottom: h * 0.22,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.heroGradient,
                  borderRadius: BorderRadius.circular(32.r),
                  boxShadow: AppColors.softShadow,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30.w,
                      top: -30.w,
                      child: Container(
                        width: 130.w,
                        height: 130.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withValues(alpha: 0.07),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 96.w,
                        height: 96.w,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item.icon,
                            size: 46.sp, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: h * 0.02,
              width: w * 0.58,
              height: h * 0.34,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.peach,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: AppColors.softShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(item.chipIcon,
                          size: 18.sp, color: AppColors.primary),
                    ),
                    Text(
                      item.chipLabel,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: AppColors.ink),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: w * 0.06,
              bottom: h * 0.06,
              child: Container(
                width: 22.w,
                height: 22.w,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;
  final IconData chipIcon;
  final String chipLabel;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.chipIcon,
    required this.chipLabel,
  });
}
