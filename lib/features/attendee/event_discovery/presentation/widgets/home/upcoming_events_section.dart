import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'attendee_event_card.dart';

class UpcomingEventsSection extends StatelessWidget {
  final Function(String) onEventTap;

  const UpcomingEventsSection({
    super.key,
    required this.onEventTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Events',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to discover screen to see all events
              },
              child: Text(
                'See All',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
          builder: (context, state) {
            if (state.hasError) {
              return _buildErrorState(context, state.errorMessage);
            }

            if (state.isLoading || state.isLoadingDetails) {
              return _buildLoadingState();
            }

            return _buildEventsList(context, state.events);
          },
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: List.generate(3, (index) => _buildShimmerEventCard()),
    );
  }

  Widget _buildShimmerEventCard() {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;

        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.surface,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(
                width: double.infinity,
                height: 160.h,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerText(width: 180.w, height: 14.h),
                    SizedBox(height: 8.h),
                    ShimmerText(width: double.infinity, height: 18.h),
                    SizedBox(height: 6.h),
                    ShimmerText(width: 200.w, height: 18.h),
                    SizedBox(height: 8.h),
                    ShimmerText(width: 120.w, height: 14.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 150.h,
        maxHeight: 250.h,
      ),
      padding: EdgeInsets.all(16.w),
      child: AppErrorRetryWidget(
        errorMessage: message,
        onRetry: () {
          context.read<EventDiscoveryBloc>().add(
                const EventDiscoveryEvent.refreshEvents(),
              );
        },
      ),
    );
  }

  Widget _buildEventsList(
      BuildContext context, List<EventDiscoveryEntity> events) {
    if (events.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      children: events
          .take(3)
          .map((event) => AttendeeEventCard(
                event: event,
                onTap: () => onEventTap(event.id),
              ))
          .toList(),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_busy, color: colorScheme.primary, size: 48.sp),
            SizedBox(height: 16.h),
            Text(
              'No events available',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Check back later for new events',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
