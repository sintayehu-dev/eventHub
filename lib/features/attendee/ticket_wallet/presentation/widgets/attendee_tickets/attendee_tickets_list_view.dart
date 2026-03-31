import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import '../attendee_ticket_card.dart';

class AttendeeTicketsListView extends StatelessWidget {
  final List<TicketEntity> tickets;

  const AttendeeTicketsListView({
    super.key,
    required this.tickets,
  });

  @override
  Widget build(BuildContext context) {
    if (tickets.isEmpty) {
      return const _EmptyTicketsView();
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: AttendeeTicketCard(
            ticket: ticket,
            onTap: () => _viewTicketDetails(context, ticket),
            onShowQR: () => _showQRCode(context, ticket),
          ),
        );
      },
    );
  }

  void _viewTicketDetails(BuildContext context, TicketEntity ticket) {
    context.pushNamed(
      RouteName.ticketDetails,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }

  void _showQRCode(BuildContext context, TicketEntity ticket) {
    context.pushNamed(
      RouteName.ticketQR,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }
}

class _EmptyTicketsView extends StatelessWidget {
  const _EmptyTicketsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.confirmation_number_outlined,
            color: colorScheme.primary.withValues(alpha: 0.5),
            size: 64.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            'No tickets found',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
