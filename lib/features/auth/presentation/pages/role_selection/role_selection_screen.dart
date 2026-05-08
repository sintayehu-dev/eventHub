import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/theme/app_theme.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
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
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 60.h),

                      // Icon
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  colorScheme.primary.withValues(alpha: 0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person_outline,
                          size: darkTheme.textTheme.titleMedium?.fontSize,
                          color: colorScheme.onPrimary,
                        ),
                      ),

                      SizedBox(height: 40.h),

                      // Title
                      Text(
                        'Choose Your Role',
                        style: darkTheme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 16.h),

                      // Subtitle
                      Text(
                        'Select how you want to use Ethio Events',
                        style: darkTheme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 48.h),

                      // Attendee Card
                      _buildRoleCard(
                        icon: Icons.event_available,
                        title: 'Attendee',
                        description:
                            'Discover and attend amazing events in your area',
                        value: 'attendee',
                        isSelected: _selectedRole == 'attendee',
                        colorScheme: colorScheme,
                        darkTheme: darkTheme,
                      ),

                      SizedBox(height: 20.h),

                      // Organizer Card
                      _buildRoleCard(
                        icon: Icons.event_note,
                        title: 'Organizer',
                        description:
                            'Create and manage events for your community',
                        value: 'organizer',
                        isSelected: _selectedRole == 'organizer',
                        colorScheme: colorScheme,
                        darkTheme: darkTheme,
                      ),

                      SizedBox(height: 48.h),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: state.isLoading || _selectedRole == null
                              ? null
                              : () {
                                  context.read<RoleSelectionBloc>().add(
                                        RoleSelectionEvent.roleSelected(
                                          _selectedRole!,
                                        ),
                                      );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            disabledBackgroundColor: colorScheme.onSurface
                                .withValues(alpha: 0.12),
                            disabledForegroundColor: colorScheme.onSurface
                                .withValues(alpha: 0.38),
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
                                      'Continue',
                                      style: darkTheme.textTheme.titleMedium
                                          ?.copyWith(
                                        color: colorScheme.onPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: darkTheme
                                          .textTheme.titleMedium?.fontSize,
                                    ),
                                  ],
                                ),
                        ),
                      ),

                      SizedBox(height: 40.h),
                    ],
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
    required String description,
    required String value,
    required bool isSelected,
    required ColorScheme colorScheme,
    required ThemeData darkTheme,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.15)
              : colorScheme.onSurface.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.4),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurface.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface.withValues(alpha: 0.6),
                size: darkTheme.textTheme.titleMedium?.fontSize,
              ),
            ),

            SizedBox(width: 16.w),

            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: darkTheme.textTheme.titleMedium?.copyWith(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: darkTheme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            // Checkmark
            if (isSelected)
              Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: colorScheme.onPrimary,
                  size: 18.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
