import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketQRCode extends StatelessWidget {
  final String qrData;
  final double? size;

  const TicketQRCode({
    super.key,
    required this.qrData,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        // Always dark-on-white so scanners can read it in any theme.
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: QrImageView(
        data: qrData,
        version: QrVersions.auto,
        size: size ?? 240.w,
        backgroundColor: Colors.white,
        errorCorrectionLevel: QrErrorCorrectLevel.H,
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: const Color(0xFF14303A),
        ),
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: const Color(0xFF14303A),
        ),
      ),
    );
  }
}
