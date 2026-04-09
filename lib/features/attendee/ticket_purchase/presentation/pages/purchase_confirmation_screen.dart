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
  State<PurchaseConfirmationScreen> createState() => _PurchaseConfirmationScreenState();
}

class _PurchaseConfirmationScreenState extends State<PurchaseConfirmationScreen> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.chapa;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Confirm Purchase',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Summary
                    TicketPurchaseEventHeader(event: widget.event),
                    SizedBox(height: 24.h),

                    // Ticket Summary
                    TicketOrderSummaryCard(selectedTickets: widget.selectedTickets),
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
            ),

            // Purchase Button
            _buildPurchaseButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      color: colorScheme.primaryContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${widget.totalAmount.toStringAsFixed(2)}',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseButton() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, MediaQuery.of(context).padding.bottom + 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BlocBuilder<TicketPurchaseBloc, TicketPurchaseState>(
        builder: (context, state) {
          final isLoading = state.isPurchasing;

          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : _purchaseTickets,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 0,
              ),
              child: isLoading
                  ? SpinKitLoadingWidget(
                      color: colorScheme.onPrimary,
                      size: 24.h,
                    )
                  : Text(
                      'Complete Purchase - \$${widget.totalAmount.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
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