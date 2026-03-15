import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';

class TicketWalletScreen extends StatefulWidget {
  const TicketWalletScreen({super.key});

  @override
  State<TicketWalletScreen> createState() => _TicketWalletScreenState();
}

class _TicketWalletScreenState extends State<TicketWalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    final authState = context.read<AuthStatusBloc>().state;
    _userId = authState.user?.uid;

    if (_userId != null) {
      context.read<TicketWalletBloc>().add(
        TicketWalletEvent.loadWalletTickets(userId: _userId!),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    if (_userId == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'My Tickets',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
        ),
        body: Center(
          child: Text(
            'Please log in to view your tickets',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'My Tickets',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _refreshTickets(),
            icon: const Icon(Icons.refresh),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurface.withValues(alpha: 0.6),
          indicatorColor: colorScheme.primary,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: BlocBuilder<TicketWalletBloc, TicketWalletState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Loading...')),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
            searching: () => Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary,
              ),
            ),
            loaded: (walletData) => _buildWalletContent(walletData),
            ticketsLoaded: (tickets, filterType, selectedStatus) =>
                _buildTicketsList(tickets),
            searchResults: (tickets, query) => _buildSearchResults(tickets, query),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${NetworkExceptions.getRawErrorMessage(message)}',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshTickets,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWalletContent(TicketWalletData walletData) {
    return Column(
      children: [
        // Summary Cards
        _buildSummaryCards(walletData),
        
        // Tabs Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTicketsList(walletData.upcomingTickets),
              _buildTicketsList(walletData.pastTickets),
              _buildAllTicketsView(walletData),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCards(TicketWalletData walletData) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              'Total Tickets',
              walletData.totalTickets.toString(),
              Icons.confirmation_number,
              Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              'Active',
              walletData.activeTickets.toString(),
              Icons.check_circle,
              Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              'Upcoming',
              walletData.upcomingTickets.length.toString(),
              Icons.schedule,
              Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllTicketsView(TicketWalletData walletData) {
    final allTickets = [
      ...walletData.upcomingTickets,
      ...walletData.pastTickets,
      ...walletData.cancelledTickets,
    ];
    
    return _buildTicketsList(allTickets);
  }

  Widget _buildTicketsList(List<TicketEntity> tickets) {
    if (tickets.isEmpty) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.confirmation_number_outlined,
              size: 64,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'No tickets found',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return _buildTicketCard(ticket);
      },
    );
  }

  Widget _buildTicketCard(TicketEntity ticket) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: colorScheme.primaryContainer,
      child: InkWell(
        onTap: () => _viewTicketDetails(ticket),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.eventTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ticket.ticketTypeName,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusChip(ticket.status),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${ticket.eventDateTime.day}/${ticket.eventDateTime.month}/${ticket.eventDateTime.year}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      ticket.eventLocation,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${ticket.ticketPrice.toStringAsFixed(2)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (ticket.isActive && ticket.isUpcoming)
                    TextButton.icon(
                      onPressed: () => _showQRCode(ticket),
                      icon: const Icon(Icons.qr_code, size: 16),
                      label: const Text('QR Code'),
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(TicketStatus status) {
    Color color;
    switch (status) {
      case TicketStatus.confirmed:
        color = Colors.green;
        break;
      case TicketStatus.pending:
        color = Colors.orange;
        break;
      case TicketStatus.cancelled:
      case TicketStatus.refunded:
        color = Colors.red;
        break;
      case TicketStatus.used:
        color = Colors.blue;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.displayName,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<TicketEntity> tickets, String query) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Search results for "$query"',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: _buildTicketsList(tickets)),
      ],
    );
  }

  void _viewTicketDetails(TicketEntity ticket) {
    context.pushNamed(
      RouteName.ticketDetails,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }

  void _showQRCode(TicketEntity ticket) {
    context.pushNamed(
      RouteName.ticketQR,
      pathParameters: {'ticketId': ticket.id},
      extra: ticket,
    );
  }

  void _refreshTickets() {
    if (_userId != null) {
      context.read<TicketWalletBloc>().add(
        TicketWalletEvent.refreshWallet(userId: _userId!),
      );
    }
  }
}