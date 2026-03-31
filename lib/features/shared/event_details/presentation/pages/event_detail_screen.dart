import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
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
      return const Scaffold(
        backgroundColor: Color(0xFF1A0B2E),
        body: Center(
          child: Text(
            'Event not found',
            style: TextStyle(color: Colors.white),
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
      backgroundColor: const Color(0xFF1A0B2E),
      body: BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingState(),
            loading: () => _buildLoadingState(),
            loadingDetails: () => _buildLoadingState(),
            loaded: (events, isSearchResult, selectedCategory, searchFilters) =>
                _buildLoadingState(),
            eventDetailsLoaded: (event) =>
                _buildEventDetailContent(context, event),
            error: (networkException) =>
                _buildErrorState(networkException.toString()),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
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

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: const Color(0xFFEF4444), size: 48.sp),
          SizedBox(height: 16.h),
          Text(
            'Failed to load event details',
            style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetailContent(BuildContext context, EventDiscoveryEntity event) {
    return CustomScrollView(
      slivers: [
        EventDetailSliverAppBar(event: event),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryBadge(event),
                SizedBox(height: 16.h),
                Text(
                  event.title,
                  style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold, height: 1.2),
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
                _buildLocationSection(event),
                SizedBox(height: 24.h),
                _buildOrganizerSection(event),
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
    );
  }

  Widget _buildCategoryBadge(EventDiscoveryEntity event) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF8B5CF6),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        event.category.name.toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600, letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildLocationSection(EventDiscoveryEntity event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: const Color(0xFF8B5CF6), size: 20.sp),
            SizedBox(width: 8.w),
            Text('Location', style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2A1B3D),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF8B5CF6).withValues(alpha: 0.3), width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(color: const Color(0xFF4ADE80).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12.r)),
                child: Icon(Icons.location_city, color: const Color(0xFF4ADE80), size: 24.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.location, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    if (event.distance != null)
                      Text('${event.distance!.toStringAsFixed(1)} km away', style: TextStyle(color: Colors.grey[400], fontSize: 14.sp)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrganizerSection(EventDiscoveryEntity event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Organizer', style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600)),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2A1B3D),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF8B5CF6).withValues(alpha: 0.3), width: 1),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: const Color(0xFFF59E0B),
                child: Text(_getInitials(event.organizerName), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.organizerName, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    Text('Event Organizer', style: TextStyle(color: Colors.grey[400], fontSize: 14.sp)),
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