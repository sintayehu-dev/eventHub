import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import '../attendee_tickets/attendee_tickets_list_view.dart';
import '../attendee_tickets/attendee_tickets_error.dart';
import '../attendee_tickets/attendee_tickets_loading.dart';
import 'ticket_wallet_tab_bar.dart';
import 'ticket_wallet_summary_section.dart';
import 'ticket_wallet_search_results.dart';

class TicketWalletBody extends StatefulWidget {
  final TabController tabController;

  const TicketWalletBody({
    super.key,
    required this.tabController,
  });

  @override
  State<TicketWalletBody> createState() => _TicketWalletBodyState();
}

class _TicketWalletBodyState extends State<TicketWalletBody> {
  @override
  void initState() {
    super.initState();
    // Load tickets when the widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadTickets();
    });
  }

  void _loadTickets() {
    final userId = LocalStorage.instance.getUserId();
    if (userId != null) {
      context.read<TicketWalletBloc>().add(
            TicketWalletEvent.loadWalletTickets(userId: userId),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar
        TicketWalletTabBar(controller: widget.tabController),

        // Content
        const _TicketWalletContent(),
      ],
    );
  }
}

class _TicketWalletContent extends StatelessWidget {
  const _TicketWalletContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketWalletBloc, TicketWalletState>(
      builder: (context, state) {
        // Handle error state
        if (state.hasError) {
          return AttendeeTicketsError(
            error: state.errorMessage,
            onRetry: () => _refreshTickets(context),
          );
        }

        // Handle loading states
        if (state.isLoading || state.isSearching) {
          return const Expanded(child: AttendeeTicketsLoading());
        }

        // Handle search results
        if (state.searchQuery.isNotEmpty) {
          return Expanded(
            child: TicketWalletSearchResults(
              tickets: state.tickets,
              query: state.searchQuery,
            ),
          );
        }

        // Handle wallet data (when we have walletData)
        if (state.walletData != null) {
          return _buildWalletContent(context, state.walletData!);
        }

        // Handle filtered tickets (when filterType is not 'all')
        if (state.filterType != TicketFilterType.all) {
          return Expanded(
              child: AttendeeTicketsListView(tickets: state.tickets));
        }

        // Default loading state
        return const Expanded(child: AttendeeTicketsLoading());
      },
    );
  }

  Widget _buildWalletContent(BuildContext context, TicketWalletData walletData) {
    // Get the TabController from the parent TicketWalletBody
    final ticketWalletBody =
        context.findAncestorStateOfType<_TicketWalletBodyState>();
    final tabController = ticketWalletBody?.widget.tabController;

    if (tabController == null) {
      return const AttendeeTicketsLoading();
    }

    return Expanded(
      child: Column(
        children: [
          // Summary Cards
          TicketWalletSummarySection(walletData: walletData),

          // Tabs Content with expanded height
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                AttendeeTicketsListView(tickets: walletData.upcomingTickets),
                AttendeeTicketsListView(tickets: walletData.pastTickets),
                AttendeeTicketsListView(
                  tickets: [
                    ...walletData.upcomingTickets,
                    ...walletData.pastTickets,
                    ...walletData.cancelledTickets,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _refreshTickets(BuildContext context) {
    final userId = LocalStorage.instance.getUserId();
    if (userId != null) {
      context.read<TicketWalletBloc>().add(
            TicketWalletEvent.refreshWallet(userId: userId),
          );
    }
  }
}
