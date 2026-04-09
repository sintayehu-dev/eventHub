import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/scanner/scanner_overlay_widget.dart';

class ScannerViewWidget extends StatelessWidget {
  final MobileScannerController controller;
  final void Function(BarcodeCapture) onQRCodeDetected;
  final bool isScanning;
  final Widget statusIndicator;

  const ScannerViewWidget({
    super.key,
    required this.controller,
    required this.onQRCodeDetected,
    required this.isScanning,
    required this.statusIndicator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            MobileScanner(
              controller: controller,
              onDetect: onQRCodeDetected,
            ),
            ScannerOverlayWidget(isScanning: isScanning),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: statusIndicator,
            ),
          ],
        ),
      ),
    );
  }
}