import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/services/image_picker_service.dart';
import 'dart:io';

class EditEventBannerSection extends StatelessWidget {
  final String? selectedImagePath;
  final bool editable;
  final Function(String?) onImageSelected;

  const EditEventBannerSection({
    super.key,
    required this.selectedImagePath,
    required this.editable,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Event Banner'),
        SizedBox(height: 8.h),
        _buildImagePicker(context),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return GestureDetector(
      onTap: editable ? () => _selectImage(context) : null,
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
        ),
        child: selectedImagePath != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: selectedImagePath!.startsWith('http')
                        ? Image.network(
                            selectedImagePath!,
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildImagePlaceholder(context),
                          )
                        : Image.file(
                            File(selectedImagePath!),
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildImagePlaceholder(context),
                          ),
                  ),
                  if (editable)
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
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              )
            : _buildImagePlaceholder(context),
      ),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          editable ? Icons.add_photo_alternate_outlined : Icons.image_outlined,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          size: 48.sp,
        ),
        SizedBox(height: 12.h),
        Text(
          editable ? 'Add Event Banner' : 'No Banner Image',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (editable) ...[
          SizedBox(height: 4.h),
          Text(
            'Tap to select an image',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12.sp,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _selectImage(BuildContext context) async {
    final imagePickerService = getIt<ImagePickerService>();
    final imagePath = await imagePickerService.showImageSourceSelectionDialog(
      context,
      currentImagePath:
          selectedImagePath?.startsWith('http') == true ? null : selectedImagePath,
      maxWidth: 1200,
      maxHeight: 800,
      imageQuality: 90,
    );

    if (imagePath != null) {
      onImageSelected(imagePath);
    }
  }
}
