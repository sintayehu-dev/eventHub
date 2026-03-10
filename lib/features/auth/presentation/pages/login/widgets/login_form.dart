import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_bloc.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_event.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_state.dart';
import 'package:eventhub/core/utils/app_helpers.dart';

/// Login form with username and password fields
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late LoginState? _lastState;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _lastState = null;
  }
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
        previous.isLoginError != current.isLoginError ||
        previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.isLoginError && state.errorMessage.isNotEmpty) {
          // Show error message as a SnackBar or custom flash
          // Use AppHelpers.showCheckFlash if available
          // ignore: use_build_context_synchronously
          AppHelpers.showCheckFlash(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state.isLoading;
        final invalid = state.firstInvalidField;
        final showError = state.showErrorMessages && invalid.isNotEmpty;
        final invalidKey = invalid['key'];
        final invalidError = invalid['error'];
        return AbsorbPointer(
          absorbing: isLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email Field
              _buildInputLabel('Email'),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                onChanged: (value) {
                  context.read<LoginBloc>().add(LoginEvent.emailChanged(value));
                },
                errorText: state.showErrorMessages && invalidKey == 'email' ? invalidError : null,
              ),
              
              SizedBox(height: 20.h),
              
              // Password Field
              _buildInputLabel('Password'),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: !state.showPassword,
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(scale: animation, child: child),
                      );
                    },
                    child: Icon(
                      state.showPassword 
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                      key: ValueKey<bool>(state.showPassword),
                      color: const Color(0xFF3F51B5),
                    ),
                  ),
                  onPressed: () => context.read<LoginBloc>().add(
                    const LoginEvent.toggleShowPassword(),
                  ),
                ),
                onChanged: (value) {
                  context.read<LoginBloc>().add(LoginEvent.passwordChanged(value));
                },
                errorText: state.showErrorMessages && invalidKey == 'password' ? invalidError : null,
              ),

              // Forgot Password Option
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: isLoading ? null : () {
                    // TODO: Implement forgot password
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      color: const Color(0xFF3F51B5),
                      fontWeight: FontWeight.w500,
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

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.outfit(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF303F9F),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required Function(String) onChanged,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    bool obscureText = false,
    String? errorText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: errorText != null 
              ? Colors.red.shade300
              : const Color(0xFF3F51B5).withOpacity(0.12),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3F51B5).withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.outfit(
          fontSize: 16.sp,
          color: const Color(0xFF303F9F),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.outfit(
            fontSize: 16.sp,
            color: const Color(0xFF7986CB).withOpacity(0.7),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF3F51B5).withOpacity(0.08),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              prefixIcon,
              color: const Color(0xFF3F51B5),
              size: 20.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 50.w,
            minHeight: 50.h,
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: suffixIcon,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          errorText: errorText,
          errorStyle: GoogleFonts.outfit(
            fontSize: 12.sp,
            color: Colors.red.shade400,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
} 
