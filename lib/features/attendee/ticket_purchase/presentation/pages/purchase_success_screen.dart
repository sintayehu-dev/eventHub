import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import '../widgets/purchase_success_header.dart';
import '../widgets/purchase_details_card.dart';
import '../widgets/purchased_tickets_list.dart';

class PurchaseSuccessScreen extends StatelessWidget {
  final PurchaseResult purchaseResult;

  const PurchaseSuccessScreen({
    super.key,
    required this.purchaseResult,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase complete'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                children: [
                  // Success Header
                  const PurchaseSuccessHeader(),
                  SizedBox(height: 40.h),

                  // Purchase Details
                  PurchaseDetailsCard(purchaseResult: purchaseResult),
                  SizedBox(height: 24.h),

                  // Tickets List
                  PurchasedTicketsList(tickets: purchaseResult.tickets),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),

          // Action Buttons
          _buildActionButtons(context, theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          24.w, 16.h, 24.w, MediaQuery.of(context).padding.bottom + 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: 'View my tickets',
            icon: Icons.arrow_forward_rounded,
            variant: AppButtonVariant.accent,
            onPressed: () => context.goNamed(RouteName.ticketWallet),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () => context.goNamed(RouteName.attendeeHome),
            child: Text(
              'Back to home',
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}
