import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/presentation/widgets/form_section.dart';
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
    return FormSection(
      title: 'Cover image',
      subtitle: 'A good photo gets more people to open your event',
      icon: Icons.image_rounded,
      child: _buildImagePicker(context),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return GestureDetector(
      onTap: () => _selectImage(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: SizedBox(
          width: double.infinity,
          height: 190.h,
          child: selectedImagePath != null
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(File(selectedImagePath!), fit: BoxFit.cover),
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: Row(
                        children: [
                          _RoundButton(
                            icon: Icons.edit_rounded,
                            onTap: () => _selectImage(context),
                          ),
                          SizedBox(width: 8.w),
                          _RoundButton(
                            icon: Icons.close_rounded,
                            onTap: () => onImageSelected(null),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(
                      color: scheme.outlineVariant,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.w,
                        decoration: BoxDecoration(
                          color: scheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add_photo_alternate_rounded,
                            color: scheme.onSecondary, size: 26.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text('Add cover image',
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 2.h),
                      Text(
                        'Take a photo or choose from gallery',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
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

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: scheme.surface,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18.sp, color: scheme.onSurface),
      ),
    );
  }
}
