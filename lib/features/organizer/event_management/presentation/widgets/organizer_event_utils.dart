import 'package:flutter/material.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class OrganizerEventUtils {
  static Color getStatusColor(EventStatus status) {
    switch (status) {
      case EventStatus.active:
        return const Color(0xFF4ADE80);
      case EventStatus.draft:
        return const Color(0xFFF59E0B);
      case EventStatus.completed:
        return const Color(0xFF06B6D4);
      case EventStatus.cancelled:
        return const Color(0xFFEF4444);
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
