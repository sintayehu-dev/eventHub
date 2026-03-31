import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import '../ticket_details_info_section.dart';

class TicketDetailsEventSection extends StatelessWidget {
  final TicketEntity ticket;

  const TicketDetailsEventSection({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TicketDetailsInfoSection(
      title: 'Event Details',
      topWidget: ticket.eventBannerUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                ticket.eventBannerUrl!,
                width: double.infinity,
                height: 140.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 140.h,
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.event_rounded,
                    size: 40.sp,
                    color: colorScheme.primary.withValues(alpha: 0.5),
                  ),
                ),
              ),
            )
          : null,
      details: [
        TicketDetailRowData('Event', ticket.eventTitle),
        TicketDetailRowData(
          'Date & Time',
          '${ticket.eventDateTime.day}/${ticket.eventDateTime.month}/${ticket.eventDateTime.year} at ${ticket.eventDateTime.hour.toString().padLeft(2, '0')}:${ticket.eventDateTime.minute.toString().padLeft(2, '0')}',
        ),
        TicketDetailRowData('Location', ticket.eventLocation),
      ],
    );
  }
}
