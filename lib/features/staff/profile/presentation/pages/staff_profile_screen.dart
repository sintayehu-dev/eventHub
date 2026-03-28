import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

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
                      const UserProfileEvent.loadUserProfile(userId: 'current_user_id'),
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
            preferencesUpdated: (preferences) => const Center(child: Text('Preferences updated')),
            profileImageUpdated: (imageUrl) => const Center(child: Text('Image updated')),
            statusUpdated: () => const Center(child: Text('Status updated')),
            eventAssignmentLoaded: (assignment) => const Center(child: Text('Assignment loaded')),
            staffDataUpdated: (staffData) => const Center(child: Text('Staff data updated')),
            organizerDataUpdated: (organizerData) => const Center(child: Text('Organizer data updated')),
            attendeeDataUpdated: (attendeeData) => const Center(child: Text('Attendee data updated')),
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
          _buildCurrentEventInfo(profile),
          SizedBox(height: 32.h),
          _buildStaffStats(profile),
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
              colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
              width: 3,
            ),
          ),
          child: profile.profileImageUrl != null
              ? ClipOval(
                  child: Image.network(
                    profile.profileImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.badge,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                )
              : Icon(
                  Icons.badge,
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
            color: const Color(0xFF06B6D4).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'Staff Member',
            style: TextStyle(
              color: const Color(0xFF06B6D4),
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

  Widget _buildCurrentEventInfo(UserProfileEntity profile) {
    final assignment = profile.staffData?.currentEvent;
    
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
          Row(
            children: [
              Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: assignment != null ? const Color(0xFF4ADE80) : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                assignment != null ? 'Currently Active' : 'No Active Assignment',
                style: TextStyle(
                  color: assignment != null ? const Color(0xFF4ADE80) : Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            assignment?.eventTitle ?? 'No event assigned',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (assignment != null) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey[400],
                  size: 14.sp,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    '${assignment.eventLocation} • ${assignment.assignedGate ?? 'General'}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.grey[400],
                  size: 14.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  'Role: ${assignment.assignedRole}',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStaffStats(UserProfileEntity profile) {
    final staffData = profile.staffData;
    
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
            'Performance Stats',
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
                  'Events Worked',
                  '${staffData?.totalEventsWorked ?? 0}',
                  Icons.event,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  'Check-ins',
                  '${staffData?.totalCheckIns ?? 0}',
                  Icons.qr_code_scanner,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Rating',
                  '${staffData?.averageRating?.toStringAsFixed(1) ?? 'N/A'}',
                  Icons.star,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  'Hours Worked',
                  '${staffData?.totalHoursWorked ?? 0}h',
                  Icons.schedule,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
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
            color: const Color(0xFF8B5CF6),
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
          _buildInfoRow('Specializations', profile.staffData?.specializations.join(', ') ?? 'Not set'),
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
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}