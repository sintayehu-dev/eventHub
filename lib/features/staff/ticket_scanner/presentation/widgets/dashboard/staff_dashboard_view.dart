import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/dashboard/dashboard_stats_section.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/dashboard/dashboard_quick_actions_section.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/dashboard/dashboard_recent_checkins_section.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

class StaffDashboardView extends StatefulWidget {
  final String eventId;
  final String eventTitle;

  const StaffDashboardView({
    super.key,
    required this.eventId,
    required this.eventTitle,
  });

  @override
  State<StaffDashboardView> createState() => _StaffDashboardViewState();
}

class _StaffDashboardViewState extends State<StaffDashboardView> {
  String? _staffId;

  @override
  void initState() {
    super.initState();
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser()!; // Safe to use ! since auth is checked at splash
    _staffId = currentUser.uid;
    
    if (_staffId != null) {
      context.read<TicketScannerBloc>().add(
        TicketScannerEvent.loadStats(
          eventId: widget.eventId,
          staffId: _staffId!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Staff Dashboard',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              widget.eventTitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _refreshStats,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<TicketScannerBloc, TicketScannerState>(
        builder: (context, state) {
          if (state.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error loading dashboard',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshStats,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            );
          }

          if (state.areStatsLoaded && state.stats != null) {
            return _buildDashboardContent(state.stats!, state.recentCheckIns);
          }

          return _buildDashboardContent(null, []);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startScanning,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text('Start Scanning'),
      ),
    );
  }

  Widget _buildDashboardContent(CheckInStats? stats, List<CheckInEntity> recentCheckIns) {
    return RefreshIndicator(
      onRefresh: () async => _refreshStats(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Cards
            if (stats != null) DashboardStatsSection(stats: stats),
            const SizedBox(height: 24),
            
            // Quick Actions
            DashboardQuickActionsSection(
              onStartScanning: _startScanning,
              onViewReports: _viewReports,
            ),
            const SizedBox(height: 24),
            
            // Recent Check-ins
            DashboardRecentCheckinsSection(
              recentCheckIns: recentCheckIns,
              onViewAllCheckIns: _viewAllCheckIns,
            ),
          ],
        ),
      ),
    );
  }

  void _refreshStats() {
    if (_staffId != null) {
      context.read<TicketScannerBloc>().add(
        TicketScannerEvent.loadStats(
          eventId: widget.eventId,
          staffId: _staffId!,
        ),
      );
    }
  }

  void _startScanning() {
    // TODO: Navigate to QR scanner screen
    AppHelpers.showInfoSnackBar(context, 'QR Scanner will be implemented');
  }

  void _viewReports() {
    // TODO: Implement reports screen
    AppHelpers.showInfoSnackBar(context, 'Reports feature coming soon');
  }

  void _viewAllCheckIns() {
    // TODO: Implement all check-ins screen
    AppHelpers.showInfoSnackBar(context, 'All check-ins view coming soon');
  }
}