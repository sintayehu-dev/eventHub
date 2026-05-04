import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/shared/profile/presentation/pages/edit_profile_screen.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_event.dart';
import 'package:eventhub/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:eventhub/core/application/app/bloc/app_bloc.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';

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
          SizedBox(height: 24.h),
          AttendeeProfileMenu(
            onTicketsTap: () => _showToBeImplemented(context),
            onPaymentTap: () => _showToBeImplemented(context),
            onNotificationsTap: () => _showToBeImplemented(context),
            onPrivacyTap: () => _showToBeImplemented(context),
            onSupportTap: () => _showToBeImplemented(context),
            onAboutTap: () => context.pushNamed(RouteName.about),
            onTermsTap: () => context.pushNamed(RouteName.terms),
            onPrivacyPolicyTap: () =>
                context.pushNamed(RouteName.privacyPolicy),
            onDeleteAccountTap: () => _showDeleteAccountDialog(context),
          ),
          SizedBox(height: 24.h),
          AttendeeLogoutCard(onLogoutTap: () => _showLogoutDialog(context)),
        ],
      ),
    );
  }

  void _showToBeImplemented(BuildContext context) {
    AppHelpers.showCheckFlash(context, 'Feature to be implemented');
  }

  void _showEditProfileDialog() {
    final currentState = context.read<UserProfileBloc>().state;
    UserProfileEntity? currentProfile;

    currentState.whenOrNull(
      loaded: (profile) => currentProfile = profile,
      profileUpdated: (profile) => currentProfile = profile,
      profileRefreshed: (profile) => currentProfile = profile,
    );

    final profileToEdit = currentProfile ??
        UserProfileEntity(
          id: getIt<UserService>().getCurrentUser()?.uid ?? '',
          email: getIt<UserService>().getCurrentUser()?.email ?? '',
          name: getIt<UserService>().getCurrentUser()?.displayName ?? '',
          role: UserRole.attendee,
        );

    // Navigate to edit profile screen
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(profile: profileToEdit),
      ),
    )
        .then((result) {
      // Refresh profile if edit was successful
      if (result == true && mounted) {
        final uid = getIt<UserService>().getCurrentUser()?.uid ?? '';
        context.read<UserProfileBloc>().add(
              UserProfileEvent.refreshProfile(userId: uid),
            );
      }
    });
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

  void _showDeleteAccountDialog(BuildContext context) {
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
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: colorScheme.error,
                size: 28.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'Delete Account',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This action cannot be undone!',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Deleting your account will permanently remove:',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8.h),
              _buildDeleteItem('• Your profile and personal information', theme,
                  colorScheme),
              _buildDeleteItem('• All events you created', theme, colorScheme),
              _buildDeleteItem(
                  '• Your event registrations and tickets', theme, colorScheme),
              _buildDeleteItem(
                  '• All uploaded photos and media', theme, colorScheme),
              _buildDeleteItem('• Your staff assignments', theme, colorScheme),
              SizedBox(height: 12.h),
              Text(
                'Are you absolutely sure you want to continue?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
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
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await _deleteAccount(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Delete Forever',
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

  Widget _buildDeleteItem(
      String text, ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Future<void> _deleteAccount(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16.h),
                  Text('Deleting account...'),
                ],
              ),
            ),
          ),
        );
      },
    );

    final deleteAccountUseCase = getIt<DeleteAccountUseCase>();
    final result = await deleteAccountUseCase();

    if (!context.mounted) return;

    // Hide loading dialog
    Navigator.of(context).pop();

    result.fold(
      (error) {
        // Show error message
        final errorMessage = NetworkExceptions.getRawErrorMessage(error);
        AppHelpers.showErrorFlash(
          context,
          errorMessage.isNotEmpty
              ? errorMessage
              : 'Failed to delete account. Please try again.',
        );
      },
      (_) {
        // Account deleted successfully
        AppHelpers.showCheckFlash(context, 'Account deleted successfully');

        // Sign out and navigate to login page
        context.read<AuthStatusBloc>().add(const AuthStatusEvent.signOut());
        
        // Navigate to login page
        Future.delayed(const Duration(milliseconds: 500), () {
          if (context.mounted) {
            context.goNamed(RouteName.login);
          }
        });
      },
    );
  }
}
