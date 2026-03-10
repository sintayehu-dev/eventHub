import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:eventhub/features/auth/application/splash/bloc/splash_bloc.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_event.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_state.dart';
import 'package:eventhub/core/constants/app_constants.dart';
import 'package:eventhub/core/presentation/widgets/loading.dart';
import 'package:eventhub/core/theme/app_colors.dart';

import 'package:eventhub/core/router/route_name.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final splashBloc = SplashBloc();
        Future.delayed(
          const Duration(milliseconds: 1500),
          () => splashBloc.add(const SplashEvent.checkUserStatus()),
        );
        return splashBloc;
      },
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (!state.isLoading && !state.isError) {
            context.goNamed(state.routeName!);
          }
          
          if (state.isError) {
            // Handle error state
            // Show error message or retry option
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.surface,
          body: Stack(
            children: [
              // Background gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryIndigo.withOpacity(0.1),
                      AppColors.lightIndigo.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
              
              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo container with glow
                    Container(
                      width: 160.w,
                      height: 160.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryIndigo.withOpacity(0.2),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background glow
                          Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  AppColors.primaryIndigo.withOpacity(0.2),
                                  AppColors.white.withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                          // App icon
                          Icon(
                            Icons.mood,
                            size: 64.sp,
                            color: AppColors.primaryIndigo,
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 24.h),
                    
                    // App name
                    Text(
                      'EventHub',
                      style: GoogleFonts.outfit(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkIndigo,
                      ),
                    ),
                    
                    SizedBox(height: 8.h),
                    
                    // Loading indicator
                    SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryIndigo),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Bottom text
              Positioned(
                left: 0,
                right: 0,
                bottom: 48.h,
                child: Text(
                  'Track your mood, understand yourself better',
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightIndigo,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
