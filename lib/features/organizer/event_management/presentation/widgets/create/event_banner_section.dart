import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/services/image_picker_service.dart';
import 'dart:io';

class EventBannerSection extends StatelessWidget {
  final String? selectedImagePath;
  final Function(String?) onImageSelected;

  const EventBannerSection({
    super.key,
    required this.selectedImagePath,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Event Banner'),
        SizedBox(height: 8.h),
        _buildImagePicker(context),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectImage(context),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: selectedImagePath != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.file(
                      File(selectedImagePath!),
                      width: double.infinity,
                      height: 200.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: () => onImageSelected(null),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.grey[400],
                    size: 48.sp,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Add Event Banner',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Tap to select an image',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _selectImage(BuildContext context) async {
    final imagePickerService = getIt<ImagePickerService>();
    final imagePath = await imagePickerService.showImageSourceSelectionDialog(
      context,
      currentImagePath: selectedImagePath,
      maxWidth: 1200,
      maxHeight: 800,
      imageQuality: 90,
    );

    if (imagePath != null) {
      onImageSelected(imagePath);
    }
  }
}
