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

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();
    
    if (currentUser == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Text(
            'Please log in to view your profile',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

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
            loading: () => Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
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
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          _buildProfileHeader(profile, theme, colorScheme),
          SizedBox(height: 32.h),
          _buildMenuCards(theme, colorScheme),
          SizedBox(height: 32.h),
          _buildLogoutCard(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Gradient banner
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Avatar overlapping the banner
          Transform.translate(
            offset: Offset(0, -40.h),
            child: Column(
              children: [
                Container(
                  width: 88.w,
                  height: 88.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [colorScheme.primary, colorScheme.secondary],
                    ),
                    border: Border.all(
                      color: colorScheme.surface,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: profile.profileImageUrl != null
                      ? ClipOval(
                          child: Image.network(
                            profile.profileImageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.badge,
                              color: colorScheme.onPrimary,
                              size: 36.sp,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.badge,
                          color: colorScheme.onPrimary,
                          size: 36.sp,
                        ),
                ),
                SizedBox(height: 8.h),
                Text(
                  profile.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.35),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Staff Member',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Info rows
          Transform.translate(
            offset: Offset(0, -28.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  _buildHeaderInfoRow(
                      Icons.email_outlined, profile.email, theme, colorScheme),
                  if (profile.phone != null) ...[
                    SizedBox(height: 8.h),
                    _buildHeaderInfoRow(Icons.phone_outlined, profile.phone!,
                        theme, colorScheme),
                  ],
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfoRow(
      IconData icon, String text, ThemeData theme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
            size: 14.sp,
            color: colorScheme.onSurface.withValues(alpha: 0.5)),
        SizedBox(width: 6.w),
        Flexible(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.65),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCards(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      children: [
        _buildMenuCard('My Assignments', Icons.assignment_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard('Check-in Scanner', Icons.qr_code_scanner_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard('Work Schedule', Icons.schedule_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard('Performance Report', Icons.bar_chart_outlined, theme, colorScheme),
        SizedBox(height: 16.h),
        _buildMenuCard('Help & Support', Icons.help_outline, theme, colorScheme),
      ],
    );
  }

  Widget _buildMenuCard(
      String title, IconData icon, ThemeData theme, ColorScheme colorScheme) {
    return InkWell(
      onTap: () => _showToBeImplemented(context),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: colorScheme.primary,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 16.w),
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
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _showToBeImplemented(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Feature to be implemented',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onTertiary,
          ),
        ),
        backgroundColor: colorScheme.tertiary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildLogoutCard() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(16.r),
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
            size: 32.sp,
          ),
          SizedBox(height: 12.h),
          Text(
            'Sign Out',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Sign out of your account',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onErrorContainer,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Edit profile functionality coming soon'),
        backgroundColor: colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
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