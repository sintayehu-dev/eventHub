import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_bloc.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_state.dart';
import 'widgets/registration_widget.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegistrationBloc>(),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listenWhen: (previous, current) => 
        previous.verificationSent != current.verificationSent ||
        previous.isRegistrationError != current.isRegistrationError ||
        (previous.isLoading == true && current.isLoading == false && !current.isRegistrationError),
      listener: (context, state) {
        if (!state.isRegistrationError) {
          AppHelpers.showCheckFlash(context, 'Registration successful');
          context.goNamed(RouteName.login);
        } else if (state.isRegistrationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
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
              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        
                        // Welcome Text with emoji
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Join EventHub ',
                                style: GoogleFonts.outfit(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkIndigo,
                                ),
                              ),
                              TextSpan(
                                text: '✨',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 8.h),
                        
                        Text(
                          'Start your journey to better mental wellness',
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            color: AppColors.lightIndigo,
                            height: 1.5,
                          ),
                        ),
                        
                        SizedBox(height: 32.h),
                        
                        // Profile Photo Selection with modern styling
                        Center(
                          child: Container(
                            width: 160.w,
                            height: 160.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryIndigo.withOpacity(0.1),
                                  blurRadius: 30,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              border: Border.all(
                                color: AppColors.primaryIndigo.withOpacity(0.1),
                                width: 2,
                              ),
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
                                        AppColors.primaryIndigo.withOpacity(0.1),
                                        AppColors.white.withOpacity(0),
                                      ],
                                    ),
                                  ),
                                ),
                                const ProfilePhotoSelector(),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 32.h),
                        
                        // Registration Form
                        Container(
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryIndigo.withOpacity(0.06),
                                blurRadius: 24,
                                offset: const Offset(0, 12),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const RegistrationForm(),
                              SizedBox(height: 20.h),
                              const TermsAndConditionsSwitch(),
                              SizedBox(height: 24.h),
                              const RegistrationButton(),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 24.h),
                        
                        // Sign in option with modern styling
                        Center(
                          child: TextButton(
                            onPressed: () => context.goNamed(RouteName.login),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.h,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  color: AppColors.lightIndigo,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: GoogleFonts.outfit(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryIndigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
