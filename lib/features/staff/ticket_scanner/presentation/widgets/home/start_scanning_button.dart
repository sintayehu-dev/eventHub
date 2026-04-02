import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

class StartScanningButton extends StatelessWidget {
  final StaffEventAssignmentEntity? selectedEvent;

  const StartScanningButton({
    super.key,
    this.selectedEvent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedEvent != null
            ? () => _startScanning(context, selectedEvent!)
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'Start Scanning',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startScanning(
      BuildContext context, StaffEventAssignmentEntity selectedEvent) {
    // Navigate to QR scanner screen with selected event
    context.push(
        '/staff/qr-scanner?eventId=${selectedEvent.eventId}&eventTitle=${selectedEvent.eventTitle}');
  }
}