import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_event.dart';
import 'package:eventhub/core/application/app/bloc/app_bloc.dart';
import 'package:eventhub/core/utils/app_helpers.dart';

import '../widgets/attendee_profile_header.dart';
import '../widgets/attendee_profile_menu.dart';
import '../widgets/attendee_logout_card.dart';
import '../widgets/attendee_profile_shimmer.dart';

class AttendeeProfileScreen extends StatelessWidget {
  const AttendeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    return BlocProvider(
      create: (_) => getIt<UserProfileBloc>()
        ..add(UserProfileEvent.loadUserProfile(userId: currentUser.uid)),
      child: const AttendeeProfileView(),
    );
  }
}

class AttendeeProfileView extends StatefulWidget {
  const AttendeeProfileView({super.key});

  @override
  State<AttendeeProfileView> createState() => _AttendeeProfileViewState();
}

class _AttendeeProfileViewState extends State<AttendeeProfileView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showEditProfileDialog(),
            icon: Icon(
              Icons.edit,
              color: colorScheme.primary,
              size: 24.sp,
            ),
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, appState) {
              return IconButton(
                onPressed: () {
                  context.read<AppBloc>().add(
                      AppEvent.changeTheme(isDarkMode: !appState.isDarkMode));
                },
                icon: Icon(
                  appState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: colorScheme.primary,
                  size: 24.sp,
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: Text(
                'Welcome',
                style: theme.textTheme.titleMedium,
              ),
            ),
            loading: () => const AttendeeProfileShimmer(),
            loaded: (profile) => _buildProfileContent(profile),
            profileUpdated: (profile) => _buildProfileContent(profile),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: colorScheme.error,
                    size: 48.sp,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Error loading profile',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      final uid =
                          getIt<UserService>().getCurrentUser()?.uid ?? '';
                      context.read<UserProfileBloc>().add(
                            UserProfileEvent.loadUserProfile(userId: uid),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Retry',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferencesUpdated: (preferences) => Center(
              child: Text(
                'Preferences updated',
                style: theme.textTheme.titleMedium,
              ),
            ),
            profileImageUpdated: (imageUrl) => Center(
              child: Text(
                'Image updated',
                style: theme.textTheme.titleMedium,
              ),
            ),
            statusUpdated: () => Center(
              child: Text(
                'Status updated',
                style: theme.textTheme.titleMedium,
              ),
            ),
            eventAssignmentLoaded: (assignment) => Center(
              child: Text(
                'Assignment loaded',
                style: theme.textTheme.titleMedium,
              ),
            ),
            staffDataUpdated: (staffData) => Center(
              child: Text(
                'Staff data updated',
                style: theme.textTheme.titleMedium,
              ),
            ),
            organizerDataUpdated: (organizerData) => Center(
              child: Text(
                'Organizer data updated',
                style: theme.textTheme.titleMedium,
              ),
            ),
            attendeeDataUpdated: (attendeeData) => Center(
              child: Text(
                'Attendee data updated',
                style: theme.textTheme.titleMedium,
              ),
            ),
            profileRefreshed: (profile) => _buildProfileContent(profile),
          );
        },
      ),
    );
  }

  Widget _buildProfileContent(UserProfileEntity profile) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
          20.w, 20.w, 20.w, 90.h), // Added bottom padding for nav bar
      child: Column(
        children: [
          AttendeeProfileHeader(profile: profile),
          SizedBox(height: 32.h),
          AttendeeProfileMenu(
            onTicketsTap: () => _showToBeImplemented(context),
            onPaymentTap: () => _showToBeImplemented(context),
            onNotificationsTap: () => _showToBeImplemented(context),
            onPrivacyTap: () => _showToBeImplemented(context),
            onSupportTap: () => _showToBeImplemented(context),
          ),
          SizedBox(height: 32.h),
          AttendeeLogoutCard(onLogoutTap: () => _showLogoutDialog(context)),
        ],
      ),
    );
  }

  void _showToBeImplemented(BuildContext context) {
    AppHelpers.showCheckFlash(context, 'Feature to be implemented');
  }

  void _showEditProfileDialog() {
    AppHelpers.showCheckFlash(
        context, 'Edit profile functionality coming soon');
  }

  void _showLogoutDialog(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            'Logout',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'Cancel',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context
                    .read<AuthStatusBloc>()
                    .add(const AuthStatusEvent.signOut());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Logout',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onError,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
