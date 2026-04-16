import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/details/event_detail_header.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/details/event_performance_metrics.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/details/event_detail_actions.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/details/event_info_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/details/event_detail_shimmer.dart';

class OrganizerEventDetailScreen extends StatelessWidget {
  final String eventId;
  
  const OrganizerEventDetailScreen({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventManagementBloc>()
        ..add(EventManagementEvent.loadEventById(eventId: eventId)),
      child: OrganizerEventDetailView(eventId: eventId),
    );
  }
}

class OrganizerEventDetailView extends StatefulWidget {
  final String eventId;

  const OrganizerEventDetailView({
    super.key,
    required this.eventId,
  });

  @override
  State<OrganizerEventDetailView> createState() =>
      _OrganizerEventDetailViewState();
}

class _OrganizerEventDetailViewState extends State<OrganizerEventDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventManagementBloc, EventManagementState>(
      listener: (context, state) {
        if (state.hasError && state.errorMessage.isNotEmpty) {
          AppHelpers.showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        
        if (state.isLoading && !state.isDeleting) {
          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: const EventDetailShimmer(),
          );
        }

        if (state.hasError &&
            state.errorMessage.isNotEmpty &&
            !state.isDeleting) {
          return _buildErrorScaffold(state.errorMessage);
        }

        if (state.selectedEvent != null) {
          return _buildEventDetailScaffold(
              context, state.selectedEvent!, state.isDeleting);
        }

        if (state.events.isNotEmpty) {
          return _buildEventDetailScaffold(
              context, state.events.first, state.isDeleting);
        }

        return _buildErrorScaffold('Event not found');
      },
    );
  }

  Widget _buildEventDetailScaffold(
      BuildContext context, EventEntity event, bool isDeleting) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          SafeArea(
            top: false, // Let SliverAppBar handle the top safe area
            child: CustomScrollView(
              slivers: [
                EventDetailHeader(
                  event: event,
                  onEdit: () => _editEvent(context, event),
                  onMore: () => _showMoreOptions(context, event),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventPerformanceMetrics(event: event),
                        SizedBox(height: 32.h),
                        EventDetailActions(
                          event: event,
                          onViewAttendees: () =>
                              _viewAllAttendees(context, event.id),
                          onBroadcast: () => _broadcastMessage(context, event),
                          onCancel: () => _cancelEvent(context, event),
                        ),
                        SizedBox(height: 24.h),
                        EventInfoSection(event: event),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Loading overlay when deleting
          if (isDeleting)
            Container(
              color: colorScheme.surface.withValues(alpha: 0.8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpinKitLoadingWidget(
                      color: colorScheme.primary,
                      size: 50.w,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Deleting event...',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorScaffold(String message) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
        ),
        title: Text(
          'Event Details',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: AppErrorRetryWidget(
        errorMessage: message,
        onRetry: () {
          context.read<EventManagementBloc>().add(
                EventManagementEvent.loadEventById(eventId: widget.eventId),
              );
        },
      ),
    );
  }

  void _editEvent(BuildContext context, EventEntity event) {
    context
        .pushNamed(
      RouteName.editEventScreen,
      pathParameters: {'eventId': event.id},
      extra: event,
    )
        .then((result) {
      // If the edit screen returns an updated event, refresh the current view
      if (result is EventEntity) {
        context.read<EventManagementBloc>().add(
              EventManagementEvent.loadEventById(eventId: event.id),
            );
      }
    });
  }

  void _showMoreOptions(BuildContext context, EventEntity event) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Capture the bloc reference before showing the bottom sheet
    final eventManagementBloc = context.read<EventManagementBloc>();
    
    showModalBottomSheet(
      context: context,
      backgroundColor: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (bottomSheetContext) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colorScheme.outline,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            _buildBottomSheetOption(
              bottomSheetContext,
              'Duplicate Event',
              Icons.copy_outlined,
              () => _duplicateEvent(context, event),
            ),
            _buildBottomSheetOption(
              bottomSheetContext,
              'Share Event',
              Icons.share_outlined,
              () => _shareEvent(context, event),
            ),
            _buildBottomSheetOption(
              bottomSheetContext,
              'Export Data',
              Icons.download_outlined,
              () => _exportData(context, event),
            ),
            _buildBottomSheetOption(
              bottomSheetContext,
              'Event Settings',
              Icons.settings_outlined,
              () => _eventSettings(context, event),
            ),
            if (event.status != EventStatus.cancelled)
              _buildBottomSheetOption(
                bottomSheetContext,
                'Delete Event',
                Icons.delete_outline,
                () => _deleteEventFromBottomSheet(
                    context, event, eventManagementBloc),
                isDestructive: true,
              ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetOption(
    BuildContext bottomSheetContext,
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return GestureDetector(
      onTap: () {
        Navigator.of(bottomSheetContext).pop();
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive
                  ? colorScheme.error : colorScheme.primary,
              size: 20.sp,
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color:
                    isDestructive ? colorScheme.error : colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _viewAllAttendees(BuildContext context, String eventId) {
    context.pushNamed(
      RouteName.attendeeList,
      pathParameters: {'eventId': eventId},
    );
  }

  void _broadcastMessage(BuildContext context, EventEntity event) {
    AppHelpers.showInfoSnackBar(
        context, 'Broadcast functionality coming soon...');
  }

  void _cancelEvent(BuildContext context, EventEntity event) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Cancel Event',
          style: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to cancel "${event.title}"? This action cannot be undone and all attendees will be notified.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: reasonController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                labelText: 'Cancellation Reason',
                labelStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.primary),
                ),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Keep Event',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (reasonController.text.trim().isNotEmpty) {
                context.read<EventManagementBloc>().add(
                      EventManagementEvent.cancelEvent(
                        eventId: event.id,
                        organizerId: event.organizerId,
                        cancellationReason: reasonController.text.trim(),
                      ),
                    );
                Navigator.of(context).pop();
              }
            },
            child: Text(
              'Cancel Event',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _duplicateEvent(BuildContext context, EventEntity event) {
    context.read<EventManagementBloc>().add(
          EventManagementEvent.duplicateEvent(
            eventId: event.id,
            organizerId: event.organizerId,
            newTitle: '${event.title} (Copy)',
            newDateTime: event.dateTime.add(const Duration(days: 7)),
          ),
        );
  }

  void _shareEvent(BuildContext context, EventEntity event) {
    AppHelpers.showInfoSnackBar(context, 'Share functionality coming soon...');
  }

  void _exportData(BuildContext context, EventEntity event) {
    AppHelpers.showInfoSnackBar(context, 'Export functionality coming soon...');
  }

  void _eventSettings(BuildContext context, EventEntity event) {
    AppHelpers.showInfoSnackBar(
        context, 'Settings functionality coming soon...');
  }

  void _deleteEventFromBottomSheet(BuildContext context, EventEntity event,
      EventManagementBloc eventManagementBloc) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: colorScheme.surfaceContainerHighest,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Delete Event',
          style: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        content: Text(
          'Are you sure you want to permanently delete "${event.title}"? This action cannot be undone.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              'Cancel',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog first
              Navigator.of(dialogContext).pop();

              // Add the delete event
              eventManagementBloc.add(
                EventManagementEvent.deleteEvent(
                  eventId: event.id,
                  organizerId: event.organizerId,
                ),
              );
              
              // Listen for the delete completion and handle navigation
              _handleDeleteCompletion(
                  context, eventManagementBloc, event.title);
            },
            child: Text(
              'Delete',
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDeleteCompletion(
      BuildContext context, EventManagementBloc bloc, String eventTitle) {
    // Listen to the bloc stream for completion
    late StreamSubscription subscription;
    subscription = bloc.stream.listen((state) {
      // If delete completed successfully (not deleting, no error, and event removed)
      if (!state.isDeleting && !state.hasError) {
        // Check if the current event is no longer in the events list
        final eventStillExists =
            state.events.any((event) => event.id == widget.eventId);
        if (!eventStillExists) {
          // Cancel the subscription
          subscription.cancel();

          // Show success message and navigate back
          if (context.mounted) {
            AppHelpers.showSuccessSnackBar(
                context, 'Event "$eventTitle" deleted successfully');

            // Pop back to the previous screen (events list)
            // Return true to indicate the event was deleted
            context.pop(true);
          }
        }
      }

      // If delete failed
      if (!state.isDeleting && state.hasError) {
        // Cancel the subscription
        subscription.cancel();
        // Error is already handled by the main BlocListener
      }
    });
  }
}
