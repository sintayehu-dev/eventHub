import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'organizer_event_item_card.dart';

class OrganizerEventsListSection extends StatelessWidget {
  const OrganizerEventsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventManagementBloc, EventManagementState>(
      builder: (context, state) {
        if (state.isLoading) {
          return _buildLoadingList(context);
        }

        if (state.hasError && state.errorMessage.isNotEmpty) {
          return _ErrorState(
            message: state.errorMessage,
            onRetry: () {
              // Clear error and let parent handle refresh
              context.read<EventManagementBloc>().add(
                    const EventManagementEvent.clearError(),
                  );
            },
          );
        }

        if (state.events.isNotEmpty) {
          return _buildEventsList(context, state.events);
        }

        if (state.selectedEvent != null) {
          return _buildEventsList(context, [state.selectedEvent!]);
        }

        return const _EmptyState();
      },
    );
  }

  Widget _buildLoadingList(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, __) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const OrganizerShimmerEventCard(),
          ),
          childCount: 3,
        ),
      ),
    );
  }

  Widget _buildEventsList(BuildContext context, List<EventEntity> events) {
    if (events.isEmpty) {
      return const _EmptyState();
    }

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => FadeSlideIn(
            index: index,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: OrganizerEventItemCard(event: events[index]),
            ),
          ),
          childCount: events.length,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 88.w,
                height: 88.w,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.event_note_rounded,
                    color: colorScheme.secondary, size: 40.sp),
              ),
              SizedBox(height: 20.h),
              Text('No events here yet', style: theme.textTheme.titleMedium),
              SizedBox(height: 6.h),
              Text(
                'Create an event and it will show up in this list.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () => context.pushNamed(RouteName.createEventScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.onSecondary,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
                ),
                child: const Text('Create event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: AppErrorRetryWidget(
        errorMessage: message,
        onRetry: onRetry,
      ),
    );
  }
}
