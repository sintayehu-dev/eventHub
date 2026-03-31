import 'package:flutter/material.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import '../ticket_details_info_section.dart';

class TicketDetailsMainInfo extends StatelessWidget {
  final TicketEntity ticket;

  const TicketDetailsMainInfo({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return TicketDetailsInfoSection(
      title: 'Ticket Information',
      details: [
        TicketDetailRowData('Ticket ID', ticket.id),
        TicketDetailRowData('Ticket Type', ticket.ticketTypeName),
        TicketDetailRowData('Description', ticket.ticketTypeDescription),
        TicketDetailRowData(
          'Price',
          '\$${ticket.ticketPrice.toStringAsFixed(2)}',
        ),
        TicketDetailRowData('Status', ticket.status.displayName),
        if (ticket.seatNumber != null)
          TicketDetailRowData('Seat Number', ticket.seatNumber!),
        if (ticket.checkInDate != null)
          TicketDetailRowData(
            'Check-in Date',
            '${ticket.checkInDate!.day}/${ticket.checkInDate!.month}/${ticket.checkInDate!.year} at ${ticket.checkInDate!.hour.toString().padLeft(2, '0')}:${ticket.checkInDate!.minute.toString().padLeft(2, '0')}',
          ),
      ],
    );
  }
}
