import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/services/staff_qr_scanner_service.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/pages/qr_scanner_screen.dart';

class JoinEventQRScannerWidget extends StatelessWidget {
  const JoinEventQRScannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
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
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: const Color(0xFF8B5CF6),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Scan QR code to join as staff',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Description
          Text(
            'Scan the QR code provided by the event organizer to join the event as a staff member.',
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.sp,
              height: 1.4,
            ),
          ),
          SizedBox(height: 20.h),

          // Scan Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _scanQRCode(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Scan QR Code',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scanQRCode(BuildContext context) async {
    try {
      // Navigate to QR scanner screen with staff join mode
      final result = await Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => const QRScannerScreen(
            mode: QRScannerMode.staffJoin,
          ),
        ),
      );

      if (result != null && context.mounted) {
        await _processStaffQRCode(context, result);
      }
    } catch (e) {
      if (context.mounted) {
        AppHelpers.showErrorSnackBar(context, 'Failed to scan QR code: $e');
      }
    }
  }

  Future<void> _processStaffQRCode(BuildContext context, String qrCodeData) async {
    try {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF8B5CF6),
          ),
        ),
      );

      final userService = getIt<UserService>();
      final staffQRService = getIt<StaffQRScannerService>();
      final currentUser = userService.getCurrentUser()!;

      final result = await staffQRService.scanStaffQRCode(
        qrCodeData: qrCodeData,
        staffUserId: currentUser.uid,
      );

      // Close loading dialog
      if (context.mounted) {
        Navigator.pop(context);
      }

      result.fold(
        (failure) {
          if (context.mounted) {
            AppHelpers.showErrorSnackBar(context, failure.toString());
          }
        },
        (joinResult) {
          if (context.mounted) {
            _showJoinSuccessDialog(context, joinResult);
          }
        },
      );
    } catch (e) {
      // Close loading dialog
      if (context.mounted) {
        Navigator.pop(context);
        AppHelpers.showErrorSnackBar(context, 'Failed to join event: $e');
      }
    }
  }

  void _showJoinSuccessDialog(BuildContext context, dynamic joinResult) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'Joined Successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have successfully joined the event as a staff member.',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A0B2E),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event: ${joinResult.eventTitle}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Role: ${joinResult.role}',
                    style: TextStyle(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Refresh the staff home screen to show the new event
              // You might want to trigger a refresh event here
            },
            child: Text(
              'OK',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum QRScannerMode {
  ticketScan,
  staffJoin,
}