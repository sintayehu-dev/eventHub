import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_bloc.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_event.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_state.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _referralCodeController;
  
  // Add focus nodes for each field
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  // Track which field is currently invalid
  String? _currentInvalidField;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _referralCodeController = TextEditingController();
  }
  
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _referralCodeController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  Color _getStrengthColor(double strength) {
    if (strength <= 0.25) return Colors.red;
    if (strength <= 0.5) return Colors.orange;
    if (strength <= 0.75) return Colors.yellow;
    return Colors.green;
  }

  String _getStrengthText(double strength) {
    if (strength <= 0.25) return 'Weak';
    if (strength <= 0.5) return 'Medium';
    if (strength <= 0.75) return 'Good';
    return 'Strong';
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
    required RegistrationState state,
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
          color: errorText != null && state.showErrorMessages
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
          errorText: state.showErrorMessages ? errorText : null,
          errorStyle: GoogleFonts.outfit(
            fontSize: 12.sp,
            color: Colors.red.shade400,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
  
  double _calculatePasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[a-z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) strength++;
    return strength / 5.0;
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listenWhen: (prev, curr) => prev.showErrorMessages != curr.showErrorMessages,
      listener: (context, state) {
        if (state.showErrorMessages) {
          final invalid = state.firstInvalidField;
          if (invalid.isNotEmpty) {
            final key = invalid['key'];
            switch (key) {
              case 'firstName':
                FocusScope.of(context).requestFocus(_firstNameFocus);
                break;
              case 'lastName':
                FocusScope.of(context).requestFocus(_lastNameFocus);
                break;
              case 'email':
                FocusScope.of(context).requestFocus(_emailFocus);
                break;
              case 'password':
                FocusScope.of(context).requestFocus(_passwordFocus);
                break;
              case 'confirmPassword':
                FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                break;
            }
            setState(() {
              _currentInvalidField = key as String?;
            });
          } else {
            setState(() {
              _currentInvalidField = null;
            });
          }
        }
      },
      builder: (context, state) {
        final invalid = state.firstInvalidField;
        final showError = state.showErrorMessages && invalid.isNotEmpty;
        final invalidKey = invalid['key'] as String?;
        final invalidError = invalid['error'] as String?;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputLabel('First Name'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _firstNameController,
              hintText: 'Enter your first name',
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.text,
              state: state,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  FirstNameChanged(value),
                );
              },
              errorText: showError && invalidKey == 'firstName' ? invalidError : null,
            ),
            SizedBox(height: 20.h),
            _buildInputLabel('Last Name'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _lastNameController,
              hintText: 'Enter your last name',
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.name,
              state: state,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  LastNameChanged(value),
                );
              },
              errorText: showError && invalidKey == 'lastName' ? invalidError : null,
            ),
            SizedBox(height: 20.h),
            _buildInputLabel('Email'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _emailController,
              hintText: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              state: state,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  EmailChanged(value),
                );
              },
              errorText: showError && invalidKey == 'email' ? invalidError : null,
            ),
            SizedBox(height: 20.h),
            _buildInputLabel('Password'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _passwordController,
              hintText: 'Create a password',
              prefixIcon: Icons.lock_outline,
              obscureText: !state.showPassword,
              state: state,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  PasswordChanged(value),
                );
              },
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
                    size: 20.sp,
                  ),
                ),
                onPressed: () {
                  context.read<RegistrationBloc>().add(
                    const ToggleShowPassword(),
                  );
                },
              ),
              errorText: showError && invalidKey == 'password' ? invalidError : null,
            ),
            // Password strength indicator
            if (_passwordController.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: _calculatePasswordStrength(_passwordController.text),
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getStrengthColor(_calculatePasswordStrength(_passwordController.text)),
                        ),
                        minHeight: 6.h,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      _getStrengthText(_calculatePasswordStrength(_passwordController.text)),
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        color: _getStrengthColor(_calculatePasswordStrength(_passwordController.text)),
                        fontWeight: FontWeight.w600,
              ),
            ),
                  ],
                ),
              ),
            SizedBox(height: 20.h),
            _buildInputLabel('Confirm Password'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm your password',
              prefixIcon: Icons.lock_outline,
              obscureText: !state.showConfirmPassword,
              state: state,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  ConfirmPasswordChanged(value),
                );
              },
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
                    state.showConfirmPassword 
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                    key: ValueKey<bool>(state.showConfirmPassword),
                    color: const Color(0xFF3F51B5),
                    size: 20.sp,
                  ),
                ),
                onPressed: () {
                  context.read<RegistrationBloc>().add(
                    const ToggleShowConfirmPassword(),
                  );
                },
              ),
              errorText: showError && invalidKey == 'confirmPassword' ? invalidError : null,
            ),
          ],
        );
      },
    );
  }
}
