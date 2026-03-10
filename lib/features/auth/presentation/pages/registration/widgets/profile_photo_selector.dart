import 'dart:io';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_bloc.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_event.dart';

class ProfilePhotoSelector extends StatefulWidget {
  const ProfilePhotoSelector({super.key});

  @override
  State<ProfilePhotoSelector> createState() => _ProfilePhotoSelectorState();
}

class _ProfilePhotoSelectorState extends State<ProfilePhotoSelector> {
  final ImagePicker _picker = ImagePicker();
  String? _cachedImagePath;
  
  // Show a bottom sheet with camera and gallery options
  Future<void> _showImageSourceOptions(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_rounded),
                title: Text('Take a Photo', style: GoogleFonts.outfit()),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_rounded),
                title: Text('Choose from Gallery', style: GoogleFonts.outfit()),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              if (_cachedImagePath != null)
                ListTile(
                  leading: const Icon(Icons.delete_outline_rounded, color: Colors.red),
                  title: Text('Remove Photo', style: GoogleFonts.outfit(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context);
                    _removePhoto();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
  
  // Take a photo with the camera
  Future<void> _takePhoto() async {
    try {
      dev.log('Taking photo with camera');
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 800,
      );
      
      if (photo != null) {
        dev.log('Photo taken: ${photo.path}');
        _updateSelectedImage(photo.path);
      } else {
        dev.log('No photo taken (canceled)');
      }
    } catch (e) {
      dev.log('Error taking photo: $e');
      _showErrorSnackBar('Could not access camera');
    }
  }
  
  // Pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    try {
      dev.log('Picking image from gallery');
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
      );
      
      if (image != null) {
        dev.log('Image picked: ${image.path}');
        _updateSelectedImage(image.path);
      } else {
        dev.log('No image picked (canceled)');
      }
    } catch (e) {
      dev.log('Error picking image: $e');
      _showErrorSnackBar('Could not access gallery');
    }
  }
  
  // Remove the current photo
  void _removePhoto() {
    dev.log('Removing photo');
    _updateSelectedImage(null);
  }
  
  // Update the selected image in the state and bloc
  void _updateSelectedImage(String? path) {
    setState(() {
      _cachedImagePath = path;
    });
    
    context.read<RegistrationBloc>().add(
      ProfilePhotoChanged(path),
    );
  }
  
  // Show a snackbar with an error message
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = context.watch<RegistrationBloc>().state;
    
    // Use cached path first (for immediate UI feedback) or fallback to bloc state
    String? profilePhotoPath = _cachedImagePath;
    
    // If cached path is null, try to get it from the bloc
    if (profilePhotoPath == null) {
      profilePhotoPath = state.profilePhoto.value.fold(
        (failure) {
          // Debug log for failure
          dev.log('Profile photo failure: ${failure.toString()}');
          return null;
        },
        (path) {
          // Debug log for path
          dev.log('Profile photo path from bloc: $path');
          return path;
        },
      );
    }
    
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showImageSourceOptions(context),
            child: Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withOpacity(0.3),
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.5),
                  width: 2,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: _buildProfileImage(profilePhotoPath, colorScheme),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Profile Photo',
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          // Display current path for debugging
          if (profilePhotoPath != null)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                'Path: ${profilePhotoPath.split('/').last}',
                style: GoogleFonts.outfit(
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

           state.profilePhoto.value.fold(
            (failure) => Text(
              failure.failedValue.toString(),
              style: GoogleFonts.outfit(
                fontSize: 12.sp,
                color: Colors.red,
              ),
            ),
            (_) => const SizedBox.shrink(),
          ),
        
        ],
      ),
    );
  }
  
  Widget _buildProfileImage(String? path, ColorScheme colorScheme) {
    if (path == null) {
      return _buildPlaceholder(colorScheme);
    }
    
    // Try different ways to load the image
    try {
      // Check if file exists
      final file = File(path);
      if (file.existsSync()) {
        dev.log('Loading image from file: $path');
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            dev.log('Error loading file image: $error');
            return _buildPlaceholder(colorScheme);
          },
        );
      } else {
        dev.log('File does not exist: $path');
        
        // Try as asset if file doesn't exist
        if (path.startsWith('assets/')) {
          dev.log('Trying to load as asset: $path');
          return Image.asset(
            path,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              dev.log('Error loading asset image: $error');
              return _buildPlaceholder(colorScheme);
            },
          );
        }
        
        // Try as network image if it's a URL
        if (path.startsWith('http://') || path.startsWith('https://')) {
          dev.log('Trying to load as network image: $path');
          return Image.network(
            path,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              dev.log('Error loading network image: $error');
              return _buildPlaceholder(colorScheme);
            },
          );
        }
        
        return _buildPlaceholder(colorScheme);
      }
    } catch (e) {
      dev.log('Exception loading image: $e');
      return _buildPlaceholder(colorScheme);
    }
  }
  
  Widget _buildPlaceholder(ColorScheme colorScheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_a_photo_outlined,
          size: 40.sp,
          color: colorScheme.primary.withOpacity(0.8),
        ),
        SizedBox(height: 8.h),
        Text(
          'Add Photo',
          style: GoogleFonts.outfit(
            fontSize: 14.sp,
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
