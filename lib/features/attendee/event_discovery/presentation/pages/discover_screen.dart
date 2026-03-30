import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Search Bar
            _buildSearchBar(),
            
            // Category Chips
            _buildCategoryChips(),
            
            // Results Header
            _buildResultsHeader(),
            
            // Events List
            Expanded(
              child: _buildEventsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: colorScheme.primary,
                    size: 20.sp,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Search Events',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.tune,
                  color: colorScheme.primary,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: colorScheme.primary,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search events...',
                      hintStyle: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    onSubmitted: (query) {
                      if (query.isNotEmpty) {
                        context.read<EventDiscoveryBloc>().add(
                              EventDiscoveryEvent.searchEvents(
                                filters: EventSearchFilters(query: query),
                                limit: 20,
                              ),
                            );
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    context.read<EventDiscoveryBloc>().add(
                          const EventDiscoveryEvent.loadUpcomingEvents(
                              limit: 20),
                        );
                  },
                  child: Icon(
                    Icons.close,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryChips() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        final categories = [
          {'name': 'All', 'category': null},
          {'name': 'Music', 'category': EventCategory.music},
          {'name': 'Tech', 'category': EventCategory.technology},
          {'name': 'Arts', 'category': EventCategory.arts},
          {'name': 'Sports', 'category': EventCategory.sports},
        ];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                final isSelected = category['name'] == selectedCategory;
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category['name'] as String;
                      });

                      if (category['category'] == null) {
                        // Load all events
                        context.read<EventDiscoveryBloc>().add(
                              const EventDiscoveryEvent.loadUpcomingEvents(
                                  limit: 20),
                            );
                      } else {
                        // Filter by category
                        context.read<EventDiscoveryBloc>().add(
                              EventDiscoveryEvent.loadEventsByCategory(
                                category: category['category'] as EventCategory,
                                limit: 20,
                              ),
                            );
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getCategoryIcon(category['name'] as String),
                            color: isSelected
                                ? colorScheme.onPrimary
                                : colorScheme.primary,
                            size: 14.sp,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            category['name'] as String,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResultsHeader() {
    return BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        final eventCount = state.maybeWhen(
          loaded: (events, _, __, ___) => events.length,
          orElse: () => 0,
        );
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Row(
            children: [
              Text(
                '$eventCount Results Found',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  _buildFilterIcon(Icons.calendar_today),
                  SizedBox(width: 12.w),
                  _buildFilterIcon(Icons.location_on),
                  SizedBox(width: 12.w),
                  _buildFilterIcon(Icons.tune),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterIcon(IconData icon) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        
        return Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: colorScheme.primary,
            size: 16.sp,
          ),
        );
      },
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
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 5, // Show 5 shimmer cards
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) => _buildShimmerEventCard(),
    );
  }

  Widget _buildErrorState(String message) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: colorScheme.error,
                size: 48.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                'Failed to load events',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  context.read<EventDiscoveryBloc>().add(
                        const EventDiscoveryEvent.refreshEvents(),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEventsListContent(List<EventDiscoveryEntity> events) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        if (events.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_busy,
                  color: colorScheme.primary,
                  size: 48.sp,
                ),
                SizedBox(height: 16.h),
                Text(
                  'No events found',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Try adjusting your search or category filter',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: events.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            return _buildEventCard(events[index]);
          },
        );
      },
    );
  }

  Widget _buildEventCard(EventDiscoveryEntity event) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return GestureDetector(
          onTap: () {
            context.pushNamed(
              RouteName.eventDetail,
              pathParameters: {'eventId': event.id},
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.surface,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Image with Concert Scene
                Container(
                  height: 280.h,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r)),
                  ),
                  child: Stack(
                    children: [
                      // Event banner or placeholder
                      event.bannerUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r)),
                              child: Image.network(
                                event.bannerUrl!,
                                height: 280.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    _buildImagePlaceholder(),
                              ),
                            )
                          : _buildImagePlaceholder(),

                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.r)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.7),
                            ],
                          ),
                        ),
                      ),
                      
                      // Price tag
                      Positioned(
                        top: 20.h,
                        right: 20.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Text(
                            event.priceRange,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Event Details
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date, Location and Bookmark
                      Row(
                        children: [
                          Text(
                            '${_formatDate(event.dateTime)} • ${event.location}',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            event.isFavorite == true
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: colorScheme.primary,
                            size: 24.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      // Event Title
                      Text(
                        event.title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Event Description
                      Text(
                        event.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16.h),
                      
                      // Attendees and organizer info
                      Row(
                        children: [
                          // Profile pictures stack (placeholder)
                          SizedBox(
                            width: 80.w,
                            height: 32.h,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  child:
                                      _buildAttendeeAvatar(colorScheme.outline),
                                ),
                                Positioned(
                                  left: 20.w,
                                  child: _buildAttendeeAvatar(
                                      colorScheme.outlineVariant),
                                ),
                                Positioned(
                                  left: 40.w,
                                  child: _buildAttendeeAvatar(colorScheme
                                      .primary
                                      .withValues(alpha: 0.5)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            event.attendeeCount != null
                                ? '+${event.attendeeCount} attending'
                                : 'by ${event.organizerName}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePlaceholder() {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.surface,
                colorScheme.primaryContainer,
                colorScheme.primary.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Stage lights effect
              Positioned(
                top: 40.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.8,
                      colors: [
                        colorScheme.onSurface.withValues(alpha: 0.9),
                        colorScheme.tertiary.withValues(alpha: 0.6),
                        colorScheme.primary.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAttendeeAvatar(Color color) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        
        return Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.surface,
              width: 3,
            ),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Music':
        return Icons.music_note;
      case 'Tech':
        return Icons.computer;
      case 'Arts':
        return Icons.palette;
      case 'Sports':
        return Icons.sports_soccer;
      default:
        return Icons.category;
    }
  }

  String _formatDate(DateTime dateTime) {
    final months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return '${months[dateTime.month - 1]} ${dateTime.day}';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildShimmerEventCard() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return Container(
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.surface,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shimmer Image
              ShimmerBox(
                width: double.infinity,
                height: 280.h,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),

              // Shimmer Content
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer Date and Location with bookmark
                    Row(
                      children: [
                        ShimmerText(
                          width: 200.w,
                          height: 14.h,
                        ),
                        const Spacer(),
                        ShimmerBox(
                          width: 24.w,
                          height: 24.h,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    // Shimmer Title
                    ShimmerText(
                      width: double.infinity,
                      height: 22.h,
                    ),
                    SizedBox(height: 12.h),

                    // Shimmer Description (3 lines)
                    ShimmerText(
                      width: double.infinity,
                      height: 16.h,
                    ),
                    SizedBox(height: 6.h),
                    ShimmerText(
                      width: double.infinity,
                      height: 16.h,
                    ),
                    SizedBox(height: 6.h),
                    ShimmerText(
                      width: 250.w,
                      height: 16.h,
                    ),
                    SizedBox(height: 16.h),

                    // Shimmer Attendees section
                    Row(
                      children: [
                        // Shimmer profile pictures
                        SizedBox(
                          width: 80.w,
                          height: 32.h,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: ShimmerCircle(size: 32.w),
                              ),
                              Positioned(
                                left: 20.w,
                                child: ShimmerCircle(size: 32.w),
                              ),
                              Positioned(
                                left: 40.w,
                                child: ShimmerCircle(size: 32.w),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        ShimmerText(
                          width: 120.w,
                          height: 16.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}