import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/section_header.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'attendee_event_card.dart';

/// The list below the featured card. The first event is spotlighted by the
/// hero card, so this list starts from the second one.
class UpcomingEventsSection extends StatelessWidget {
  final Function(String) onEventTap;

  const UpcomingEventsSection({
    super.key,
    required this.onEventTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
      builder: (context, state) {
        if (state.hasError) {
          return _buildErrorState(context, state.errorMessage);
        }

        if (state.isLoading || state.isLoadingDetails) {
          return _buildLoadingState(context);
        }

        if (state.events.isEmpty) {
          return _buildEmptyState(context);
        }

        final rest = state.events.skip(1).take(4).toList();
        if (rest.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: 'Upcoming events',
              onAction: () => context.goNamed(RouteName.attendeeDiscover),
            ),
            SizedBox(height: 14.h),
            ...rest.map(
              (event) => AttendeeEventCard(
                event: event,
                onTap: () => onEventTap(event.id),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: List.generate(
        2,
        (_) => Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(
                width: double.infinity,
                height: 168.h,
                borderRadius: BorderRadius.circular(20.r),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.w, 14.h, 8.w, 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerText(width: 220.w, height: 18.h),
                    SizedBox(height: 10.h),
                    ShimmerText(width: 140.w, height: 14.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Container(
      constraints: BoxConstraints(minHeight: 150.h, maxHeight: 250.h),
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

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Column(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: scheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.event_busy_rounded,
                color: scheme.secondary, size: 34.sp),
          ),
          SizedBox(height: 16.h),
          Text('No events yet', style: theme.textTheme.titleMedium),
          SizedBox(height: 6.h),
          Text(
            'Check back soon for new events.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
