import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/ticket_purchase_event_header.dart';
import '../widgets/ticket_type_selection_card.dart';
import '../widgets/ticket_purchase_summary.dart';

class TicketSelectionScreen extends StatefulWidget {
  final EventDiscoveryEntity event;

  const TicketSelectionScreen({
    super.key,
    required this.event,
  });

  @override
  State<TicketSelectionScreen> createState() => _TicketSelectionScreenState();
}

class _TicketSelectionScreenState extends State<TicketSelectionScreen> {
  final Map<String, int> _selectedQuantities = {};
  double _totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final totalTickets =
        _selectedQuantities.values.fold(0, (sum, qty) => sum + qty);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Tickets',
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
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          Column(
            children: [
              // Event Header
              TicketPurchaseEventHeader(event: widget.event),

              // Ticket Types
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 120.h),
                  itemCount: widget.event.ticketTypes.length,
                  itemBuilder: (context, index) {
                    final ticketType = widget.event.ticketTypes[index];
                    return TicketTypeSelectionCard(
                      ticketType: ticketType,
                      quantity: _selectedQuantities[ticketType.id] ?? 0,
                      onQuantityChanged: (quantity) =>
                          _updateQuantity(ticketType.id, quantity),
                    );
                  },
                ),
              ),
            ],
          ),

          // Bottom Summary
          if (_totalAmount > 0)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: TicketPurchaseSummary(
                totalTickets: totalTickets,
                totalAmount: _totalAmount,
                onProceed: _proceedToCheckout,
              ),
            ),
        ],
      ),
    );
  }

  void _updateQuantity(String ticketTypeId, int quantity) {
    setState(() {
      if (quantity <= 0) {
        _selectedQuantities.remove(ticketTypeId);
      } else {
        _selectedQuantities[ticketTypeId] = quantity;
      }
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    double total = 0.0;
    for (final entry in _selectedQuantities.entries) {
      final ticketType =
          widget.event.ticketTypes.firstWhere((t) => t.id == entry.key);
      total += ticketType.price * entry.value;
    }
    _totalAmount = total;
  }

  void _proceedToCheckout() {
    final selectedTickets = <Map<String, dynamic>>[];

    for (final entry in _selectedQuantities.entries) {
      final ticketType =
          widget.event.ticketTypes.firstWhere((t) => t.id == entry.key);
      selectedTickets.add({
        'ticketTypeId': entry.key,
        'ticketTypeName': ticketType.name,
        'price': ticketType.price,
        'quantity': entry.value,
      });
    }

    context.pushNamed(
      RouteName.purchaseConfirmation,
      extra: {
        'event': widget.event,
        'selectedTickets': selectedTickets,
        'totalAmount': _totalAmount,
      },
    );
  }
}