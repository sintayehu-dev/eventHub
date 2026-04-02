import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

class AttendeeTicketCard extends StatelessWidget {
  final TicketEntity ticket;
  final VoidCallback onTap;
  final VoidCallback onShowQR;

  const AttendeeTicketCard({
    super.key,
    required this.ticket,
    required this.onTap,
    required this.onShowQR,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image with Dark Overlay and QR Code
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Stack(
                children: [
                  // Event Banner Image
                  if (ticket.eventBannerUrl != null &&
                      ticket.eventBannerUrl!.isNotEmpty)
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.r)),
                      child: Image.network(
                        ticket.eventBannerUrl!,
                        width: double.infinity,
                        height: 160.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildFallbackBackground(colorScheme);
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return _buildFallbackBackground(colorScheme);
                        },
                      ),
                    )
                  else
                    _buildFallbackBackground(colorScheme),

                  // Dark overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.r)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.black.withValues(alpha: 0.6),
                          Colors.black.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),

                  // QR Code Icon in center
                  if (ticket.isActive && ticket.isUpcoming)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.95),
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.qr_code_rounded,
                            color: Colors.black87,
                            size: 45.sp,
                          ),
                        ),
                      ),
                    ),

                  // Status badge
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: _getStatusColor(context, ticket.status),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        ticket.status.displayName,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Event Details
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    ticket.eventTitle,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Date and Time
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        _formatDateTime(ticket.eventDateTime),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          ticket.eventLocation,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  
                  // Ticket Type and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TICKET TYPE',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.6),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            ticket.ticketTypeName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'PRICE',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.6),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$${ticket.ticketPrice.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // View QR Code Button
                  if (ticket.isActive && ticket.isUpcoming)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primary,
                            colorScheme.primary.withValues(alpha: 0.8),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: onShowQR,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: colorScheme.onPrimary,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                color: colorScheme.onPrimary,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Show QR Code',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context, TicketStatus status) {
    switch (status) {
      case TicketStatus.confirmed:
        return Theme.of(context).colorScheme.primary;
      case TicketStatus.pending:
        return Colors.orange;
      case TicketStatus.cancelled:
      case TicketStatus.refunded:
        return Colors.red;
      case TicketStatus.used:
        return Colors.blue;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final year = dateTime.year;
    final hour = dateTime.hour;
    final minute = dateTime.minute;

    final timeString =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    return '$month $day, $year • $timeString';
  }

  Widget _buildFallbackBackground(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.primary.withValues(alpha: 0.8),
            colorScheme.secondary.withValues(alpha: 0.6),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Colors.transparent,
              colorScheme.primary.withValues(alpha: 0.1),
              colorScheme.primary.withValues(alpha: 0.3),
            ],
          ),
        ),
        child: Center(
          child: Icon(
            Icons.event,
            size: 60.sp,
            color: colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
