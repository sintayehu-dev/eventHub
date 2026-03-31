import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import '../active_event_card.dart';

class OrganizerActiveEventsSection extends StatelessWidget {
  const OrganizerActiveEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventManagementBloc, EventManagementState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildLoadingEvents(context),
          loading: () => _buildLoadingEvents(context),
          eventsLoaded: (events) => _buildActiveEventsContent(context, events),
          eventLoaded: (event) => _buildActiveEventsContent(context, [event]),
          error: (message) => _buildErrorSection(context, message),
          eventCreated: (event) => _buildActiveEventsContent(context, [event]),
          eventUpdated: (event) => _buildActiveEventsContent(context, [event]),
          eventDeleted: () => _buildLoadingEvents(context),
          eventCancelled: (event) => _buildActiveEventsContent(context, [event]),
          eventDuplicated: (event) => _buildActiveEventsContent(context, [event]),
          eventsSearched: (events) => _buildActiveEventsContent(context, events),
          statisticsLoaded: (statistics) => _buildLoadingEvents(context),
          bannerUploaded: (bannerUrl) => _buildLoadingEvents(context),
          bannerDeleted: () => _buildLoadingEvents(context),
        );
      },
    );
  }

  Widget _buildActiveEventsContent(BuildContext context, List<EventEntity> events) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    if (events.isEmpty) {
      return _buildEmptyEventsSection(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active Events',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => context.pushNamed(RouteName.organizerEvents),
              child: Text(
                'View All',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ...events.take(3).map((event) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: ActiveEventCard(
            event: event,
            onTap: () => context.pushNamed(
              RouteName.organizerEventDetail,
              pathParameters: {'eventId': event.id},
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildEmptyEventsSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Events',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Icon(Icons.event_note, color: colorScheme.onSurfaceVariant, size: 48.sp),
              SizedBox(height: 16.h),
              Text(
                'No Active Events',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Create your first event to get started',
                style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => context.pushNamed(RouteName.createEventScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                child: Text(
                  'Create Event',
                  style: theme.textTheme.labelLarge?.copyWith(color: colorScheme.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingEvents(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Events',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...List.generate(3, (index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: const _ShimmerEventCard(),
        )),
      ],
    );
  }

  Widget _buildErrorSection(BuildContext context, String message) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: colorScheme.error, size: 32.sp),
          SizedBox(height: 8.h),
          Text(
            'Error loading events',
            style: theme.textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
          ),
          SizedBox(height: 4.h),
          Text(
            message,
            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ShimmerEventCard extends StatelessWidget {
  const _ShimmerEventCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ShimmerBox(
            width: 60.w,
            height: 60.h,
            borderRadius: BorderRadius.circular(12.r),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerText(
                  width: double.infinity,
                  height: 18.h,
                ),
                SizedBox(height: 8.h),
                ShimmerText(
                  width: 120.w,
                  height: 14.h,
                ),
                SizedBox(height: 4.h),
                ShimmerText(
                  width: 150.w,
                  height: 14.h,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerText(
                      width: 80.w,
                      height: 12.h,
                    ),
                    ShimmerText(
                      width: 60.w,
                      height: 14.h,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                ShimmerBox(
                  width: double.infinity,
                  height: 4.h,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
