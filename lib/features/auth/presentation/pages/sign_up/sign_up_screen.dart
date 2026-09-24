import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import 'package:eventhub/core/presentation/widgets/app_text_field.dart';
import 'package:eventhub/core/presentation/widgets/auth_scaffold.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/app_validation_error_widget.dart';
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
  String? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _errorFor(RegistrationState state, String key) {
    if (state.showErrorMessages && state.firstInvalidField['key'] == key) {
      return state.firstInvalidField['error'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return BlocConsumer<RegistrationBloc, RegistrationState>(
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
        final termsAccepted =
            state.termsAcceptance?.value.fold((_) => false, (r) => r) ?? false;

        return AuthScaffold(
          eyebrow: 'Create your account',
          title: 'Sign up',
          headerHeight: 190.h,
          leading: const AppBackButton(),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  label: 'Full name',
                  hintText: 'Your full name',
                  controller: _fullNameController,
                  prefixIcon: Icons.person_outline_rounded,
                  errorText: _errorFor(state, 'fullName'),
                  onChanged: (v) => context
                      .read<RegistrationBloc>()
                      .add(RegistrationEvent.fullNameChanged(v)),
                ),
                SizedBox(height: 18.h),
                AppTextField(
                  label: 'Email address',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.mail_outline_rounded,
                  errorText: _errorFor(state, 'email'),
                  onChanged: (v) => context
                      .read<RegistrationBloc>()
                      .add(RegistrationEvent.emailChanged(v)),
                ),
                SizedBox(height: 18.h),
                AppTextField(
                  label: 'Password',
                  hintText: 'Create a password',
                  controller: _passwordController,
                  obscureText: !state.showPassword,
                  prefixIcon: Icons.lock_outline_rounded,
                  errorText: _errorFor(state, 'password'),
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20.sp,
                    ),
                    onPressed: () => context
                        .read<RegistrationBloc>()
                        .add(const RegistrationEvent.toggleShowPassword()),
                  ),
                  onChanged: (v) => context
                      .read<RegistrationBloc>()
                      .add(RegistrationEvent.passwordChanged(v)),
                ),
                SizedBox(height: 24.h),
                Text('I want to', style: theme.textTheme.titleSmall),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: _RoleCard(
                        icon: Icons.confirmation_number_outlined,
                        title: 'Attend events',
                        selected: _selectedRole == 'attendee',
                        onTap: () => _selectRole('attendee'),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _RoleCard(
                        icon: Icons.event_note_outlined,
                        title: 'Organize events',
                        selected: _selectedRole == 'organizer',
                        onTap: () => _selectRole('organizer'),
                      ),
                    ),
                  ],
                ),
                if (_errorFor(state, 'userRole') != null)
                  AppValidationErrorWidget(
                    errorMessage: _errorFor(state, 'userRole'),
                  ),
                SizedBox(height: 24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: Checkbox(
                        value: termsAccepted,
                        onChanged: (v) => context.read<RegistrationBloc>().add(
                              RegistrationEvent.termsAcceptedChanged(
                                  v ?? false),
                            ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                          children: [
                            const TextSpan(text: 'I agree to the '),
                            _link(context, 'Terms of Service', RouteName.terms),
                            const TextSpan(text: ' and '),
                            _link(context, 'Privacy Policy',
                                RouteName.privacyPolicy),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (_errorFor(state, 'termsAcceptance') != null)
                  Padding(
                    padding: EdgeInsets.only(left: 36.w),
                    child: AppValidationErrorWidget(
                      errorMessage: _errorFor(state, 'termsAcceptance'),
                    ),
                  ),
                SizedBox(height: 28.h),
                AppButton(
                  label: 'Sign up',
                  isLoading: state.isLoading,
                  onPressed: () => context
                      .read<RegistrationBloc>()
                      .add(const RegistrationEvent.registrationSubmitted()),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    behavior: HitTestBehavior.opaque,
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: scheme.onSurfaceVariant),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.accentDark,
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

  void _selectRole(String value) {
    setState(() => _selectedRole = value);
    context.read<RegistrationBloc>().add(
          RegistrationEvent.userRoleChanged(value),
        );
  }

  InlineSpan _link(BuildContext context, String text, String routeName) {
    final theme = Theme.of(context);
    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: GestureDetector(
        onTap: () => context.pushNamed(routeName),
        child: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.accentDark,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Pressable(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: selected ? scheme.primary : scheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? scheme.primary : scheme.outlineVariant,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: selected
                    ? scheme.onPrimary.withValues(alpha: 0.16)
                    : scheme.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20.sp,
                color: selected ? scheme.onPrimary : scheme.secondary,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                color: selected ? scheme.onPrimary : scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
