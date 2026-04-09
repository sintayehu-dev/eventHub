import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_error_retry_widget.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/staff/reports/application/staff_reports/bloc/staff_reports_bloc.dart';
import 'package:eventhub/features/staff/reports/domain/entities/staff_report_entity.dart';
import 'package:eventhub/features/staff/reports/presentation/widgets/reports_shimmer.dart';
import 'package:eventhub/features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart';

class StaffReportsScreen extends StatelessWidget {
  const StaffReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StaffReportsBloc>(),
      child: const StaffReportsView(),
    );
  }
}

class StaffReportsView extends StatefulWidget {
  const StaffReportsView({super.key});

  @override
  State<StaffReportsView> createState() => _StaffReportsViewState();
}

class _StaffReportsViewState extends State<StaffReportsView> {
  ReportTimePeriod _selectedPeriod = ReportTimePeriod.today;

  @override
  void initState() {
    super.initState();
    _loadReportsData();
  }

  void _loadReportsData() {
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();
    final staffId = currentUser?.uid ?? 'unknown_staff';

    // Get the current event from staff event assignment bloc
    final staffEventBloc = context.read<StaffEventAssignmentBloc>();
    final staffEventState = staffEventBloc.state;

    String? eventId;

    // Extract event ID from different state types
    staffEventState.when(
      initial: () => eventId = null,
      loading: () => eventId = null,
      eventsLoaded: (events, selectedEvent) {
        if (selectedEvent != null) {
          eventId = selectedEvent.eventId;
        } else if (events.isNotEmpty) {
          eventId = events.first.eventId;
        }
      },
      eventSelected: (events, selectedEvent) => eventId = selectedEvent.eventId,
      accessGranted: (events, selectedEvent, permissions) =>
          eventId = selectedEvent.eventId,
      accessDenied: (message) => eventId = null,
      assignmentsRefreshed: (events, selectedEvent) {
        if (selectedEvent != null) {
          eventId = selectedEvent.eventId;
        } else if (events.isNotEmpty) {
          eventId = events.first.eventId;
        }
      },
      error: (message) => eventId = null,
    );

    // Use fallback event ID if no assignment found
    final finalEventId = eventId ?? '1774346204603_176467';

    // Load all reports data
    context.read<StaffReportsBloc>()
      ..add(StaffReportsEvent.loadRealTimeMetrics(
        eventId: finalEventId,
        staffId: staffId,
      ))
      ..add(StaffReportsEvent.loadReport(
        eventId: finalEventId,
        staffId: staffId,
        timePeriod: ReportTimePeriod.today,
      ))
      ..add(StaffReportsEvent.loadCheckInAnalytics(
        eventId: finalEventId,
        startDate: DateTime.now().subtract(const Duration(hours: 24)),
        endDate: DateTime.now(),
      ))
      ..add(StaffReportsEvent.loadStaffPerformance(
        eventId: finalEventId,
        startDate: DateTime.now().subtract(const Duration(hours: 24)),
        endDate: DateTime.now(),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: BlocConsumer<StaffReportsBloc, StaffReportsState>(
        listener: (context, state) {
          if (state.hasError && state.errorMessage.isNotEmpty) {
            AppHelpers.showErrorSnackBar(
                context, 'Error loading reports: ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _loadReportsData();
            },
            color: colorScheme.primary,
            backgroundColor: colorScheme.surfaceContainerHighest,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20.w,
                  20.w + MediaQuery.of(context).padding.top, 20.w, 20.w + 90.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(),
                  SizedBox(height: 24.h),

                  // Time Period Selector
                  _buildTimePeriodSelector(),
                  SizedBox(height: 24.h),

                  // Content based on state
                  _buildContent(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(StaffReportsState state) {
    // Show shimmer when loading and no data available
    if (state.isLoading && state.report == null && state.metrics == null) {
      return const ReportsShimmer();
    }

    // Show error state if there's an error and no cached data
    if (state.hasError &&
        state.errorMessage.isNotEmpty &&
        state.report == null &&
        state.metrics == null) {
      return _buildErrorState(state.errorMessage);
    }

    // Show content if we have data (even if loading for refresh)
    if (state.report != null) {
      return _buildReportContent(state.report!);
    }

    if (state.metrics != null) {
      return _buildMetricsContent(state.metrics!);
    }

    // Fallback to shimmer
    return const ReportsShimmer();
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reports',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<StaffReportsBloc, StaffReportsState>(
          builder: (context, state) {
            return IconButton(
              onPressed: state.isLoading
                  ? null
                  : () {
                      context.read<StaffReportsBloc>().add(
                            const StaffReportsEvent.refreshReport(),
                          );
                    },
              icon: state.isLoading
                  ? SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(colorScheme.primary),
                      ),
                    )
                  : Icon(
                      Icons.refresh,
                      color: colorScheme.primary,
                      size: 24.sp,
                    ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimePeriodSelector() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: ReportTimePeriod.values.take(3).map((period) {
          final isSelected = _selectedPeriod == period;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                // Get current state to check if loading
                final currentState = context.read<StaffReportsBloc>().state;
                if (currentState.isLoading) {
                  return; // Prevent changes while loading
                }
                
                setState(() {
                  _selectedPeriod = period;
                });
                context.read<StaffReportsBloc>().add(
                      StaffReportsEvent.changeTimePeriod(timePeriod: period),
                    );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  period.displayName,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return AppErrorRetryWidget(
      errorMessage: message,
      onRetry: () {
        context.read<StaffReportsBloc>().add(
              const StaffReportsEvent.refreshReport(),
            );
      },
    );
  }

  Widget _buildMetricsContent(StaffReportMetrics metrics) {
    return Column(
      children: [
        _buildKeyMetrics(metrics),
        SizedBox(height: 32.h),
        
        // Show staff performance shimmer if loading
        BlocBuilder<StaffReportsBloc, StaffReportsState>(
          builder: (context, state) {
            if (state.isLoadingAnalytics && state.staffPerformance.isEmpty) {
              return const StaffPerformanceShimmer();
            }
            return _buildEventSummary(metrics);
          },
        ),
      ],
    );
  }

  Widget _buildReportContent(StaffReportEntity report) {
    return Column(
      children: [
        _buildKeyMetrics(report.metrics),
        SizedBox(height: 32.h),
        
        // Show staff performance shimmer if loading, otherwise show data
        BlocBuilder<StaffReportsBloc, StaffReportsState>(
          builder: (context, state) {
            if (state.isLoadingAnalytics && report.staffPerformance.isEmpty) {
              return const StaffPerformanceShimmer();
            }
            return _buildStaffPerformance(report.staffPerformance);
          },
        ),
        SizedBox(height: 32.h),
        _buildEventSummary(report.metrics),
      ],
    );
  }

  Widget _buildKeyMetrics(StaffReportMetrics metrics) {
    return BlocBuilder<StaffReportsBloc, StaffReportsState>(
      builder: (context, state) {
        // Show shimmer if metrics are loading and we don't have data
        if (state.isLoadingMetrics && state.metrics == null) {
          return const MetricsShimmer();
        }
        
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    title: 'Total Check-ins',
                    value: '${metrics.totalCheckIns}',
                    change: '+${metrics.todayCheckIns} today',
                    color: const Color(0xFF4ADE80),
                    icon: Icons.check_circle,
                    isLoading: state.isLoadingMetrics,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildMetricCard(
                    title: 'Avg. Wait Time',
                    value: '${metrics.averageWaitTime.toStringAsFixed(1)} min',
                    change: 'Real-time data',
                    color: const Color(0xFF06B6D4),
                    icon: Icons.timer,
                    isLoading: state.isLoadingMetrics,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    title: 'Peak Hour',
                    value: metrics.peakHour,
                    change: '${metrics.peakHourCheckIns} entries',
                    color: const Color(0xFFF59E0B),
                    icon: Icons.trending_up,
                    isLoading: state.isLoadingMetrics,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildMetricCard(
                    title: 'Check-in Rate',
                    value: '${metrics.checkInRate.toStringAsFixed(1)}%',
                    change:
                        '${metrics.checkedInAttendees}/${metrics.totalAttendees}',
                    color: const Color(0xFF8B5CF6),
                    icon: Icons.analytics,
                    isLoading: state.isLoadingMetrics,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String change,
    required Color color,
    required IconData icon,
    bool isLoading = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    icon,
                    color: color,
                    size: 16.sp,
                  ),
                  if (isLoading)
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation(
                            color.withValues(alpha: 0.7)),
                      ),
                    ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            change,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffPerformance(List<StaffPerformanceData> staffPerformance) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Staff Performance',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...staffPerformance.take(5).map((staff) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildStaffItem(
                name: staff.staffName,
                checkIns: '${staff.checkIns}',
                avgTime: '${staff.averageWaitTime.toStringAsFixed(1)} min',
                status: staff.status,
                color: _getStatusColor(staff.status),
          ),
            )),
      ],
    );
  }

  Widget _buildEventSummary(StaffReportMetrics metrics) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event Summary',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          _buildSummaryRow('Total Attendees', '${metrics.totalAttendees}'),
          _buildSummaryRow('Checked In', '${metrics.checkedInAttendees}'),
          _buildSummaryRow('Issues Resolved', '${metrics.issuesResolved}'),
          _buildSummaryRow('Pending Issues', '${metrics.pendingIssues}'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffItem({
    required String name,
    required String checkIns,
    required String avgTime,
    required String status,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.person,
              color: color,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '$checkIns check-ins • $avgTime avg',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              status,
              style: theme.textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    final colorScheme = Theme.of(context).colorScheme;
    
    switch (status.toLowerCase()) {
      case 'active':
        return colorScheme.tertiary;
      case 'idle':
        return colorScheme.secondary;
      case 'offline':
        return colorScheme.error;
      default:
        return colorScheme.primary;
    }
  }
}