import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

class AttendeeProfileScreen extends StatelessWidget {
  const AttendeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();
    
    if (currentUser == null) {
      return const Scaffold(
        backgroundColor: Color(0xFF1A0B2E),
        body: Center(
          child: Text(
            'Please log in to view your profile',
            style: TextStyle(color: Colors.white),
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
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showEditProfileDialog(),
            icon: Icon(
              Icons.edit,
              color: const Color(0xFF8B5CF6),
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Welcome')),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF8B5CF6),
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
                    color: const Color(0xFFEF4444),
                    size: 48.sp,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Error loading profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () => context.read<UserProfileBloc>().add(
                          const UserProfileEvent.loadUserProfile(
                              userId: 'current_user_id'),
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5CF6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Retry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
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
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          _buildProfileHeader(profile),
          SizedBox(height: 32.h),
          _buildAttendeeStats(profile),
          SizedBox(height: 32.h),
          _buildFavoriteCategories(profile),
          SizedBox(height: 32.h),
          _buildRecentEvents(profile),
          SizedBox(height: 32.h),
          _buildPersonalInfo(profile),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserProfileEntity profile) {
    return Column(
      children: [
        // Profile Avatar
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF10B981), Color(0xFF059669)],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF10B981).withValues(alpha: 0.3),
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
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                )
              : Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40.sp,
                ),
        ),
        SizedBox(height: 16.h),
        
        // Name and Role
        Text(
          profile.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'Event Attendee',
            style: TextStyle(
              color: const Color(0xFF10B981),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          profile.email,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16.sp,
          ),
        ),
        if (profile.phone != null) ...[
          SizedBox(height: 4.h),
          Text(
            profile.phone!,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14.sp,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAttendeeStats(UserProfileEntity profile) {
    final attendeeData = profile.attendeeData;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
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
                  const Color(0xFF10B981),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  'Tickets Purchased',
                  'N/A',
                  Icons.confirmation_number,
                  const Color(0xFF8B5CF6),
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
                  const Color(0xFFF59E0B),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  'Member Since',
                  profile.createdAt?.year.toString() ?? 'N/A',
                  Icons.calendar_today,
                  const Color(0xFF06B6D4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A0B2E),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCategories(UserProfileEntity profile) {
    final interests = profile.attendeeData?.interests ?? [];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interests',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
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
                    color: Colors.grey[400],
                    size: 48.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'No interests set yet',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.sp,
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
                  .map((interest) => _buildCategoryChip(interest))
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF10B981).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF10B981).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: const Color(0xFF10B981),
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildRecentEvents(UserProfileEntity profile) {
    final favoriteEventTypes = profile.attendeeData?.favoriteEventTypes ?? [];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Event Types',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
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
                    color: Colors.grey[400],
                    size: 48.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'No favorite event types',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            )
          else
            ...favoriteEventTypes
                .take(3)
                .map((eventType) => _buildEventItem(eventType)),
        ],
      ),
    );
  }

  Widget _buildEventItem(String eventName) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A0B2E),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.event,
              color: const Color(0xFF10B981),
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              eventName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[600],
            size: 16.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo(UserProfileEntity profile) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
              'Date of Birth', profile.attendeeData?.dateOfBirth ?? 'Not set'),
          _buildInfoRow('Emergency Contact',
              profile.attendeeData?.emergencyContact ?? 'Not set'),
          _buildInfoRow('Emergency Phone',
              profile.attendeeData?.emergencyContactPhone ?? 'Not set'),
          _buildInfoRow('Status', profile.status.displayName),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog() {
    // TODO: Implement edit profile functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Edit profile functionality coming soon'),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}