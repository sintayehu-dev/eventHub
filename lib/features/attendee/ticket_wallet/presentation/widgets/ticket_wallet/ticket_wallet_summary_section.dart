import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
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
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
      child: Row(
        children: [
          Expanded(
            child: TicketWalletSummaryCard(
              title: 'Total',
              value: walletData.totalTickets.toString(),
              icon: Icons.confirmation_number_rounded,
              tint: AppColors.sky,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TicketWalletSummaryCard(
              title: 'Active',
              value: walletData.activeTickets.toString(),
              icon: Icons.check_circle_rounded,
              tint: AppColors.mint,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TicketWalletSummaryCard(
              title: 'Upcoming',
              value: walletData.upcomingTickets.length.toString(),
              icon: Icons.schedule_rounded,
              tint: AppColors.peach,
            ),
          ),
        ],
      ),
    );
  }
}
