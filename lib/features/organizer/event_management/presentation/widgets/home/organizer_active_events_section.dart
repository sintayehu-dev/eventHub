import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/presentation/widgets/section_header.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import '../active_event_card.dart';

class OrganizerActiveEventsSection extends StatelessWidget {
  const OrganizerActiveEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventManagementBloc, EventManagementState>(
      builder: (context, state) {
        if (state.isLoading) {
          return _buildLoadingEvents(context);
        }

        if (state.hasError && state.errorMessage.isNotEmpty) {
          return _buildErrorSection(context, state.errorMessage);
        }

        if (state.events.isNotEmpty) {
          return _buildActiveEventsContent(context, state.events);
        }

        if (state.selectedEvent != null) {
          return _buildActiveEventsContent(context, [state.selectedEvent!]);
        }

        return _buildActiveEventsContent(context, []);
      },
    );
  }

  Widget _buildActiveEventsContent(
      BuildContext context, List<EventEntity> events) {
    if (events.isEmpty) {
      return _buildEmptyEventsSection(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Active events',
          actionLabel: 'View all',
          onAction: () => context.goNamed(RouteName.organizerEvents),
        ),
        SizedBox(height: 14.h),
        ...events.take(3).map(
              (event) => Padding(
                padding: EdgeInsets.only(bottom: 14.h),
                child: ActiveEventCard(
                  event: event,
                  onTap: () async {
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
                  },
                ),
              ),
            ),
      ],
    );
  }

  Widget _buildEmptyEventsSection(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Active events', style: theme.textTheme.titleLarge),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
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
                child: Icon(Icons.event_note_rounded,
                    color: scheme.secondary, size: 32.sp),
              ),
              SizedBox(height: 16.h),
              Text('No active events', style: theme.textTheme.titleMedium),
              SizedBox(height: 6.h),
              Text(
                'Create your first event to get started.',
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () => context.pushNamed(RouteName.createEventScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: scheme.secondary,
                  foregroundColor: scheme.onSecondary,
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
                ),
                child: const Text('Create event'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingEvents(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Active events', style: theme.textTheme.titleLarge),
        SizedBox(height: 14.h),
        ...List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: const _ShimmerEventCard(),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorSection(BuildContext context, String message) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: AppErrorRetryWidget(
        errorMessage: message,
        onRetry: () {
          // Clear error and let parent handle refresh
          context.read<EventManagementBloc>().add(
                const EventManagementEvent.clearError(),
              );
        },
      ),
    );
  }
}

class _ShimmerEventCard extends StatelessWidget {
  const _ShimmerEventCard();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        children: [
          ShimmerBox(
            width: 72.w,
            height: 72.w,
            borderRadius: BorderRadius.circular(18.r),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerText(width: double.infinity, height: 16.h),
                SizedBox(height: 8.h),
                ShimmerText(width: 120.w, height: 12.h),
                SizedBox(height: 14.h),
                ShimmerBox(
                  width: double.infinity,
                  height: 6.h,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
