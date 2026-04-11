import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/app_validation_error_widget.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_bloc.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_event.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Force dark theme for sign up screen
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
          child: BlocConsumer<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              if (state.isRegistrationSuccessful) {
                AppHelpers.showRegistrationSuccessSnackBar(context);
                // Use role-based routing
                if (state.routeName != null) {
                  context.goNamed(state.routeName!);
                } else {
                  // Fallback to attendee home if no route specified
                  context.goNamed(RouteName.attendeeHome);
                }
              }
              
              if (state.isRegistrationError) {
                AppHelpers.showErrorSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with back button and title (now scrollable)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => context.pop(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: colorScheme.onSurface,
                                  size: 24.sp,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Event Hub',
                                  style:
                                      darkTheme.textTheme.titleLarge?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 48.w), // Balance the back button
                            ],
                          ),
                        ),
                      
                        // Hero Image Section
                        Container(
                          width: double.infinity,
                          height: 120.h,
                          margin: EdgeInsets.only(bottom: 32.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primary.withValues(alpha: 0.3),
                                colorScheme.secondary.withValues(alpha: 0.3),
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Particle effect simulation
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=400&h=200&fit=crop',
                                      ),
                                      fit: BoxFit.cover,
                                      opacity: 0.3,
                                    ),
                                  ),
                                ),
                              ),
                              // Overlay
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      colorScheme.primary
                                          .withValues(alpha: 0.4),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                            
                            Text(
                              'Join the Scene',
                                style:
                                    darkTheme.textTheme.displaySmall?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Create your account & start exploring.',
                                style: darkTheme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.7),
                              ),
                            ),
                            
                            SizedBox(height: 32.h),
                            
                            // Full Name Field
                            Text(
                              'Full Name',
                                style: darkTheme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface
                                      .withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: colorScheme.outline
                                        .withValues(alpha: 0.4),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: _fullNameController,
                                  style:
                                      darkTheme.textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
                                  hintStyle:
                                        darkTheme.textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.5),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: colorScheme.primary,
                                    size: 20.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                ),
                                  onChanged: (value) {
                                    context.read<RegistrationBloc>().add(
                                          RegistrationEvent.fullNameChanged(
                                              value),
                                        );
                                  },
                                ),
                              ),
                              // Full Name validation error
                              if (state.showErrorMessages &&
                                  state.fullName != null &&
                                  !state.fullName!.isValid())
                                AppValidationErrorWidget(
                                  errorMessage: state.fullName!.value.fold(
                                    (f) => f.failedValue,
                                    (_) => '',
                                  ),
                                ),
                            
                            SizedBox(height: 24.h),
                            
                            // Email Field
                            Text(
                              'Email Address',
                                style: darkTheme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface
                                      .withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: colorScheme.outline
                                        .withValues(alpha: 0.4),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                  style:
                                      darkTheme.textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'name@gmail.com',
                                  hintStyle:
                                        darkTheme.textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.5),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: colorScheme.primary,
                                    size: 20.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                ),
                                onChanged: (value) {
                                  context.read<RegistrationBloc>().add(
                                    RegistrationEvent.emailChanged(value),
                                  );
                                },
                              ),
                            ),
                            // Email validation error
                            if (state.showErrorMessages &&
                                state.email != null &&
                                !state.email!.isValid())
                              AppValidationErrorWidget(
                                errorMessage: state.email!.value.fold(
                                  (f) => f.failedValue,
                                  (_) => '',
                                ),
                              ),
                            
                            SizedBox(height: 24.h),
                            
                            // Password Field
                            Text(
                              'Password',
                                style: darkTheme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface
                                      .withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: colorScheme.outline
                                        .withValues(alpha: 0.4),
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: !state.showPassword,
                                  style:
                                      darkTheme.textTheme.bodyLarge?.copyWith(
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
                                    color: colorScheme.primary,
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
                                      context.read<RegistrationBloc>().add(
                                        const RegistrationEvent.toggleShowPassword(),
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
                                  context.read<RegistrationBloc>().add(
                                    RegistrationEvent.passwordChanged(value),
                                  );
                                },
                              ),
                            ),
                            // Password validation error
                            if (state.showErrorMessages &&
                                state.password != null &&
                                !state.password!.isValid())
                              AppValidationErrorWidget(
                                errorMessage: state.password!.value.fold(
                                  (f) => f.failedValue,
                                  (_) => '',
                                ),
                              ),
                            
                            SizedBox(height: 32.h),
                            
                            // Role Selection
                            Text(
                              'Select Your Role',
                                style: darkTheme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildRoleCard(
                                    icon: Icons.event_available,
                                    title: 'Attendee',
                                    value: 'attendee',
                                    isSelected: _selectedRole == 'attendee',
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: _buildRoleCard(
                                    icon: Icons.event_note,
                                    title: 'Organizer',
                                    value: 'organizer',
                                    isSelected: _selectedRole == 'organizer',
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: _buildRoleCard(
                                    icon: Icons.people,
                                    title: 'Venue Staff',
                                    value: 'staff',
                                    isSelected: _selectedRole == 'staff',
                                  ),
                                ),
                              ],
                            ),
                            // Role validation error
                            if (state.showErrorMessages &&
                                state.userRole != null &&
                                !state.userRole!.isValid())
                              AppValidationErrorWidget(
                                errorMessage: state.userRole!.value.fold(
                                  (f) => f.failedValue,
                                  (_) => '',
                                ),
                              ),
                            
                            SizedBox(height: 40.h),
                            
                            // Sign Up Button
                            SizedBox(
                              width: double.infinity,
                              height: 56.h,
                              child: ElevatedButton(
                                onPressed: state.isLoading ? null : () {
                                  context.read<RegistrationBloc>().add(
                                    const RegistrationEvent.registrationSubmitted(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
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
                                            'Sign Up',
                                              style: darkTheme
                                                  .textTheme.titleMedium
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
                            
                            SizedBox(height: 24.h),
                            
                            // Sign In Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                    style: darkTheme.textTheme.bodyMedium
                                        ?.copyWith(
                                    color: colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => context.pop(),
                                  child: Text(
                                    'Log In',
                                      style: darkTheme.textTheme.bodyMedium
                                          ?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                            SizedBox(height: 16.h),
                            
                            // Terms and Privacy
                            Text(
                              'By signing up you agree to our Terms of Service and Privacy Policy',
                                style: darkTheme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.5),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            SizedBox(height: 32.h),
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

  Widget _buildRoleCard({
    required IconData icon,
    required String title,
    required String value,
    required bool isSelected,
  }) {
    final darkTheme = AppTheme.darkTheme();
    final colorScheme = darkTheme.colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = value;
        });
        context.read<RegistrationBloc>().add(
              RegistrationEvent.userRoleChanged(value),
            );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: isSelected 
              ? colorScheme.primary.withValues(alpha: 0.25)
              : colorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.6),
              size: 24.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: darkTheme.textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurface.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
