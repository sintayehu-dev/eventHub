import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/application/ticket_purchase/bloc/ticket_purchase_bloc.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';
import 'package:eventhub/core/presentation/widgets/app_button.dart';
import '../widgets/ticket_purchase_event_header.dart';
import '../widgets/ticket_order_summary_card.dart';
import '../widgets/payment_method_selector.dart';

class PurchaseConfirmationScreen extends StatefulWidget {
  final EventDiscoveryEntity event;
  final List<Map<String, dynamic>> selectedTickets;
  final double totalAmount;

  const PurchaseConfirmationScreen({
    super.key,
    required this.event,
    required this.selectedTickets,
    required this.totalAmount,
  });

  @override
  State<PurchaseConfirmationScreen> createState() =>
      _PurchaseConfirmationScreenState();
}

class _PurchaseConfirmationScreenState
    extends State<PurchaseConfirmationScreen> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.chapa;

  @override
  void initState() {
    super.initState();
    // For free tickets, automatically complete the purchase
    if (widget.totalAmount == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _purchaseTickets();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isFree = widget.totalAmount == 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(isFree ? 'Get free ticket' : 'Confirm purchase'),
        // Hide back button for free tickets
        automaticallyImplyLeading: false,
        leading: isFree
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: const AppBackButton(),
              ),
        leadingWidth: 60.w,
      ),
      body: BlocListener<TicketPurchaseBloc, TicketPurchaseState>(
        listener: (context, state) {
          if (state.isPurchaseSuccessful && state.purchaseResult != null) {
            context.pushReplacementNamed(
              RouteName.purchaseSuccess,
              extra: state.purchaseResult,
            );
          }

          if (state.hasError) {
            AppHelpers.showErrorFlash(
              context,
              NetworkExceptions.getRawErrorMessage(state.errorMessage),
            );
          }
        },
        child: isFree
            ? _buildFreeTicketLoading(colorScheme)
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Event Summary
                          TicketPurchaseEventHeader(event: widget.event),
                          SizedBox(height: 24.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                // Ticket Summary
                                TicketOrderSummaryCard(
                                    selectedTickets: widget.selectedTickets),
                                SizedBox(height: 24.h),

                                // Payment Method
                                PaymentMethodSelector(
                                  selectedMethod: _selectedPaymentMethod,
                                  onMethodChanged: (method) {
                                    setState(() {
                                      _selectedPaymentMethod = method;
                                    });
                                  },
                                ),
                                SizedBox(height: 24.h),

                                // Total
                                _buildTotalSection(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Purchase Button
                  _buildPurchaseButton(),
                ],
              ),
      ),
    );
  }

  Widget _buildFreeTicketLoading(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitLoadingWidget(
            color: colorScheme.primary,
            size: 50.w,
          ),
          SizedBox(height: 24.h),
          Text(
            'Getting your free ticket...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total amount',
            style: theme.textTheme.titleMedium
                ?.copyWith(color: colorScheme.onPrimary),
          ),
          Text(
            '${widget.totalAmount.toStringAsFixed(2)} Birr',
            style: theme.textTheme.titleLarge
                ?.copyWith(color: colorScheme.secondary),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseButton() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(
          20.w, 16.h, 20.w, MediaQuery.of(context).padding.bottom + 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.12),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: BlocBuilder<TicketPurchaseBloc, TicketPurchaseState>(
        builder: (context, state) {
          return AppButton(
            label: 'Pay ${widget.totalAmount.toStringAsFixed(2)} Birr',
            icon: Icons.lock_outline_rounded,
            variant: AppButtonVariant.accent,
            isLoading: state.isPurchasing,
            onPressed: _purchaseTickets,
          );
        },
      ),
    );
  }

  void _purchaseTickets() {
    // Create purchase requests for each ticket type
    for (final ticket in widget.selectedTickets) {
      final request = PurchaseTicketRequest(
        eventId: widget.event.id,
        ticketTypeId: ticket['ticketTypeId'],
        quantity: ticket['quantity'],
        paymentMethod: _selectedPaymentMethod,
      );

      context.read<TicketPurchaseBloc>().add(
            TicketPurchaseEvent.purchaseTickets(
              request: request,
              userId:
                  '', // This will be ignored, userId comes from local storage in bloc
            ),
          );
    }
  }
}
