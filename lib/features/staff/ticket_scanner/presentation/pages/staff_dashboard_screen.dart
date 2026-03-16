import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';

class StaffDashboardScreen extends StatefulWidget {
  final String eventId;
  final String eventTitle;

  const StaffDashboardScreen({
    super.key,
    required this.eventId,
    required this.eventTitle,
  });

  @override
  State<StaffDashboardScreen> createState() => _StaffDashboardScreenState();
}

class _StaffDashboardScreenState extends State<StaffDashboardScreen> {
  String? _staffId;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthStatusBloc>().state;
    _staffId = authState.user?.uid;
    
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
          return state.when(
            initial: () => const Center(child: Text('Loading...')),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
            scanning: () => _buildDashboardContent(null, []),
            validating: () => _buildDashboardContent(null, []),
            ticketValidated: (_) => _buildDashboardContent(null, []),
            checkingIn: () => _buildDashboardContent(null, []),
            checkInSuccess: (_) => _buildDashboardContent(null, []),
            checkInFailed: (_) => _buildDashboardContent(null, []),
            statsLoaded: (stats, recentCheckIns) => _buildDashboardContent(stats, recentCheckIns),
            error: (error) => Center(
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
            ),
          );
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
            if (stats != null) _buildStatsSection(stats),
            const SizedBox(height: 24),
            
            // Quick Actions
            _buildQuickActionsSection(),
            const SizedBox(height: 24),
            
            // Recent Check-ins
            _buildRecentCheckInsSection(recentCheckIns),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(CheckInStats stats) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Check-in Statistics',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Total Tickets',
                stats.totalTickets.toString(),
                Icons.confirmation_number,
                colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Checked In',
                stats.checkedIn.toString(),
                Icons.check_circle,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Remaining',
                stats.remaining.toString(),
                Icons.pending,
                Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Check-in Rate',
                '${stats.checkInRate.toStringAsFixed(1)}%',
                Icons.trending_up,
                Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildProgressBar(stats),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(CheckInStats stats) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progress = stats.totalTickets > 0 ? stats.checkedIn / stats.totalTickets : 0.0;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overall Progress',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${stats.checkedIn}/${stats.totalTickets}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: colorScheme.outline.withValues(alpha: 0.3),
              valueColor: AlwaysStoppedAnimation(colorScheme.primary),
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: ${_formatTime(stats.lastUpdated)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                'Start Scanning',
                'Scan QR codes to check in attendees',
                Icons.qr_code_scanner,
                colorScheme.primary,
                _startScanning,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionCard(
                'View Reports',
                'See detailed check-in reports',
                Icons.analytics,
                Colors.blue,
                _viewReports,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 40),
              const SizedBox(height: 12),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentCheckInsSection(List<CheckInEntity> recentCheckIns) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Check-ins',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (recentCheckIns.isNotEmpty)
              TextButton(
                onPressed: _viewAllCheckIns,
                child: const Text('View All'),
              ),
          ],
        ),
        const SizedBox(height: 16),
        if (recentCheckIns.isEmpty)
          Card(
            color: colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      size: 48,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No check-ins yet',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start scanning QR codes to see check-ins here',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          ...recentCheckIns.take(5).map((checkIn) => _buildCheckInCard(checkIn)),
      ],
    );
  }

  Widget _buildCheckInCard(CheckInEntity checkIn) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    checkIn.ticketHolderName ?? 'Unknown',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    checkIn.ticketTypeName ?? 'General Admission',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              _formatTime(checkIn.checkInTime),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${dateTime.day}/${dateTime.month} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('QR Scanner will be implemented')),
    );
  }

  void _viewReports() {
    // TODO: Implement reports screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reports feature coming soon')),
    );
  }

  void _viewAllCheckIns() {
    // TODO: Implement all check-ins screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All check-ins view coming soon')),
    );
  }
}