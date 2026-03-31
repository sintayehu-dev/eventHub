import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import '../widgets/discover/discover_header.dart';
import '../widgets/discover/discover_search_bar.dart';
import '../widgets/discover/discover_category_chips.dart';
import '../widgets/discover/discover_results_header.dart';
import '../widgets/discover/discover_event_card.dart';
import '../widgets/discover/discover_shimmer_card.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventDiscoveryBloc>()
        ..add(const EventDiscoveryEvent.loadUpcomingEvents(limit: 20)),
      child: const DiscoverView(),
    );
  }
}

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const DiscoverHeader(),
            
            // Search Bar
            DiscoverSearchBar(controller: _searchController),
            
            // Category Chips
            DiscoverCategoryChips(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            
            // Results Header
            const DiscoverResultsHeader(),
            
            // Events List
            Expanded(
              child: _buildEventsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsList() {
    return BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildLoadingState(),
          loading: () => _buildLoadingState(),
          loadingDetails: () => _buildLoadingState(),
          loaded: (events, isSearchResult, selectedCategory, searchFilters) =>
              _buildEventsListContent(events),
          eventDetailsLoaded: (event) => _buildEventsListContent([event]),
          error: (networkException) =>
              _buildErrorState(networkException.toString()),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 40.h),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => const DiscoverShimmerCard(),
    );
  }

  Widget _buildErrorState(String message) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                color: colorScheme.error,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Opps! Something went wrong',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: () {
                context.read<EventDiscoveryBloc>().add(
                      const EventDiscoveryEvent.refreshEvents(),
                    );
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsListContent(List<EventDiscoveryEntity> events) {
    if (events.isEmpty) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              color: colorScheme.primary.withValues(alpha: 0.5),
              size: 64.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              'No events found',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try searching for something else\nor explore different categories.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 40.h),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return DiscoverEventCard(event: events[index]);
      },
    );
  }
}