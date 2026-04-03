import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_bloc.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_event.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _progressController;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
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

    // Initialize animations
    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    ));

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _logoController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _textController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
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
    // Force dark theme for splash screen
    final darkTheme = AppTheme.darkTheme();
    final colorScheme = darkTheme.colorScheme;
    
    return Theme(
      data: darkTheme,
      child: BlocProvider(
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
        child: Scaffold(
          backgroundColor: colorScheme.surface,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.surface,
                  colorScheme.primaryContainer,
                  colorScheme.primary.withValues(alpha: 0.8),
                  colorScheme.primary,
                ],
                stops: const [0.0, 0.3, 0.7, 1.0],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Animated Logo
                          AnimatedBuilder(
                            animation: _logoAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _logoAnimation.value,
                                child: Container(
                                  width: 100.w,
                                  height: 100.w,
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
                                        color: colorScheme.primary
                                            .withValues(alpha: 0.3),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.event,
                                    size: 50.sp,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 40.h),

                          // Animated App Name
                          AnimatedBuilder(
                            animation: _textAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _textAnimation.value,
                                child: Transform.translate(
                                  offset: Offset(
                                      0, 20 * (1 - _textAnimation.value)),
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Event ',
                                                style: darkTheme
                                                  .textTheme.displayMedium
                                                  ?.copyWith(
                                                color: colorScheme.onSurface,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Hub',
                                                style: darkTheme
                                                  .textTheme.displayMedium
                                                  ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..shader = LinearGradient(
                                                    colors: [
                                                      colorScheme.primary,
                                                      colorScheme.secondary,
                                                    ],
                                                  ).createShader(
                                                    const Rect.fromLTWH(
                                                        0.0, 0.0, 200.0, 70.0),
                                                  ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      Text(
                                        'WHERE EXPERIENCES CONNECT',
                                          style: darkTheme.textTheme.labelMedium
                                            ?.copyWith(
                                          color: colorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Bottom Section with Loading
                    AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _progressAnimation.value,
                          child: Column(
                            children: [
                              // Loading Text
                              Text(
                                'Syncing your universe',
                                  style:
                                      darkTheme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.8),
                                ),
                              ),

                              SizedBox(height: 16.h),

                              // Progress Bar
                              Container(
                                width: double.infinity,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Stack(
                                  children: [
                                    FractionallySizedBox(
                                      widthFactor: _progressAnimation.value,
                                      child: Container(
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              colorScheme.primary,
                                              colorScheme.secondary,
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 16.h),

                              // Feature Icons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildFeatureIcon(
                                      Icons.event_available, 'EVENTS'),
                                  SizedBox(width: 32.w),
                                  _buildFeatureIcon(
                                      Icons.confirmation_number, 'TICKETS'),
                                  SizedBox(width: 32.w),
                                  _buildFeatureIcon(Icons.favorite, 'SAVED'),
                                ],
                              ),
                              
                              SizedBox(height: 40.h),
                              
                              // Premium Access
                              Text(
                                'PREMIUM ACCESS',
                                  style:
                                      darkTheme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              
                              SizedBox(height: 20.h),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    final darkTheme = AppTheme.darkTheme();
    final colorScheme = darkTheme.colorScheme;
    
    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 16.sp,
            color: colorScheme.primary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: darkTheme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
