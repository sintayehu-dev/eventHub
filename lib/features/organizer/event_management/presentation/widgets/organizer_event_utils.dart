import 'package:flutter/material.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class OrganizerEventUtils {
  static Color getStatusColor(BuildContext context, EventStatus status) {
    final colorScheme = Theme.of(context).colorScheme;
    
    switch (status) {
      case EventStatus.active:
        return Colors.green; // Success color
      case EventStatus.draft:
        return colorScheme.secondary; // Warning/draft color
      case EventStatus.completed:
        return colorScheme.tertiary; // Info color
      case EventStatus.cancelled:
        return colorScheme.error; // Error color
    }
  }

  static String formatDateTime(DateTime dateTime) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$month $day • $displayHour:$minute $period';
  }
}
