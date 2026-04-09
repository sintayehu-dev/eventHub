import 'package:flutter/material.dart';
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
          return _buildLoadingList();
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

  Widget _buildLoadingList() {
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
          (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: OrganizerEventItemCard(event: events[index]),
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_note, color: colorScheme.onSurfaceVariant, size: 64.sp),
            SizedBox(height: 16.h),
            Text(
              'No events available',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Create your first event to get started',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => context.pushNamed(RouteName.createEventScreen),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              ),
              child: Text('Create Event',
                  style: TextStyle(color: colorScheme.onPrimary)),
            ),
          ],
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
