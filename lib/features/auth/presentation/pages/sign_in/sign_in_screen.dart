import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import 'package:eventhub/core/presentation/widgets/app_text_field.dart';
import 'package:eventhub/core/presentation/widgets/auth_scaffold.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _errorFor(LoginState state, String key) {
    if (state.showErrorMessages && state.firstInvalidField['key'] == key) {
      return state.firstInvalidField['error'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return BlocConsumer<LoginBloc, LoginState>(
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
        return AuthScaffold(
          title: 'Welcome back',
          subtitle: 'Sign in to find your next event.',
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  label: 'Email address',
                  hintText: 'you@example.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.mail_outline_rounded,
                  errorText: _errorFor(state, 'email'),
                  onChanged: (v) => context
                      .read<LoginBloc>()
                      .add(LoginEvent.emailChanged(v)),
                ),
                SizedBox(height: 20.h),
                AppTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  obscureText: !state.showPassword,
                  prefixIcon: Icons.lock_outline_rounded,
                  errorText: _errorFor(state, 'password'),
                  trailingLabel: GestureDetector(
                    onTap: () => context
                        .read<LoginBloc>()
                        .add(const LoginEvent.passwordResetRequested()),
                    child: Text(
                      'Forgot password?',
                      style: theme.textTheme.labelMedium
                          ?.copyWith(color: scheme.primary),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20.sp,
                    ),
                    onPressed: () => context
                        .read<LoginBloc>()
                        .add(const LoginEvent.toggleShowPassword()),
                  ),
                  onChanged: (v) => context
                      .read<LoginBloc>()
                      .add(LoginEvent.passwordChanged(v)),
                ),
                SizedBox(height: 28.h),
                AppButton(
                  label: 'Sign in',
                  icon: Icons.arrow_forward_rounded,
                  isLoading: state.isLoading,
                  onPressed: () => context
                      .read<LoginBloc>()
                      .add(const LoginEvent.loginSubmitted()),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text('or continue with',
                          style: theme.textTheme.bodySmall),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: OutlinedButton(
                    onPressed: () => context
                        .read<LoginBloc>()
                        .add(const LoginEvent.googleSignInSubmitted()),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: scheme.surface,
                      foregroundColor: scheme.onSurface,
                      side: BorderSide.none,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google.png',
                            width: 22.w, height: 22.w),
                        SizedBox(width: 12.w),
                        Text(
                          'Google',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                Center(
                  child: GestureDetector(
                    onTap: () => context.pushNamed(RouteName.signUp),
                    behavior: HitTestBehavior.opaque,
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: scheme.onSurfaceVariant),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: scheme.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
