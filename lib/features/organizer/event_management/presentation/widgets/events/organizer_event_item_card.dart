import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import '../organizer_event_utils.dart';

class OrganizerEventItemCard extends StatelessWidget {
  final EventEntity event;

  const OrganizerEventItemCard({
    super.key,
    required this.event,
  });

  void _handleAction(BuildContext context, String action) {
    switch (action) {
      case 'details':
        context.pushNamed(
          RouteName.organizerEventDetail,
          pathParameters: {'eventId': event.id},
        );
        break;
      case 'attendees':
        context.pushNamed(
          RouteName.eventAttendees,
          pathParameters: {'eventId': event.id},
        );
        break;
      case 'edit':
        context.pushNamed(
          RouteName.editEventScreen,
          pathParameters: {'eventId': event.id},
          extra: event,
        );
        break;
      case 'analytics':
        context.read<EventManagementBloc>().add(
              EventManagementEvent.loadEventStatistics(
                eventId: event.id,
                organizerId: event.organizerId,
              ),
            );
        break;
      case 'cancel':
        _showCancelDialog(context);
        break;
    }
  }

  void _showCancelDialog(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final reasonController = TextEditingController();
    final eventBloc = context.read<EventManagementBloc>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: colorScheme.surfaceContainerHighest,
        title: Text(
          'Cancel Event',
          style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to cancel "${event.title}"?',
              style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: reasonController,
              style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
              decoration: InputDecoration(
                labelText: 'Cancellation Reason',
                labelStyle: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                border: OutlineInputBorder(borderSide: BorderSide(color: colorScheme.outline)),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('Go Back', style: TextStyle(color: colorScheme.onSurfaceVariant)),
          ),
          ElevatedButton(
            onPressed: () {
              if (reasonController.text.trim().isNotEmpty) {
                eventBloc.add(
                  EventManagementEvent.cancelEvent(
                    eventId: event.id,
                    organizerId: event.organizerId,
                    cancellationReason: reasonController.text.trim(),
                  ),
                );
                Navigator.pop(dialogContext);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: colorScheme.error),
            child: const Text('Cancel Event'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColor =
        OrganizerEventUtils.getStatusColor(context, event.status);

    final soldTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + (ticket.quantity - ticket.availableQuantity),
    );
    final totalTickets = event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + ticket.quantity,
    );
    final revenue = event.ticketTypes.fold<double>(
      0.0,
      (sum, ticket) => sum + ((ticket.quantity - ticket.availableQuantity) * ticket.price),
    );
    final progress = totalTickets > 0 ? soldTickets / totalTickets : 0.0;

    return GestureDetector(
      onTap: () => _handleAction(context, 'details'),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: statusColor.withValues(alpha: 0.3), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            _buildBanner(colorScheme),
            
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(theme, colorScheme, statusColor, context),
                  SizedBox(height: 16.h),
                  Text(
                    event.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  _buildInfoRow(Icons.calendar_today, OrganizerEventUtils.formatDateTime(event.dateTime), colorScheme, theme),
                  SizedBox(height: 4.h),
                  _buildInfoRow(Icons.location_on, event.location, colorScheme, theme),
                  SizedBox(height: 16.h),
                  _buildStats(theme, colorScheme, statusColor, soldTickets, totalTickets, revenue),
                  SizedBox(height: 12.h),
                  _buildProgressBar(colorScheme, statusColor, progress),
                  SizedBox(height: 8.h),
                  Text(
                    '${(progress * 100).toInt()}% sold',
                    style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(ColorScheme colorScheme) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: event.bannerUrl != null && event.bannerUrl!.isNotEmpty
            ? Image.network(
                event.bannerUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildPlaceholder(colorScheme),
              )
            : _buildPlaceholder(colorScheme),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colorScheme, Color statusColor, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (event.status == EventStatus.active)
                Container(
                  width: 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                ),
              if (event.status == EventStatus.active) SizedBox(width: 6.w),
              Text(
                event.status.displayName,
                style: theme.textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: colorScheme.onSurfaceVariant, size: 20.sp),
          color: colorScheme.surfaceContainerHighest,
          onSelected: (val) => _handleAction(context, val),
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'details', child: Text('View Details')),
            const PopupMenuItem(value: 'attendees', child: Text('View Attendees')),
            if (event.status.isEditable) const PopupMenuItem(value: 'edit', child: Text('Edit Event')),
            const PopupMenuItem(value: 'analytics', child: Text('View Analytics')),
            if (event.status.canBeCancelled) 
              PopupMenuItem(value: 'cancel', child: Text('Cancel Event', style: TextStyle(color: colorScheme.error))),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text, ColorScheme colorScheme, ThemeData theme) {
    return Row(
      children: [
        Icon(icon, color: colorScheme.onSurfaceVariant, size: 14.sp),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildStats(ThemeData theme, ColorScheme colorScheme, Color statusColor, int sold, int total, double revenue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tickets Sold', style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
            SizedBox(height: 4.h),
            Text('$sold / $total', style: theme.textTheme.labelMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w600)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Revenue', style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
            SizedBox(height: 4.h),
            Text(
              revenue > 0 ? '${revenue.toStringAsFixed(0)} Birr' : 'Free',
              style: theme.textTheme.labelLarge?.copyWith(color: statusColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBar(ColorScheme colorScheme, Color statusColor, double progress) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(color: colorScheme.outline, borderRadius: BorderRadius.circular(3.r)),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(3.r))),
      ),
    );
  }

  Widget _buildPlaceholder(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surface,
      child: Center(
        child: Icon(Icons.image_outlined, color: colorScheme.onSurfaceVariant, size: 48.sp),
      ),
    );
  }
}

class OrganizerShimmerEventCard extends StatelessWidget {
  const OrganizerShimmerEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          ShimmerBox(width: double.infinity, height: 160.h, borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  ShimmerBox(width: 80.w, height: 24.h, borderRadius: BorderRadius.circular(8.r)),
                  ShimmerBox(width: 20.w, height: 20.h, borderRadius: BorderRadius.circular(10.r)),
                ]),
                SizedBox(height: 16.h),
                ShimmerText(width: double.infinity, height: 20.h),
                SizedBox(height: 8.h),
                ShimmerText(width: 120.w, height: 12.h),
                SizedBox(height: 4.h),
                ShimmerText(width: 150.w, height: 12.h),
                SizedBox(height: 16.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(children: [ShimmerText(width: 70.w, height: 11.h), SizedBox(height: 4.h), ShimmerText(width: 60.w, height: 14.h)]),
                  Column(children: [ShimmerText(width: 50.w, height: 11.h), SizedBox(height: 4.h), ShimmerText(width: 40.w, height: 16.h)]),
                ]),
                SizedBox(height: 12.h),
                ShimmerBox(width: double.infinity, height: 6.h, borderRadius: BorderRadius.circular(3.r)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
