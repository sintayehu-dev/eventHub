import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import '../attendee_tickets/attendee_tickets_list_view.dart';

class TicketWalletSearchResults extends StatelessWidget {
  final List<TicketEntity> tickets;
  final String query;

  const TicketWalletSearchResults({
    super.key,
    required this.tickets,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            'Search results for "$query"',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: AttendeeTicketsListView(tickets: tickets),
        ),
      ],
    );
  }
}
