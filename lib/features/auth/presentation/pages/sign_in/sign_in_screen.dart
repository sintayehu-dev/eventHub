import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/app_validation_error_widget.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_bloc.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_event.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Clear any pre-filled credentials for production
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Force dark theme for login screen
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
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isLoginSuccessful) {
                AppHelpers.showLoginSuccessSnackBar(context);
                // Use role-based routing
                if (state.routeName != null) {
                  context.goNamed(state.routeName!);
                } else {
                  // Fallback to attendee home if no route specified
                  context.goNamed(RouteName.attendeeHome);
                }
              }
              
              if (state.isLoginError) {
                AppHelpers.showErrorSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 60.h),
                      
                      // Logo Section
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withValues(alpha: 0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.event,
                          size: 40.sp,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // App Name
                      Text(
                          'Ethio Events',
                          style: darkTheme.textTheme.displaySmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      SizedBox(height: 8.h),
                      
                      // Tagline
                      Text(
                        'Elevate your experience. Enter the arena.',
                          style: darkTheme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 48.h),
                      
                      // Email Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email Address',
                              style: darkTheme.textTheme.titleSmall?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  colorScheme.onSurface
                                    .withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color:
                                    colorScheme.outline
                                      .withValues(alpha: 0.4),
                                width: 1,
                              ),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                                style: darkTheme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: 'name@company.com',
                                  hintStyle:
                                      darkTheme.textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.6),
                                  size: 20.sp,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                              ),
                              onChanged: (value) {
                                context.read<LoginBloc>().add(
                                  LoginEvent.emailChanged(value),
                                );
                              },
                            ),
                          ),
                          // Email validation error
                          if (state.showErrorMessages &&
                              state.firstInvalidField['key'] == 'email')
                            AppValidationErrorWidget(
                              errorMessage: state.firstInvalidField['error'],
                            ),
                        ],
                      ),
                      
                      SizedBox(height: 24.h),
                      
                      // Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Password',
                                  style:
                                      darkTheme.textTheme.titleSmall?.copyWith(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.8),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<LoginBloc>().add(
                                    const LoginEvent.passwordResetRequested(),
                                  );
                                },
                                child: Text(
                                  'Forgot password?',
                                    style: darkTheme.textTheme.labelMedium
                                        ?.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  colorScheme.onSurface
                                    .withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color:
                                    colorScheme.outline
                                      .withValues(alpha: 0.4),
                                width: 1,
                              ),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !state.showPassword,
                                style: darkTheme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                  hintStyle:
                                      darkTheme.textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.6),
                                  size: 20.sp,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    state.showPassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                    size: 20.sp,
                                  ),
                                  onPressed: () {
                                    context.read<LoginBloc>().add(
                                      const LoginEvent.toggleShowPassword(),
                                    );
                                  },
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                              ),
                              onChanged: (value) {
                                context.read<LoginBloc>().add(
                                  LoginEvent.passwordChanged(value),
                                );
                              },
                            ),
                          ),
                          // Password validation error
                          if (state.showErrorMessages &&
                              state.firstInvalidField['key'] == 'password')
                            AppValidationErrorWidget(
                              errorMessage: state.firstInvalidField['error'],
                            ),
                        ],
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: state.isLoading ? null : () {
                            context.read<LoginBloc>().add(
                              const LoginEvent.loginSubmitted(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                          ),
                          child: state.isLoading
                                ? SpinKitLoadingWidget(
                                    color: colorScheme.onPrimary,
                                    size: 24.w,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        'Login',
                                      style:
                                          darkTheme.textTheme.titleMedium
                                            ?.copyWith(
                                        color: colorScheme.onPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18.sp,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // OR Divider
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: colorScheme.outline.withValues(alpha: 0.3),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'OR',
                                style:
                                    darkTheme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: colorScheme.outline.withValues(alpha: 0.3),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 24.h),
                      
                      // OAuth Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Google Button
                          _buildOAuthButton(
                            icon: Icons.g_mobiledata,
                            color: const Color(0xFFDB4437),
                            onTap: () {
                                AppHelpers.showInfoSnackBar(
                                    context, 'Feature to be implemented soon'
                              );
                            },
                          ),
                          
                          // Facebook Button
                          _buildOAuthButton(
                            icon: Icons.facebook,
                            color: const Color(0xFF1877F2),
                            onTap: () {
                                AppHelpers.showInfoSnackBar(
                                    context, 'Feature to be implemented soon');
                            },
                          ),
                          
                          // Twitter Button
                          _buildOAuthButton(
                            icon: Icons.alternate_email,
                            color: const Color(0xFF1DA1F2),
                            onTap: () {
                                AppHelpers.showInfoSnackBar(
                                    context, 'Feature to be implemented soon');
                            },
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                              style: darkTheme.textTheme.bodyMedium?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.9),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouteName.signUp);
                            },
                            child: Text(
                              'Create Account',
                                style: darkTheme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildOAuthButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final darkTheme = AppTheme.darkTheme();
    final colorScheme = darkTheme.colorScheme;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: colorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24.sp,
        ),
      ),
    );
  }
}