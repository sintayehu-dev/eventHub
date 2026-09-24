import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/application/role_selection/bloc/role_selection_bloc.dart';
import 'package:eventhub/features/auth/application/role_selection/bloc/role_selection_event.dart';
import 'package:eventhub/features/auth/application/role_selection/bloc/role_selection_state.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<RoleSelectionBloc, RoleSelectionState>(
          listener: (context, state) {
            if (state.isSuccess) {
              AppHelpers.showSuccessSnackBar(
                context,
                'Account created successfully!',
              );
              // Navigate based on selected role
              if (state.routeName != null) {
                context.goNamed(state.routeName!);
              }
            }

            if (state.isError) {
              AppHelpers.showErrorSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('How will you\nuse Ethio Events?',
                      style: theme.textTheme.displaySmall),
                  SizedBox(height: 10.h),
                  Text(
                    'Pick a role to personalise your experience. You can change this later.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  _RoleCard(
                    icon: Icons.confirmation_number_rounded,
                    title: 'Attendee',
                    description:
                        'Discover events, buy tickets and keep them in your wallet.',
                    selected: _selectedRole == 'attendee',
                    onTap: () => setState(() => _selectedRole = 'attendee'),
                  ),
                  SizedBox(height: 16.h),
                  _RoleCard(
                    icon: Icons.event_note_rounded,
                    title: 'Organizer',
                    description:
                        'Create events, manage staff and track ticket sales.',
                    selected: _selectedRole == 'organizer',
                    onTap: () => setState(() => _selectedRole = 'organizer'),
                  ),
                  const Spacer(),
                  AppButton(
                    label: 'Continue',
                    icon: Icons.arrow_forward_rounded,
                    isLoading: state.isLoading,
                    onPressed: _selectedRole == null
                        ? null
                        : () => context.read<RoleSelectionBloc>().add(
                              RoleSelectionEvent.roleSelected(_selectedRole!),
                            ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Pressable(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: selected ? scheme.primary : scheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: scheme.primary.withValues(alpha: 0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color: scheme.shadow.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: selected ? scheme.secondary : scheme.secondaryContainer,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Icon(
                icon,
                size: 26.sp,
                color: selected ? scheme.onSecondary : scheme.secondary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: selected ? scheme.onPrimary : scheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: selected
                          ? scheme.onPrimary.withValues(alpha: 0.8)
                          : scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? scheme.secondary : Colors.transparent,
                border: Border.all(
                  color: selected ? scheme.secondary : scheme.outline,
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Icon(Icons.check_rounded,
                      size: 16.sp, color: scheme.onSecondary)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
