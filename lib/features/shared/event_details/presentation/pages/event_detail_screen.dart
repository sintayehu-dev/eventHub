import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';
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
    
    return Scaffold(
      bottomNavigationBar: BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
        builder: (context, state) {
          final event = state.selectedEvent;
          if (state.hasError) return const SizedBox.shrink();
          if (state.isLoading || state.isLoadingDetails || event == null) {
            return _buildBottomBarShimmer(context);
          }
          return EventDetailGetTicketsButton(event: event);
        },
      ),
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
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    Widget infoCard() => Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            children: [
              ShimmerCircle(size: 46.w),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerText(width: 70.w, height: 12.h),
                    SizedBox(height: 6.h),
                    ShimmerText(width: 190.w, height: 16.h),
                  ],
                ),
              ),
            ],
          ),
        );

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // Hero image, same height as the loaded header
              ShimmerBox(
                width: double.infinity,
                height: 320.h,
                borderRadius: BorderRadius.zero,
              ),
              Transform.translate(
                offset: Offset(0, -28.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.r)),
                  ),
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: 84.w,
                        height: 26.h,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      SizedBox(height: 14.h),
                      ShimmerText(width: double.infinity, height: 26.h),
                      SizedBox(height: 8.h),
                      ShimmerText(width: 220.w, height: 26.h),
                      SizedBox(height: 22.h),
                      infoCard(),
                      SizedBox(height: 12.h),
                      infoCard(),
                      SizedBox(height: 28.h),
                      ShimmerText(width: 100.w, height: 20.h),
                      SizedBox(height: 12.h),
                      infoCard(),
                      SizedBox(height: 28.h),
                      ShimmerText(width: 150.w, height: 20.h),
                      SizedBox(height: 12.h),
                      ShimmerText(width: double.infinity, height: 14.h),
                      SizedBox(height: 8.h),
                      ShimmerText(width: double.infinity, height: 14.h),
                      SizedBox(height: 8.h),
                      ShimmerText(width: 200.w, height: 14.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Keep the back button reachable while loading.
        Positioned(
          top: MediaQuery.of(context).padding.top + 8.h,
          left: 20.w,
          child: const AppBackButton(),
        ),
      ],
    );
  }

  Widget _buildBottomBarShimmer(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.fromLTRB(
        24.w,
        16.h,
        24.w,
        MediaQuery.of(context).padding.bottom + 16.h,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerText(width: 36.w, height: 12.h),
              SizedBox(height: 6.h),
              ShimmerText(width: 100.w, height: 18.h),
            ],
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: ShimmerBox(
              width: double.infinity,
              height: 56.h,
              borderRadius: BorderRadius.circular(28.r),
            ),
          ),
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
    
    return CustomScrollView(
      slivers: [
        EventDetailSliverAppBar(event: event),
        SliverToBoxAdapter(
          // Pull the sheet up over the hero image.
          child: Transform.translate(
            offset: Offset(0, -28.h),
            child: Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(32.r)),
              ),
              padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategoryBadge(context, event),
                  SizedBox(height: 14.h),
                  Text(event.title, style: theme.textTheme.headlineMedium),
                  SizedBox(height: 22.h),
                  EventDetailInfoCard(
                    icon: Icons.calendar_today_rounded,
                    title: 'Date & time',
                    subtitle: _formatDateTime(event.dateTime),
                  ),
                  SizedBox(height: 12.h),
                  EventDetailInfoCard(
                    icon: Icons.location_on_rounded,
                    title: 'Location',
                    subtitle: event.distance != null
                        ? '${event.location} • ${event.distance!.toStringAsFixed(1)} km away'
                        : event.location,
                  ),
                  SizedBox(height: 28.h),
                  _buildOrganizerSection(context, event),
                  SizedBox(height: 28.h),
                  EventDetailAboutSection(description: event.description),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBadge(BuildContext context, EventDiscoveryEntity event) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: scheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          event.category.name.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: scheme.onSecondaryContainer,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildOrganizerSection(
      BuildContext context, EventDiscoveryEntity event) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Organizer', style: theme.textTheme.titleLarge),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 23.r,
                backgroundColor: scheme.primary,
                child: Text(
                  _getInitials(event.organizerName),
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: scheme.onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.organizerName, style: theme.textTheme.titleSmall),
                    Text('Event organizer', style: theme.textTheme.bodySmall),
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