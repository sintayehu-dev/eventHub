import 'package:flutter/material.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';

class ScannerStatusIndicatorWidget extends StatelessWidget {
  final TicketScannerState state;

  const ScannerStatusIndicatorWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine icon based on state
    Widget icon;
    String statusText;

    if (state.hasError) {
      icon = Icon(Icons.error, color: colorScheme.error, size: 16);
      statusText = 'Error occurred';
    } else if (state.isLoading) {
      icon = SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(colorScheme.primary),
        ),
      );
      statusText = 'Loading...';
    } else if (state.isValidating) {
      icon = SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(colorScheme.primary),
        ),
      );
      statusText = 'Validating ticket...';
    } else if (state.isCheckingIn) {
      icon = SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(colorScheme.primary),
        ),
      );
      statusText = 'Checking in...';
    } else if (state.isTicketValidated) {
      icon = const Icon(Icons.check_circle, color: Colors.green, size: 16);
      statusText = 'Ticket validated';
    } else if (state.isCheckInSuccessful) {
      icon = const Icon(Icons.check_circle, color: Colors.green, size: 16);
      statusText = 'Check-in successful';
    } else if (state.isCheckInFailed) {
      icon = Icon(Icons.error, color: colorScheme.error, size: 16);
      statusText = 'Check-in failed';
    } else if (state.isScanning) {
      icon = const Icon(Icons.qr_code_scanner, color: Colors.green, size: 16);
      statusText = 'Scanning for QR codes';
    } else {
      icon = Icon(Icons.qr_code_scanner, color: colorScheme.primary, size: 16);
      statusText = 'Ready to scan';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            statusText,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}