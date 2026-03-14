import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

class TicketDetailsScreen extends StatelessWidget {
  final TicketEntity ticket;

  const TicketDetailsScreen({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          if (ticket.isActive && ticket.isUpcoming)
            IconButton(
              onPressed: () => _showQRCode(context),
              icon: const Icon(Icons.qr_code),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ticket Card
            _buildTicketCard(),
            const SizedBox(height: 24),

            // Event Details
            _buildEventDetails(),
            const SizedBox(height: 24),

            // Ticket Information
            _buildTicketInformation(),
            const SizedBox(height: 24),

            // Purchase Information
            _buildPurchaseInformation(),
            const SizedBox(height: 24),

            // Actions
            if (ticket.isActive && ticket.isUpcoming) _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard() {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.blue.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TICKET',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                _buildStatusChip(ticket.status),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              ticket.eventTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              ticket.ticketTypeName,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '${ticket.eventDateTime.day}/${ticket.eventDateTime.month}/${ticket.eventDateTime.year}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 24),
                const Icon(
                  Icons.access_time,
                  color: Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '${ticket.eventDateTime.hour.toString().padLeft(2, '0')}:${ticket.eventDateTime.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ticket.eventLocation,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: \$${ticket.ticketPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (ticket.seatNumber != null)
                  Text(
                    'Seat: ${ticket.seatNumber}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Event Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (ticket.eventBannerUrl != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  ticket.eventBannerUrl!,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Icon(Icons.event, size: 50),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            _buildDetailRow('Event', ticket.eventTitle),
            _buildDetailRow('Date & Time', 
              '${ticket.eventDateTime.day}/${ticket.eventDateTime.month}/${ticket.eventDateTime.year} at ${ticket.eventDateTime.hour.toString().padLeft(2, '0')}:${ticket.eventDateTime.minute.toString().padLeft(2, '0')}'),
            _buildDetailRow('Location', ticket.eventLocation),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketInformation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ticket Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Ticket ID', ticket.id),
            _buildDetailRow('Ticket Type', ticket.ticketTypeName),
            _buildDetailRow('Description', ticket.ticketTypeDescription),
            _buildDetailRow('Price', '\$${ticket.ticketPrice.toStringAsFixed(2)}'),
            _buildDetailRow('Status', ticket.status.displayName),
            if (ticket.seatNumber != null)
              _buildDetailRow('Seat Number', ticket.seatNumber!),
            if (ticket.checkInDate != null)
              _buildDetailRow('Check-in Date', 
                '${ticket.checkInDate!.day}/${ticket.checkInDate!.month}/${ticket.checkInDate!.year} at ${ticket.checkInDate!.hour.toString().padLeft(2, '0')}:${ticket.checkInDate!.minute.toString().padLeft(2, '0')}'),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseInformation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Purchase Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Purchase Date', 
              '${ticket.purchaseDate.day}/${ticket.purchaseDate.month}/${ticket.purchaseDate.year}'),
            _buildDetailRow('QR Code', ticket.qrCode),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _showQRCode(context),
            icon: const Icon(Icons.qr_code),
            label: const Text('Show QR Code'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => _shareTicket(context),
            icon: const Icon(Icons.share),
            label: const Text('Share Ticket'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(TicketStatus status) {
    Color color;
    switch (status) {
      case TicketStatus.confirmed:
        color = Colors.green;
        break;
      case TicketStatus.pending:
        color = Colors.orange;
        break;
      case TicketStatus.cancelled:
      case TicketStatus.refunded:
        color = Colors.red;
        break;
      case TicketStatus.used:
        color = Colors.blue;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Text(
        status.displayName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _showQRCode(BuildContext context) {
    context.pushNamed(
      RouteName.ticketQR,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }

  void _shareTicket(BuildContext context) {
    // TODO: Implement ticket sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ticket sharing feature coming soon!'),
      ),
    );
  }
}