import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';

class TicketPurchaseSummary extends StatelessWidget {
  final int totalTickets;
  final double totalAmount;
  final VoidCallback onProceed;

  const TicketPurchaseSummary({
    super.key,
    required this.totalTickets,
    required this.totalAmount,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isFree = totalAmount == 0;

    return Container(
      padding: EdgeInsets.fromLTRB(
        24.w,
        20.h,
        24.w,
        MediaQuery.of(context).padding.bottom + 16.h,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.12),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$totalTickets ticket${totalTickets > 1 ? 's' : ''}',
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    isFree ? 'Free event' : 'Total',
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
              Text(
                isFree ? 'Free' : '${totalAmount.toStringAsFixed(2)} Birr',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: scheme.primary),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          AppButton(
            label: isFree ? 'Get ticket' : 'Continue to payment',
            icon: Icons.arrow_forward_rounded,
            variant: AppButtonVariant.accent,
            onPressed: onProceed,
          ),
        ],
      ),
    );
  }
}
