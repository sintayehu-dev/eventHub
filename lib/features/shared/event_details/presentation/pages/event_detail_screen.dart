import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

import '../widgets/event_detail_sliver_app_bar.dart';
import '../widgets/event_detail_info_card.dart';
import '../widgets/event_detail_about_section.dart';
import '../widgets/event_detail_get_tickets_button.dart';

class EventDetailScreen extends StatelessWidget {
  final String? eventId;
  
  const EventDetailScreen({
    super.key,
    this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    if (eventId == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Text(
            'Event not found',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      );
    }

    return BlocProvider(
      create: (_) => getIt<EventDiscoveryBloc>()
        ..add(EventDiscoveryEvent.loadEventDetails(
          eventId: eventId!,
          userId: 'current_user_id', // TODO: Get from auth
        )),
      child: EventDetailView(eventId: eventId!),
    );
  }
}

class EventDetailView extends StatelessWidget {
  final String eventId;

  const EventDetailView({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
        builder: (context, state) {
          if (state.hasError) {
            return _buildErrorState(context, state.errorMessage);
          }

          if (state.isLoading || state.isLoadingDetails) {
            return _buildLoadingState(context);
          }

          if (state.selectedEvent != null) {
            return _buildEventDetailContent(context, state.selectedEvent!);
          }

          return _buildLoadingState(context);
        },
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          ShimmerBox(
            width: double.infinity,
            height: 200.h,
            borderRadius: BorderRadius.circular(16.r),
          ),
          SizedBox(height: 20.h),
          ShimmerText(width: double.infinity, height: 24.h),
          SizedBox(height: 12.h),
          ShimmerText(width: double.infinity, height: 16.h),
          SizedBox(height: 8.h),
          ShimmerText(width: 250.w, height: 16.h),
          SizedBox(height: 20.h),
          ...List.generate(
              4,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      children: [
                        ShimmerBox(width: 20.w, height: 20.h, borderRadius: BorderRadius.circular(4.r)),
                        SizedBox(width: 12.w),
                        ShimmerText(width: 200.w, height: 16.h),
                      ],
                    ),
                  )),
          const Spacer(),
          ShimmerBox(width: double.infinity, height: 50.h, borderRadius: BorderRadius.circular(12.r)),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return AppErrorRetryWidget(
      errorMessage: message,
      onRetry: () {
        context.read<EventDiscoveryBloc>().add(
              EventDiscoveryEvent.loadEventDetails(
                eventId: eventId,
                userId: 'current_user_id', // TODO: Get from auth
              ),
            );
      },
    );
  }

  Widget _buildEventDetailContent(BuildContext context, EventDiscoveryEntity event) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return SafeArea(
      top: false, // Let SliverAppBar handle the top safe area
      child: CustomScrollView(
        slivers: [
          EventDetailSliverAppBar(event: event),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryBadge(context, event),
                  SizedBox(height: 16.h),
                  Text(
                    event.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  EventDetailInfoCard(
                    icon: Icons.calendar_today,
                    title: 'Date & Time',
                    subtitle: _formatDateTime(event.dateTime),
                  ),
                  SizedBox(height: 16.h),
                  EventDetailInfoCard(
                    icon: Icons.confirmation_number,
                    title: 'Entry Price',
                    subtitle: event.priceRange,
                  ),
                  SizedBox(height: 24.h),
                  _buildLocationSection(context, event),
                  SizedBox(height: 24.h),
                  _buildOrganizerSection(context, event),
                  SizedBox(height: 24.h),
                  EventDetailAboutSection(description: event.description),
                  SizedBox(height: 32.h),
                  EventDetailGetTicketsButton(event: event),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge(BuildContext context, EventDiscoveryEntity event) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        event.category.name.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildLocationSection(
      BuildContext context, EventDiscoveryEntity event) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: colorScheme.primary, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              'Location',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
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
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.location_city,
                  color: colorScheme.secondary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.location,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (event.distance != null)
                      Text(
                        '${event.distance!.toStringAsFixed(1)} km away',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrganizerSection(
      BuildContext context, EventDiscoveryEntity event) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Organizer',
          style: theme.textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
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
              CircleAvatar(
                radius: 25.r,
                backgroundColor: colorScheme.tertiaryContainer,
                child: Text(
                  _getInitials(event.organizerName),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.organizerName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Event Organizer',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '';
    final parts = name.split(' ');
    if (parts.length > 1) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return parts[0][0].toUpperCase();
  }

  String _formatDateTime(DateTime dateTime) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year} • ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}