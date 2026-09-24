import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';
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
    final scheme = theme.colorScheme;

    if (tickets.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 88.w,
                height: 88.w,
                decoration: BoxDecoration(
                  color: scheme.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.confirmation_number_rounded,
                  size: 40.sp,
                  color: scheme.secondary,
                ),
              ),
              SizedBox(height: 20.h),
              Text('No tickets here yet', style: theme.textTheme.titleMedium),
              SizedBox(height: 8.h),
              Text(
                'Your tickets will appear here once you purchase them.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        FloatingPillNavigationBar.clearance(context),
      ),
      itemCount: tickets.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return FadeSlideIn(
          index: index,
          child: AttendeeTicketCard(
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
          ),
        );
      },
    );
  }
}
