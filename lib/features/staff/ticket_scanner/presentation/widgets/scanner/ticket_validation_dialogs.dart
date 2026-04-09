import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/core/utils/app_helpers.dart';

class TicketValidationDialogs {
  static void showValidationResult(
    BuildContext context,
    TicketValidationResult result,
    String eventId,
    String staffId,
    VoidCallback onReset,
  ) {
    if (result.isValid) {
      _showValidTicketDialog(context, result, eventId, staffId, onReset);
    } else {
      _showInvalidTicketDialog(context, result, onReset);
    }
  }

  static void _showValidTicketDialog(
    BuildContext context,
    TicketValidationResult result,
    String eventId,
    String staffId,
    VoidCallback onReset,
  ) {
    // Store reference to the bloc before showing dialog
    final ticketScannerBloc = context.read<TicketScannerBloc>();
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Valid Ticket'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.ticketHolderName != null) ...[
              Text('Holder: ${result.ticketHolderName}'),
              const SizedBox(height: 4),
            ],
            if (result.ticketTypeName != null) ...[
              Text('Type: ${result.ticketTypeName}'),
              const SizedBox(height: 4),
            ],
            if (result.eventTitle != null) ...[
              Text('Event: ${result.eventTitle}'),
              const SizedBox(height: 4),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              onReset();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              // Use the stored bloc reference instead of trying to read from dialog context
              ticketScannerBloc.add(
                TicketScannerEvent.checkInTicket(
                  ticketId: result.ticketId,
                  eventId: eventId,
                  staffId: staffId,
                ),
              );
            },
            child: const Text('Check In'),
          ),
        ],
      ),
    );
  }

  static void _showInvalidTicketDialog(
    BuildContext context,
    TicketValidationResult result,
    VoidCallback onReset,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 8),
            Text(result.status.displayName),
          ],
        ),
        content: Text(result.errorMessage ?? result.status.description),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onReset();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void showCheckInSuccess(BuildContext context, CheckInEntity checkIn, VoidCallback onReset) {
    // Navigate to success screen or show success message
    AppHelpers.showSuccessSnackBar(context, 'Check-in successful!');
    onReset();
  }

  static void showCheckInFailed(
    BuildContext context,
    TicketValidationResult result,
    VoidCallback onReset,
  ) {
    _showInvalidTicketDialog(context, result, onReset);
  }

  static void showError(BuildContext context, String message, VoidCallback onReset) {
    AppHelpers.showErrorSnackBar(context, 'Error: $message');
    onReset();
  }
}