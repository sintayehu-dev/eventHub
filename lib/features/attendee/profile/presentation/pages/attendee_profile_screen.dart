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

class AttendeeProfileScreen extends StatelessWidget {
  const AttendeeProfileScreen({super.key});

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
          _buildAttendeeStats(profile, theme, colorScheme),
          SizedBox(height: 32.h),
          _buildFavoriteCategories(profile, theme, colorScheme),
          SizedBox(height: 32.h),
          _buildRecentEvents(profile, theme, colorScheme),
          SizedBox(height: 32.h),
          _buildPersonalInfo(profile, theme, colorScheme),
          SizedBox(height: 32.h),
          _buildLogoutCard(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(
      UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    return Column(
      children: [
        // Profile Avatar
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorScheme.tertiary, colorScheme.secondary],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.tertiary.withValues(alpha: 0.3),
              width: 3,
            ),
          ),
          child: profile.profileImageUrl != null
              ? ClipOval(
                  child: Image.network(
                    profile.profileImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.person,
                      color: colorScheme.onTertiary,
                      size: 40.sp,
                    ),
                  ),
                )
              : Icon(
                  Icons.person,
                  color: colorScheme.onTertiary,
                  size: 40.sp,
                ),
        ),
        SizedBox(height: 16.h),
        
        // Name and Role
        Text(
          profile.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colorScheme.tertiary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'Event Attendee',
            style: theme.textTheme.labelLarge?.copyWith(
              color: colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          profile.email,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        if (profile.phone != null) ...[
          SizedBox(height: 4.h),
          Text(
            profile.phone!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAttendeeStats(
      UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    final attendeeData = profile.attendeeData;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event Statistics',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Events Attended',
                  '${attendeeData?.totalEventsAttended ?? 0}',
                  Icons.event,
                  colorScheme.tertiary,
                  theme,
                  colorScheme,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  'Tickets Purchased',
                  'N/A',
                  Icons.confirmation_number,
                  colorScheme.primary,
                  theme,
                  colorScheme,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Total Spent',
                  'N/A',
                  Icons.attach_money,
                  colorScheme.secondary,
                  theme,
                  colorScheme,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  'Member Since',
                  profile.createdAt?.year.toString() ?? 'N/A',
                  Icons.calendar_today,
                  Colors.blue,
                  theme,
                  colorScheme,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color,
      ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCategories(
      UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    final interests = profile.attendeeData?.interests ?? [];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interests',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          if (interests.isEmpty)
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.category,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    size: 48.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'No interests set yet',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            )
          else
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: interests
                  .map((interest) =>
                      _buildCategoryChip(interest, theme, colorScheme))
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(
      String category, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: colorScheme.tertiary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: colorScheme.tertiary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        category,
        style: theme.textTheme.labelMedium?.copyWith(
          color: colorScheme.tertiary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildRecentEvents(
      UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    final favoriteEventTypes = profile.attendeeData?.favoriteEventTypes ?? [];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Event Types',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          if (favoriteEventTypes.isEmpty)
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.event_busy,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    size: 48.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'No favorite event types',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            )
          else
            ...favoriteEventTypes
                .take(3)
                .map(
                (eventType) => _buildEventItem(eventType, theme, colorScheme)),
        ],
      ),
    );
  }

  Widget _buildEventItem(
      String eventName, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.event,
              color: colorScheme.tertiary,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              eventName,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
            size: 16.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo(
      UserProfileEntity profile, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
              'Date of Birth',
              profile.attendeeData?.dateOfBirth ?? 'Not set',
              theme,
              colorScheme),
          _buildInfoRow('Emergency Contact',
              profile.attendeeData?.emergencyContact ?? 'Not set',
              theme,
              colorScheme),
          _buildInfoRow('Emergency Phone',
              profile.attendeeData?.emergencyContactPhone ?? 'Not set',
              theme,
              colorScheme),
          _buildInfoRow(
              'Status', profile.status.displayName, theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      String label, String value, ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
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
        backgroundColor: colorScheme.tertiary,
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