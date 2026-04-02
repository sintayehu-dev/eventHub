import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).padding.top + 20.h, 0, 100.h),
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
              const _DiscoverEventsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscoverEventsList extends StatelessWidget {
  const _DiscoverEventsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
      builder: (context, state) {
        if (state.hasError) {
          return _buildErrorState(context, state.errorMessage);
        }

        if (state.isLoading || state.isLoadingDetails) {
          return _buildLoadingState();
        }

        return _buildEventsListContent(context, state.events);
      },
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
          child: const DiscoverShimmerCard(),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return AppErrorRetryWidget(
      errorMessage: message,
      onRetry: () {
        context.read<EventDiscoveryBloc>().add(
              const EventDiscoveryEvent.refreshEvents(),
            );
      },
    );
  }

  Widget _buildEventsListContent(
      BuildContext context, List<EventDiscoveryEntity> events) {
    if (events.isEmpty) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h),
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
              'No events available',
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

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
      child: Column(
        children: events
            .map(
              (event) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: DiscoverEventCard(event: event),
              ),
            )
            .toList(),
      ),
    );
  }
}