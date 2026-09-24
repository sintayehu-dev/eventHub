import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import '../widgets/ticket_wallet_header.dart';
import '../widgets/ticket_details/ticket_details_body.dart';

class TicketDetailsScreen extends StatelessWidget {
  final TicketEntity ticket;

  const TicketDetailsScreen({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
              child: TicketWalletHeader(
                title: 'Ticket details',
                action: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: colorScheme.onSurface,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: TicketDetailsBody(ticket: ticket),
            ),
          ],
        ),
      ),
    );
  }
}
