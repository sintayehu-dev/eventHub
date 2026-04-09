import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventDetailGetTicketsButton extends StatelessWidget {
  final EventDiscoveryEntity event;

  const EventDetailGetTicketsButton({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final isAvailable =
        event.availableTickets > 0 && event.status == EventStatus.active;
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isAvailable
            ? () {
                context.pushNamed(
                  RouteName.ticketSelection,
                  extra: event,
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isAvailable ? const Color(0xFF8B5CF6) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 18.h),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.confirmation_number,
              color: Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              event.isSoldOut ? 'Sold Out' : 'Get Tickets Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
