import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'organizer_event_item_card.dart';

class OrganizerEventsListSection extends StatelessWidget {
  const OrganizerEventsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventManagementBloc, EventManagementState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _EmptyState(),
          loading: () => _buildLoadingList(),
          eventsLoaded: (events) => _buildEventsList(context, events),
          eventLoaded: (event) => _buildEventsList(context, [event]),
          error: (message) => _ErrorState(message: message),
          eventCreated: (event) => _buildEventsList(context, [event]),
          eventUpdated: (event) => _buildEventsList(context, [event]),
          eventDeleted: () => const _EmptyState(message: 'Event deleted successfully'),
          eventCancelled: (event) => _buildEventsList(context, [event]),
          eventDuplicated: (event) => _buildEventsList(context, [event]),
          eventsSearched: (events) => _buildEventsList(context, events),
          statisticsLoaded: (_) => const SizedBox.shrink(),
          bannerUploaded: (_) => const SizedBox.shrink(),
          bannerDeleted: () => const SizedBox.shrink(),
        );
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
  final String? message;
  const _EmptyState({this.message});

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
              message ?? 'No events found',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (message == null) ...[
              SizedBox(height: 8.h),
              Text(
                'Create your first event to get started',
                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () => context.pushNamed(RouteName.createEventScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                ),
                child: Text('Create Event', style: TextStyle(color: colorScheme.onPrimary)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: colorScheme.error, size: 48.sp),
            SizedBox(height: 16.h),
            Text(
              'Error loading events',
              style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(message, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                // This would ideally retry the last event, but for now it's simple
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
