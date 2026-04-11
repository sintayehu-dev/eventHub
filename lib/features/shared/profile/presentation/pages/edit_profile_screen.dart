import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
import 'package:eventhub/features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

class EditProfileScreen extends StatelessWidget {
  final UserProfileEntity profile;

  const EditProfileScreen({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserProfileBloc>(),
      child: EditProfileView(profile: profile),
    );
  }
}

class EditProfileView extends StatefulWidget {
  final UserProfileEntity profile;

  const EditProfileView({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  
  // Role-specific controllers
  final _organizationNameController = TextEditingController();
  final _websiteController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  final _emergencyContactPhoneController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  String? _selectedImagePath;
  List<String> _selectedInterests = [];
  List<String> _selectedSpecializations = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController.text = widget.profile.name;
    _phoneController.text = widget.profile.phone ?? '';
    _emailController.text = widget.profile.email;
    
    // Initialize role-specific data
    if (widget.profile.organizerData != null) {
      _organizationNameController.text = widget.profile.organizerData!.organizationName ?? '';
      _websiteController.text = widget.profile.organizerData!.website ?? '';
      _descriptionController.text = widget.profile.organizerData!.description ?? '';
    }
    
    if (widget.profile.attendeeData != null) {
      _selectedInterests = List.from(widget.profile.attendeeData!.interests);
      _emergencyContactController.text = widget.profile.attendeeData!.emergencyContact ?? '';
      _emergencyContactPhoneController.text = widget.profile.attendeeData!.emergencyContactPhone ?? '';
      _dateOfBirthController.text = widget.profile.attendeeData!.dateOfBirth ?? '';
    }
    
    if (widget.profile.staffData != null) {
      _selectedSpecializations = List.from(widget.profile.staffData!.specializations);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _organizationNameController.dispose();
    _websiteController.dispose();
    _descriptionController.dispose();
    _emergencyContactController.dispose();
    _emergencyContactPhoneController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocListener<UserProfileBloc, UserProfileState>(
      listenWhen: (previous, current) {
        // Listen for profile update success or error
        if (current.maybeWhen(
          profileUpdated: (_) => true,
          error: (_) => true,
          orElse: () => false,
        )) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        state.whenOrNull(
          profileUpdated: (profile) {
            AppHelpers.showSuccessSnackBar(context, 'Profile updated successfully');
            Navigator.of(context).pop(true); // Return true to indicate success
          },
          error: (message) {
            AppHelpers.showErrorSnackBar(context, message);
          },
        );
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Edit Profile',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                return TextButton(
                  onPressed: isLoading ? null : () => _saveProfile(context),
                  child: isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: SpinKitLoadingWidget(
                            color: colorScheme.primary,
                            size: 20.w,
                          ),
                        )
                      : Text(
                          'Save',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
        body: _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileImageSection(),
            SizedBox(height: 32.h),
            _buildBasicInfoSection(),
            SizedBox(height: 24.h),
            _buildRoleSpecificSection(),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: colorScheme.primaryContainer,
            backgroundImage: _selectedImagePath != null
                ? NetworkImage(_selectedImagePath!)
                : (widget.profile.profileImageUrl != null
                    ? NetworkImage(widget.profile.profileImageUrl!)
                    : null),
            child: (widget.profile.profileImageUrl == null && _selectedImagePath == null)
                ? Icon(
                    Icons.person,
                    size: 60.sp,
                    color: colorScheme.onPrimaryContainer,
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: colorScheme.onPrimary,
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Basic Information'),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _nameController,
          label: 'Full Name',
          hint: 'Enter your full name',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Name is required';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _emailController,
          label: 'Email',
          hint: 'Enter your email',
          enabled: false, // Email should not be editable
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _phoneController,
          label: 'Phone Number',
          hint: 'Enter your phone number',
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildRoleSpecificSection() {
    switch (widget.profile.role) {
      case UserRole.organizer:
        return _buildOrganizerSection();
      case UserRole.attendee:
        return _buildAttendeeSection();
      case UserRole.staff:
        return _buildStaffSection();
      case UserRole.admin:
        return _buildAdminSection();
    }
  }

  Widget _buildOrganizerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Organization Information'),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _organizationNameController,
          label: 'Organization Name',
          hint: 'Enter your organization name',
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _websiteController,
          label: 'Website',
          hint: 'Enter your website URL',
          keyboardType: TextInputType.url,
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _descriptionController,
          label: 'Description',
          hint: 'Tell us about your organization',
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildAttendeeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Personal Information'),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _dateOfBirthController,
          label: 'Date of Birth',
          hint: 'YYYY-MM-DD',
          keyboardType: TextInputType.datetime,
        ),
        SizedBox(height: 16.h),
        _buildInterestsSection(),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _emergencyContactController,
          label: 'Emergency Contact Name',
          hint: 'Enter emergency contact name',
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: _emergencyContactPhoneController,
          label: 'Emergency Contact Phone',
          hint: 'Enter emergency contact phone',
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildStaffSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Staff Information'),
        SizedBox(height: 16.h),
        _buildSpecializationsSection(),
      ],
    );
  }

  Widget _buildAdminSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Admin Information'),
        SizedBox(height: 16.h),
        Text(
          'Admin profiles have additional privileges and settings.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildInterestsSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final availableInterests = [
      'Music', 'Sports', 'Technology', 'Art', 'Food', 'Travel',
      'Business', 'Education', 'Health', 'Entertainment', 'Fashion', 'Gaming'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interests',
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: availableInterests.map((interest) {
            final isSelected = _selectedInterests.contains(interest);
            return FilterChip(
              label: Text(interest),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedInterests.add(interest);
                  } else {
                    _selectedInterests.remove(interest);
                  }
                });
              },
              backgroundColor: colorScheme.surfaceContainerHighest,
              selectedColor: colorScheme.primaryContainer,
              labelStyle: theme.textTheme.labelSmall?.copyWith(
                color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSpecializationsSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final availableSpecializations = [
      'Event Setup', 'Security', 'Registration', 'Technical Support',
      'Customer Service', 'Catering', 'Photography', 'Sound & Lighting'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specializations',
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: availableSpecializations.map((specialization) {
            final isSelected = _selectedSpecializations.contains(specialization);
            return FilterChip(
              label: Text(specialization),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedSpecializations.add(specialization);
                  } else {
                    _selectedSpecializations.remove(specialization);
                  }
                });
              },
              backgroundColor: colorScheme.surfaceContainerHighest,
              selectedColor: colorScheme.primaryContainer,
              labelStyle: theme.textTheme.labelSmall?.copyWith(
                color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool enabled = true,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          enabled: enabled,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: enabled ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            ),
            filled: true,
            fillColor: enabled ? colorScheme.surfaceContainerHighest : colorScheme.surfaceContainerHigh,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  void _saveProfile(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();
    
    if (currentUser == null) {
      AppHelpers.showErrorSnackBar(context, 'User not found');
      return;
    }

    // Create updated profile based on role
    UserProfileEntity updatedProfile = widget.profile.copyWith(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
    );

    // Update role-specific data
    switch (widget.profile.role) {
      case UserRole.organizer:
        updatedProfile = updatedProfile.copyWith(
          organizerData: widget.profile.organizerData?.copyWith(
            organizationName: _organizationNameController.text.trim().isEmpty 
                ? null 
                : _organizationNameController.text.trim(),
            website: _websiteController.text.trim().isEmpty 
                ? null 
                : _websiteController.text.trim(),
            description: _descriptionController.text.trim().isEmpty 
                ? null 
                : _descriptionController.text.trim(),
          ) ?? OrganizerProfileData(
            organizationName: _organizationNameController.text.trim().isEmpty 
                ? null 
                : _organizationNameController.text.trim(),
            website: _websiteController.text.trim().isEmpty 
                ? null 
                : _websiteController.text.trim(),
            description: _descriptionController.text.trim().isEmpty 
                ? null 
                : _descriptionController.text.trim(),
          ),
        );
        break;
      case UserRole.attendee:
        updatedProfile = updatedProfile.copyWith(
          attendeeData: widget.profile.attendeeData?.copyWith(
            interests: _selectedInterests,
            emergencyContact: _emergencyContactController.text.trim().isEmpty 
                ? null 
                : _emergencyContactController.text.trim(),
            emergencyContactPhone: _emergencyContactPhoneController.text.trim().isEmpty 
                ? null 
                : _emergencyContactPhoneController.text.trim(),
            dateOfBirth: _dateOfBirthController.text.trim().isEmpty 
                ? null 
                : _dateOfBirthController.text.trim(),
          ) ?? AttendeeProfileData(
            interests: _selectedInterests,
            emergencyContact: _emergencyContactController.text.trim().isEmpty 
                ? null 
                : _emergencyContactController.text.trim(),
            emergencyContactPhone: _emergencyContactPhoneController.text.trim().isEmpty 
                ? null 
                : _emergencyContactPhoneController.text.trim(),
            dateOfBirth: _dateOfBirthController.text.trim().isEmpty 
                ? null 
                : _dateOfBirthController.text.trim(),
          ),
        );
        break;
      case UserRole.staff:
        updatedProfile = updatedProfile.copyWith(
          staffData: widget.profile.staffData?.copyWith(
            specializations: _selectedSpecializations,
          ) ?? StaffProfileData(
            specializations: _selectedSpecializations,
          ),
        );
        break;
      case UserRole.admin:
        // Admin profiles don't have additional editable fields in this implementation
        break;
    }

    // Update profile image if selected
    if (_selectedImagePath != null) {
      context.read<UserProfileBloc>().add(
        UserProfileEvent.updateProfileImage(
          userId: currentUser.uid,
          imagePath: _selectedImagePath!,
        ),
      );
    }

    // Update the profile
    context.read<UserProfileBloc>().add(
      UserProfileEvent.updateUserProfile(
        userId: currentUser.uid,
        profile: updatedProfile,
      ),
    );
  }
}