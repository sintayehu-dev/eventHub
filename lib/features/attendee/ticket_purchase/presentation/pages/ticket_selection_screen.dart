import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

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
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Tickets',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          // Event Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              border: Border(
                  bottom: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.3))),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.event.bannerUrl != null
                      ? Image.network(
                          widget.event.bannerUrl!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 60,
                            height: 60,
                            color: colorScheme.outline.withValues(alpha: 0.3),
                            child: Icon(
                              Icons.event,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        )
                      : Container(
                          width: 60,
                          height: 60,
                          color: colorScheme.outline.withValues(alpha: 0.3),
                          child: Icon(
                            Icons.event,
                            color: colorScheme.onSurface,
                          ),
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.event.dateTime.day}/${widget.event.dateTime.month}/${widget.event.dateTime.year}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      Text(
                        widget.event.location,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Ticket Types
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.event.ticketTypes.length,
              itemBuilder: (context, index) {
                final ticketType = widget.event.ticketTypes[index];
                return _buildTicketTypeCard(ticketType);
              },
            ),
          ),

          // Bottom Summary
          if (_totalAmount > 0) _buildBottomSummary(),
        ],
      ),
    );
  }

  Widget _buildTicketTypeCard(TicketTypeInfo ticketType) {
    final quantity = _selectedQuantities[ticketType.id] ?? 0;
    final isAvailable = ticketType.isAvailable;

    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          color: colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        ticketType.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (ticketType.description.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          ticketType.description,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Text(
                  ticketType.price == 0
                      ? 'Free'
                      : '\$${ticketType.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isAvailable
                      ? '${ticketType.availableQuantity} available'
                      : 'Sold out',
                  style: TextStyle(
                    color: isAvailable ? Colors.green : Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isAvailable)
                  Row(
                    children: [
                      IconButton(
                        onPressed: quantity > 0
                            ? () => _updateQuantity(ticketType.id, quantity - 1)
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Colors.blue,
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: quantity < ticketType.availableQuantity
                            ? () => _updateQuantity(ticketType.id, quantity + 1)
                            : null,
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
      },
    );
  }

  Widget _buildBottomSummary() {
    final totalTickets = _selectedQuantities.values.fold(0, (sum, qty) => sum + qty);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$totalTickets ticket${totalTickets > 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Total: \$${_totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _proceedToCheckout(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continue to Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
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
      final ticketType = widget.event.ticketTypes
          .firstWhere((t) => t.id == entry.key);
      total += ticketType.price * entry.value;
    }
    _totalAmount = total;
  }

  void _proceedToCheckout() {
    final selectedTickets = <Map<String, dynamic>>[];
    
    for (final entry in _selectedQuantities.entries) {
      final ticketType = widget.event.ticketTypes
          .firstWhere((t) => t.id == entry.key);
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