import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_bloc.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_event.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _textController;
  late final AnimationController _progressController;
  late final Animation<double> _logoAnimation;
  late final Animation<double> _textAnimation;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    );
    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    );
    _progressAnimation = CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    _logoController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _textController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    _progressController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) {
        final splashBloc = SplashBloc();
        Future.delayed(
          const Duration(milliseconds: 3000),
          () => splashBloc.add(const SplashEvent.checkUserStatus()),
        );
        return splashBloc;
      },
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (!state.isLoading && !state.isError && state.routeName != null) {
            context.goNamed(state.routeName!);
          }

          if (state.isError) {
            AppHelpers.showErrorSnackBar(
                context, 'Something went wrong. Please restart the app.');
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: AppColors.primaryDark,
            body: Container(
              decoration: const BoxDecoration(gradient: AppColors.heroGradient),
              child: Stack(
                children: [
                  Positioned(
                    right: -70.w,
                    top: -40.h,
                    child: _Dot(size: 240.w, alpha: 0.06),
                  ),
                  Positioned(
                    left: -60.w,
                    bottom: 120.h,
                    child: _Dot(size: 180.w, alpha: 0.05),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: _logoAnimation,
                                  child: Container(
                                    width: 96.w,
                                    height: 96.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(30.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.accent
                                              .withValues(alpha: 0.35),
                                          blurRadius: 32,
                                          offset: const Offset(0, 12),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.confirmation_number_rounded,
                                      size: 46.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                FadeTransition(
                                  opacity: _textAnimation,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Ethio Events',
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(color: AppColors.white),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'Where experiences connect',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: AppColors.white
                                              .withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FadeTransition(
                            opacity: _progressAnimation,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 32.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: SizedBox(
                                  width: 120.w,
                                  height: 4.h,
                                  child: AnimatedBuilder(
                                    animation: _progressAnimation,
                                    builder: (context, _) =>
                                        LinearProgressIndicator(
                                      value: _progressAnimation.value,
                                      backgroundColor: AppColors.white
                                          .withValues(alpha: 0.15),
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.alpha});

  final double size;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withValues(alpha: alpha),
      ),
    );
  }
}
