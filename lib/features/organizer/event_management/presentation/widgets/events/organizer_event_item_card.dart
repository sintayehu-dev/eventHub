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

  void _handleAction(BuildContext context, String action) async {
    switch (action) {
      case 'details':
        final result = await context.pushNamed(
          RouteName.organizerEventDetail,
          pathParameters: {'eventId': event.id},
        );
        // If event was deleted (result == true), reload the events list
        if (result == true && context.mounted) {
          context.read<EventManagementBloc>().add(
                EventManagementEvent.loadOrganizerEvents(
                  organizerId: event.organizerId,
                  status: EventStatus.active,
                ),
              );
        }
        break;
      case 'attendees':
        context.pushNamed(
          RouteName.eventAttendees,
          pathParameters: {'eventId': event.id},
        );
        break;
      case 'edit':
        final result = await context.pushNamed(
          RouteName.editEventScreen,
          pathParameters: {'eventId': event.id},
          extra: event,
        );
        // If event was updated, reload the events list
        if (result != null && context.mounted) {
          context.read<EventManagementBloc>().add(
                EventManagementEvent.loadOrganizerEvents(
                  organizerId: event.organizerId,
                  status: EventStatus.active,
                ),
              );
        }
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
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            _buildBanner(context, colorScheme),

            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 14.h, 10.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, theme, colorScheme, statusColor, context),
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
                  _buildInfoRow(context, Icons.calendar_today, OrganizerEventUtils.formatDateTime(event.dateTime), colorScheme, theme),
                  SizedBox(height: 4.h),
                  _buildInfoRow(context, Icons.location_on, event.location, colorScheme, theme),
                  SizedBox(height: 16.h),
                  _buildStats(context, theme, colorScheme, statusColor, soldTickets, totalTickets, revenue),
                  SizedBox(height: 12.h),
                  _buildProgressBar(context, colorScheme, statusColor, progress),
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

  Widget _buildBanner(BuildContext context, ColorScheme colorScheme) {
    return Container(
      height: 150.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: event.bannerUrl != null && event.bannerUrl!.isNotEmpty
            ? Image.network(
                event.bannerUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildPlaceholder(context, colorScheme),
              )
            : _buildPlaceholder(context, colorScheme),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, ColorScheme colorScheme, Color statusColor, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(12.r),
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
          color: colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
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

  Widget _buildInfoRow(BuildContext context, IconData icon, String text, ColorScheme colorScheme, ThemeData theme) {
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

  Widget _buildStats(BuildContext context, ThemeData theme, ColorScheme colorScheme, Color statusColor, int sold, int total, double revenue) {
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
              '${revenue.toStringAsFixed(0)} Birr',
              style: theme.textTheme.labelLarge?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context, ColorScheme colorScheme, Color statusColor, double progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: LinearProgressIndicator(
        value: progress.clamp(0.0, 1.0),
        minHeight: 8.h,
        backgroundColor: colorScheme.surfaceContainerHighest,
        color: colorScheme.secondary,
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, ColorScheme colorScheme) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorScheme.primaryContainer, colorScheme.secondaryContainer],
        ),
      ),
      child: Center(
        child: Icon(Icons.celebration_rounded, color: colorScheme.primary.withValues(alpha: 0.4), size: 44.sp),
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
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Column(
        children: [
          ShimmerBox(width: double.infinity, height: 150.h, borderRadius: BorderRadius.circular(20.r)),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 14.h, 10.w, 8.h),
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
