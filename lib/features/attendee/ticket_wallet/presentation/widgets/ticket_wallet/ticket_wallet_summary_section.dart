import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import '../ticket_wallet_summary_card.dart';

class TicketWalletSummarySection extends StatelessWidget {
  final TicketWalletData walletData;

  const TicketWalletSummarySection({
    super.key,
    required this.walletData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: TicketWalletSummaryCard(
              title: 'Total',
              value: walletData.totalTickets.toString(),
              icon: Icons.confirmation_number_rounded,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TicketWalletSummaryCard(
              title: 'Active',
              value: walletData.activeTickets.toString(),
              icon: Icons.check_circle_rounded,
              color: Colors.green,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TicketWalletSummaryCard(
              title: 'Upcoming',
              value: walletData.upcomingTickets.length.toString(),
              icon: Icons.schedule_rounded,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
