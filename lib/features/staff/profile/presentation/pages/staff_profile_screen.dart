import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/shared/profile/presentation/pages/edit_profile_screen.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_event.dart';
import 'package:eventhub/core/application/app/bloc/app_bloc.dart';
import '../widgets/staff_profile_shimmer.dart';

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    return BlocProvider(
      create: (_) => getIt<UserProfileBloc>()
        ..add(UserProfileEvent.loadUserProfile(userId: currentUser.uid)),
      child: const StaffProfileView(),
    );
  }
}

class StaffProfileView extends StatefulWidget {
  const StaffProfileView({super.key});

  @override
  State<StaffProfileView> createState() => _StaffProfileViewState();
}

class _StaffProfileViewState extends State<StaffProfileView> {

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
            loading: () => const StaffProfileShimmer(),
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
                      final uid = getIt<UserService>().getCurrentUser()?.uid ?? '';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
          20.w, 20.w, 20.w, 90.h), // Added bottom padding for nav bar
      child: Column(
        children: [
          _buildProfileHeader(profile, theme, colorScheme),
          SizedBox(height: 24.h),
          _buildMenuCards(theme, colorScheme),
          SizedBox(height: 24.h),
          _buildLogoutCard(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
            colorScheme.surfaceContainer.withValues(alpha: 0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary.withValues(alpha: 0.8),
                  colorScheme.secondary.withValues(alpha: 0.9),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.surface,
              ),
              child: ClipOval(
                child: profile.profileImageUrl != null
                    ? Image.network(
                        profile.profileImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primary,
                                colorScheme.secondary
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.badge_rounded,
                            color: colorScheme.onPrimary,
                            size: 28.sp,
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.secondary
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.badge_rounded,
                          color: colorScheme.onPrimary,
                          size: 28.sp,
                        ),
                      ),
              ),
            ),
          ),

          SizedBox(width: 16.w),

          // Name and Role Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary.withValues(alpha: 0.2),
                        colorScheme.primary.withValues(alpha: 0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.work_rounded,
                        size: 14.sp,
                        color: colorScheme.primary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Staff',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMenuCards(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      children: [
        _buildMenuCard('My Assignments', Icons.assignment_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard('Check-in Scanner', Icons.qr_code_scanner_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard('Work Schedule', Icons.schedule_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard('Performance Report', Icons.bar_chart_outlined, theme, colorScheme),
        SizedBox(height: 10.h),
        _buildMenuCard('Help & Support', Icons.help_outline, theme, colorScheme),
      ],
    );
  }

  Widget _buildMenuCard(
      String title, IconData icon, ThemeData theme, ColorScheme colorScheme) {
    return InkWell(
      onTap: () => _showToBeImplemented(context),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: colorScheme.primary,
                size: 18.sp,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurfaceVariant,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _showToBeImplemented(BuildContext context) {
    AppHelpers.showInfoSnackBar(context, 'Feature to be implemented');
  }

  Widget _buildLogoutCard() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: colorScheme.error.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.logout,
            color: colorScheme.error,
            size: 24.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            'Sign Out',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Sign out of your account',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onErrorContainer,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Sign Out',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onError,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
          role: UserRole.staff,
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
}