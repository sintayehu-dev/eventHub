import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
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
    // Pre-fill with test credentials for development
    _emailController.text = 'test@gmail.com';
    _passwordController.text = 'Password@123';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isLoginSuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login successful!'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Use role-based routing
                if (state.routeName != null) {
                  context.goNamed(state.routeName!);
                } else {
                  // Fallback to attendee home if no route specified
                  context.goNamed(RouteName.attendeeHome);
                }
              }
              
              if (state.isLoginError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
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
                        'Event Hub',
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      SizedBox(height: 8.h),
                      
                      // Tagline
                      Text(
                        'Elevate your experience. Enter the arena.',
                        style: theme.textTheme.bodyMedium?.copyWith(
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
                            style: theme.textTheme.titleSmall?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color:
                                    colorScheme.outline.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: 'name@company.com',
                                hintStyle: theme.textTheme.bodyLarge?.copyWith(
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
                                style: theme.textTheme.titleSmall?.copyWith(
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
                                  style: theme.textTheme.labelMedium?.copyWith(
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
                                  colorScheme.onSurface.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color:
                                    colorScheme.outline.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !state.showPassword,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                hintStyle: theme.textTheme.bodyLarge?.copyWith(
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
                              ? SizedBox(
                                  width: 24.w,
                                  height: 24.w,
                                  child: CircularProgressIndicator(
                                    color: colorScheme.onPrimary,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login to Hub',
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
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
                              style: theme.textTheme.labelMedium?.copyWith(
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
                              context.read<LoginBloc>().add(
                                const LoginEvent.googleSignInSubmitted(),
                              );
                            },
                          ),
                          
                          // Facebook Button
                          _buildOAuthButton(
                            icon: Icons.facebook,
                            color: const Color(0xFF1877F2),
                            onTap: () {
                              // TODO: Implement Facebook sign in
                            },
                          ),
                          
                          // Twitter Button
                          _buildOAuthButton(
                            icon: Icons.alternate_email,
                            color: const Color(0xFF1DA1F2),
                            onTap: () {
                              // TODO: Implement Twitter sign in
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
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouteName.signUp);
                            },
                            child: Text(
                              'Create Account',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.primary,
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
    );
  }

  Widget _buildOAuthButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: colorScheme.onSurface.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
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