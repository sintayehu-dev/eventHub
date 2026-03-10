import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_bloc.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_event.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_state.dart';
import 'package:eventhub/features/auth/presentation/pages/login/widgets/login_widgets.dart';
import 'package:eventhub/core/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => 
        previous.isLoading != current.isLoading || 
        previous.isLoginError != current.isLoginError,
      listener: (context, state) {
        if (!state.isLoading && !state.isLoginError) {
          context.goNamed(RouteName.mainScreen);
        } else if (!state.isLoading && state.isLoginError) {
          AppHelpers.showCheckFlash(
            context,
            state.errorMessage,
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
                        // Logo and Welcome message in a row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Logo with mood illustration
                            Container(
                              width: 80.w,
                              height: 80.w,
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
                                    width: 60.w,
                                    height: 60.w,
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
                                  // Logo placeholder
                                  Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryIndigo.withOpacity(0.08),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.photo_camera_outlined,
                                          color: AppColors.primaryIndigo,
                                          size: 20.sp,
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          'Add Logo',
                                          style: GoogleFonts.outfit(
                                            fontSize: 9.sp,
                                            color: AppColors.primaryIndigo,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.w),
                            // Welcome text
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Welcome Back',
                                      style: GoogleFonts.outfit(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkIndigo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        // Subtitle text
                        Text(
                          'Track your mood, understand yourself better',
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            color: AppColors.lightIndigo,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        // Login Form
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
                              const LoginForm(),
                              SizedBox(height: 24.h),
                              const LoginButton(),
                              SizedBox(height: 24.h),
                              // Divider with "Or" text
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: AppColors.lightIndigo.withOpacity(0.2),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Text(
                                      'Or continue with',
                                      style: GoogleFonts.outfit(
                                        fontSize: 14.sp,
                                        color: AppColors.lightIndigo,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: AppColors.lightIndigo.withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.h),
                              // Social login buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Google login button
                                  Container(
                                    width: 56.h,
                                    height: 56.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.lightIndigo.withOpacity(0.2),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          // Trigger Google sign in
                                          context.read<LoginBloc>().add(
                                            const LoginEvent.googleSignInSubmitted(),
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(28.r),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/icons/google.png',
                                            width: 24.w,
                                            height: 24.w,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Icon(
                                                Icons.g_mobiledata_rounded,
                                                color: AppColors.primaryIndigo,
                                                size: 28.sp,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.w),
                                  
                                  // // Facebook login button
                                  // Container(
                                  //   width: 56.h,
                                  //   height: 56.h,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     shape: BoxShape.circle,
                                  //     border: Border.all(
                                  //       color: LoginScreen.lightIndigo.withOpacity(0.2),
                                  //       width: 1.5,
                                  //     ),
                                  //   ),
                                  //   child: Material(
                                  //     color: Colors.transparent,
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //         // TODO: Implement Facebook sign in
                                  //       },
                                  //       borderRadius: BorderRadius.circular(28.r),
                                  //       child: Center(
                                  //         child: Icon(
                                  //           Icons.facebook_rounded,
                                  //           color: const Color(0xFF1877F2),
                                  //           size: 28.sp,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Sign up option with new styling
                        Center(
                          child: TextButton(
                            onPressed: () => context.goNamed(RouteName.registrationScreen),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.h,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  color: AppColors.lightIndigo,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
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
