import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
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
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return Scaffold(
          backgroundColor: colorScheme.surface,
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
        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 90.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Analytics',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),

            const AnalyticsPeriodSelector(),
            SizedBox(height: 24.h),

            const AnalyticsKeyMetricsGrid(),
            SizedBox(height: 32.h),
            
            const TopPerformingEventsList(),
            SizedBox(height: 32.h),

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
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 90.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header shimmer
          ShimmerText(
            width: 120.w,
            height: 32.h,
          ),
          SizedBox(height: 24.h),

          // Period selector shimmer
          _buildPeriodSelectorShimmer(context),
          SizedBox(height: 24.h),

          // Key metrics grid shimmer
          _buildKeyMetricsShimmer(context),
          SizedBox(height: 32.h),

          // Top performing events shimmer
          _buildTopEventsShimmer(context),
          SizedBox(height: 32.h),

          // Category breakdown shimmer
          _buildCategoryBreakdownShimmer(context),
        ],
      ),
    );
  }

  Widget _buildPeriodSelectorShimmer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: List.generate(
          4,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: ShimmerBox(
                height: 36.h,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyMetricsShimmer(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 1.5,
      children: List.generate(
        4,
        (index) => Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: theme.colorScheme.outline.withOpacity(0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShimmerCircle(size: 24.w),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ShimmerText(
                      height: 14.h,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ShimmerText(
                width: 80.w,
                height: 24.h,
              ),
              SizedBox(height: 4.h),
              ShimmerText(
                width: 60.w,
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRevenueOverviewShimmer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerText(
            width: 140.w,
            height: 20.h,
          ),
          SizedBox(height: 20.h),
          ShimmerBox(
            width: double.infinity,
            height: 200.h,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ],
      ),
    );
  }

  Widget _buildTopEventsShimmer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerText(
            width: 180.w,
            height: 20.h,
          ),
          SizedBox(height: 16.h),
          ...List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                children: [
                  ShimmerBox(
                    width: 60.w,
                    height: 60.h,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerText(
                          width: double.infinity,
                          height: 16.h,
                        ),
                        SizedBox(height: 4.h),
                        ShimmerText(
                          width: 100.w,
                          height: 12.h,
                        ),
                        SizedBox(height: 4.h),
                        ShimmerText(
                          width: 80.w,
                          height: 12.h,
                        ),
                      ],
                    ),
                  ),
                  ShimmerText(
                    width: 60.w,
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBreakdownShimmer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerText(
            width: 160.w,
            height: 20.h,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ShimmerBox(
                  height: 150.h,
                  borderRadius: BorderRadius.circular(75.h),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Row(
                        children: [
                          ShimmerCircle(size: 12.w),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: ShimmerText(
                              height: 12.h,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
