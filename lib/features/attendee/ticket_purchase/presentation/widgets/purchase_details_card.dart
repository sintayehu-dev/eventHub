import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

class PurchaseDetailsCard extends StatelessWidget {
  final PurchaseResult purchaseResult;

  const PurchaseDetailsCard({
    super.key,
    required this.purchaseResult,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      color: colorScheme.primaryContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purchase Details',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            _buildDetailRow(
              'Transaction ID',
              purchaseResult.transactionId,
              theme,
              colorScheme,
            ),
            _buildDetailRow(
              'Tickets Count',
              '${purchaseResult.tickets.length}',
              theme,
              colorScheme,
            ),
            _buildDetailRow(
              'Total Paid',
              '\$${purchaseResult.totalAmount.toStringAsFixed(2)}',
              theme,
              colorScheme,
              isTotal: true,
            ),
            _buildDetailRow(
              'Payment Status',
              purchaseResult.paymentStatus.displayName,
              theme,
              colorScheme,
              statusColor: _getStatusColor(purchaseResult.paymentStatus, colorScheme),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    ThemeData theme,
    ColorScheme colorScheme, {
    bool isTotal = false,
    Color? statusColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: statusColor ?? (isTotal ? colorScheme.primary : colorScheme.onSurface),
              fontWeight: (isTotal || statusColor != null) ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(PaymentStatus status, ColorScheme colorScheme) {
    switch (status) {
      case PaymentStatus.completed:
        return Colors.green;
      case PaymentStatus.failed:
        return colorScheme.error;
      case PaymentStatus.pending:
        return Colors.orange;
      case PaymentStatus.cancelled:
        return colorScheme.outline;
    }
  }
}
