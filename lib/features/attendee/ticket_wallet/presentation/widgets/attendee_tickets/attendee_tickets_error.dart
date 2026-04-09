import 'package:flutter/material.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';

class AttendeeTicketsError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const AttendeeTicketsError({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AppErrorRetryWidget(
      errorMessage: error,
      onRetry: onRetry,
    );
  }
}
