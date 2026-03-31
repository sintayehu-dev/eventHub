import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

class TicketStatusBadge extends StatelessWidget {
  final TicketStatus status;

  const TicketStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (status) {
      case TicketStatus.confirmed:
        statusColor = Colors.green;
        statusText = 'Valid Ticket';
        statusIcon = Icons.check_circle;
        break;
      case TicketStatus.pending:
        statusColor = Colors.orange;
        statusText = 'Pending Confirmation';
        statusIcon = Icons.pending;
        break;
      case TicketStatus.used:
        statusColor = Colors.blue;
        statusText = 'Already Used';
        statusIcon = Icons.check_circle_outline;
        break;
      case TicketStatus.cancelled:
      case TicketStatus.refunded:
        statusColor = Colors.red;
        statusText = 'Invalid Ticket';
        statusIcon = Icons.cancel;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            statusIcon,
            color: statusColor,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            statusText,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
