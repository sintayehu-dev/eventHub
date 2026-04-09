import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/core/utils/app_helpers.dart';

class TicketDetailsActions extends StatelessWidget {
  final TicketEntity ticket;

  const TicketDetailsActions({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _showQRCode(context),
            icon: const Icon(Icons.qr_code_rounded),
            label: const Text('Show QR Code'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 0,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => _shareTicket(context),
            icon: const Icon(Icons.share_rounded),
            label: const Text('Share Ticket'),
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.primary,
              side: BorderSide(color: colorScheme.primary, width: 1.5),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showQRCode(BuildContext context) {
    context.pushNamed(
      RouteName.ticketQR,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }

  void _shareTicket(BuildContext context) {
    AppHelpers.showCheckFlash(context, 'Ticket sharing feature coming soon!');
  }
}
