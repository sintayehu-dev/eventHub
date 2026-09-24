import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/floating_pill_navigation_bar.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/analytics/presentation/widgets/analytics/analytics_period_selector.dart';
import 'package:eventhub/features/organizer/analytics/presentation/widgets/analytics/analytics_key_metrics_grid.dart';
import 'package:eventhub/features/organizer/analytics/presentation/widgets/analytics/analytics_revenue_overview.dart';
import 'package:eventhub/features/organizer/analytics/presentation/widgets/analytics/top_performing_events_list.dart';
import 'package:eventhub/features/organizer/analytics/presentation/widgets/analytics/category_revenue_breakdown.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';

class OrganizerAnalyticsScreen extends StatelessWidget {
  const OrganizerAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = getIt<UserService>();
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    return BlocProvider(
      create: (_) => getIt<AnalyticsBloc>()
        ..add(AnalyticsEvent.loadAnalytics(
          organizerId: currentUser.uid,
          period: AnalyticsPeriod.thisMonth,
        )),
      child: const OrganizerAnalyticsView(),
    );
  }
}

class OrganizerAnalyticsView extends StatelessWidget {
  const OrganizerAnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnalyticsBloc, AnalyticsState>(
      listener: (context, state) {
        if (state.hasError && state.errorMessage.isNotEmpty) {
          AppHelpers.showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: _buildContent(context, state),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, AnalyticsState state) {
    if (state.isLoading) {
      return _buildShimmerContent(context);
    }

    if (state.hasError && state.errorMessage.isNotEmpty) {
      return _buildErrorContent(context, state.errorMessage);
    }

    if (state.analytics != null) {
      return _buildLoadedContent(context);
    }

    return _buildShimmerContent(context);
  }

  Widget _buildLoadedContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<AnalyticsBloc>()
            .add(const AnalyticsEvent.refreshAnalytics());
      },
      color: colorScheme.primary,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          20.w,
          16.h,
          20.w,
          FloatingPillNavigationBar.clearance(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text('Insights', style: theme.textTheme.headlineMedium),
            SizedBox(height: 20.h),

            const AnalyticsPeriodSelector(),
            SizedBox(height: 24.h),

            const AnalyticsKeyMetricsGrid(),
            SizedBox(height: 28.h),
            
            const TopPerformingEventsList(),
            SizedBox(height: 28.h),

            const CategoryRevenueBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, String message) {
    return AppErrorRetryWidget(
      errorMessage: message,
      onRetry: () {
        context
            .read<AnalyticsBloc>()
            .add(const AnalyticsEvent.refreshAnalytics());
      },
    );
  }

  Widget _buildShimmerContent(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    Widget metricTile() => ShimmerBox(
          width: double.infinity,
          height: 148.h,
          borderRadius: BorderRadius.circular(28.r),
        );

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        20.w,
        16.h,
        20.w,
        FloatingPillNavigationBar.clearance(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Static title, same as the loaded screen
          Text('Insights', style: theme.textTheme.headlineMedium),
          SizedBox(height: 20.h),

          // Period selector
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Row(
              children: List.generate(
                3,
                (_) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ShimmerBox(
                      height: 40.h,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),

          // Key metrics: 2 x 2 tinted cards
          Row(
            children: [
              Expanded(child: metricTile()),
              SizedBox(width: 12.w),
              Expanded(child: metricTile()),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(child: metricTile()),
              SizedBox(width: 12.w),
              Expanded(child: metricTile()),
            ],
          ),
          SizedBox(height: 28.h),

          // Top performing events
          Text('Top performing events', style: theme.textTheme.titleLarge),
          SizedBox(height: 14.h),
          ...List.generate(
            3,
            (_) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  children: [
                    ShimmerCircle(size: 36.w),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerText(width: 160.w, height: 14.h),
                          SizedBox(height: 6.h),
                          ShimmerText(width: 70.w, height: 12.h),
                        ],
                      ),
                    ),
                    ShimmerText(width: 64.w, height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
