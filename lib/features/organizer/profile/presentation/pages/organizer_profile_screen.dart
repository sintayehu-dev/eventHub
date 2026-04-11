import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/shared/profile/presentation/pages/edit_profile_screen.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/core/application/app/bloc/app_bloc.dart';
import '../widgets/organizer_profile_header.dart';
import '../widgets/organizer_profile_menu_items.dart';
import '../widgets/organizer_profile_logout_card.dart';
import '../widgets/organizer_profile_shimmer.dart';

class OrganizerProfileScreen extends StatelessWidget {
  const OrganizerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    return BlocProvider(
      create: (_) => getIt<UserProfileBloc>()
        ..add(UserProfileEvent.loadUserProfile(userId: currentUser.uid)),
      child: const OrganizerProfileView(),
    );
  }
}

class OrganizerProfileView extends StatefulWidget {
  const OrganizerProfileView({super.key});

  @override
  State<OrganizerProfileView> createState() => _OrganizerProfileViewState();
}

class _OrganizerProfileViewState extends State<OrganizerProfileView> {
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
            color: colorScheme.onSurface,
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
            initial: () => const Center(child: Text('Welcome')),
            loading: () => const OrganizerProfileShimmer(),
            loaded: (profile) => _buildProfileContent(profile),
            profileUpdated: (profile) => _buildProfileContent(profile),
            error: (message) => AppErrorRetryWidget(
              errorMessage: message,
              onRetry: () {
                final uid = getIt<UserService>().getCurrentUser()?.uid ?? '';
                context.read<UserProfileBloc>().add(
                      UserProfileEvent.loadUserProfile(userId: uid),
                    );
              },
            ),
            preferencesUpdated: (preferences) =>
                const Center(child: Text('Preferences updated')),
            profileImageUpdated: (imageUrl) =>
                const Center(child: Text('Image updated')),
            statusUpdated: () => const Center(child: Text('Status updated')),
            eventAssignmentLoaded: (assignment) =>
                const Center(child: Text('Assignment loaded')),
            staffDataUpdated: (staffData) =>
                const Center(child: Text('Staff data updated')),
            organizerDataUpdated: (organizerData) =>
                const Center(child: Text('Organizer data updated')),
            attendeeDataUpdated: (attendeeData) =>
                const Center(child: Text('Attendee data updated')),
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
          OrganizerProfileHeader(profile: profile),
          SizedBox(height: 24.h),
          const OrganizerProfileMenuItems(),
          SizedBox(height: 24.h),
          const OrganizerProfileLogoutCard(),
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
          role: UserRole.organizer,
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
}
