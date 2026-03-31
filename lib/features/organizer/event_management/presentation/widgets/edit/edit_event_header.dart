import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEventHeader extends StatelessWidget {
  final bool hasChanges;
  final VoidCallback onBack;
  final VoidCallback onSave;

  const EditEventHeader({
    super.key,
    required this.hasChanges,
    required this.onBack,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: Text(
        'Edit Event',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (hasChanges)
          TextButton(
            onPressed: onSave,
            child: Text(
              'Save',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
