import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/core/router/route_name.dart';
import '../attendee_ticket_card.dart';

class AttendeeTicketsListView extends StatelessWidget {
  final List<TicketEntity> tickets;

  const AttendeeTicketsListView({
    super.key,
    required this.tickets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (tickets.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.confirmation_number_outlined,
              size: 64.sp,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            SizedBox(height: 16.h),
            Text(
              'No tickets found',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your tickets will appear here once you purchase them',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      itemCount: tickets.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return AttendeeTicketCard(
          ticket: ticket,
          onTap: () {
            context.pushNamed(
              RouteName.ticketDetails,
              pathParameters: {'ticketId': ticket.id},
              extra: ticket,
            );
          },
          onShowQR: () {
            context.pushNamed(
              RouteName.ticketQR,
              pathParameters: {'ticketId': ticket.id},
              extra: ticket,
            );
          },
        );
      },
    );
  }
}
