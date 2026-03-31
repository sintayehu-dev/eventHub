import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import '../attendee_tickets/attendee_tickets_list_view.dart';
import '../attendee_tickets/attendee_tickets_error.dart';
import '../attendee_tickets/attendee_tickets_loading.dart';
import 'ticket_wallet_tab_bar.dart';
import 'ticket_wallet_summary_section.dart';
import 'ticket_wallet_search_results.dart';

class TicketWalletBody extends StatelessWidget {
  final TabController tabController;

  const TicketWalletBody({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar
        TicketWalletTabBar(controller: tabController),

        // Content
        Expanded(
          child: BlocBuilder<TicketWalletBloc, TicketWalletState>(
            builder: (context, state) {
              return state.when(
                initial: () => const AttendeeTicketsLoading(),
                loading: () => const AttendeeTicketsLoading(),
                searching: () => const AttendeeTicketsLoading(),
                loaded: (walletData) => _buildWalletContent(context, walletData),
                ticketsLoaded: (tickets, filterType, selectedStatus) =>
                    AttendeeTicketsListView(tickets: tickets),
                searchResults: (tickets, query) =>
                    TicketWalletSearchResults(tickets: tickets, query: query),
                error: (error) => AttendeeTicketsError(
                  error: error,
                  onRetry: () => _refreshTickets(context),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWalletContent(BuildContext context, TicketWalletData walletData) {
    return Column(
      children: [
        // Summary Cards
        TicketWalletSummarySection(walletData: walletData),

        // Tabs Content
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
    );
  }

  void _refreshTickets(BuildContext context) {
    final userId = context.read<AuthStatusBloc>().state.user?.uid;
    if (userId != null) {
      context.read<TicketWalletBloc>().add(
            TicketWalletEvent.refreshWallet(userId: userId),
          );
    }
  }
}
