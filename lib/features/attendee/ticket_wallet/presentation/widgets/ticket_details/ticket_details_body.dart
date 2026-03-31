import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import '../attendee_ticket_card.dart';
import 'ticket_details_event_section.dart';
import 'ticket_details_main_info.dart';
import 'ticket_details_actions.dart';

class TicketDetailsBody extends StatelessWidget {
  final TicketEntity ticket;

  const TicketDetailsBody({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        children: [
          // Ticket Card
          AttendeeTicketCard(
            ticket: ticket,
            onTap: () {},
            onShowQR: () => _showQRCode(context),
          ),
          SizedBox(height: 24.h),

          // Event Details
          TicketDetailsEventSection(ticket: ticket),
          SizedBox(height: 24.h),

          // Ticket Information
          TicketDetailsMainInfo(ticket: ticket),
          SizedBox(height: 24.h),

          // Actions
          if (ticket.isActive && ticket.isUpcoming)
            TicketDetailsActions(ticket: ticket),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  void _showQRCode(BuildContext context) {
    context.pushNamed(
      RouteName.ticketQR,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }
}
