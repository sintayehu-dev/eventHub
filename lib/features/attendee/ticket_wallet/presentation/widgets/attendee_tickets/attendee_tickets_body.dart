import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'attendee_tickets_tab_bar.dart';
import 'attendee_tickets_list_view.dart';
import 'attendee_tickets_error.dart';
import 'attendee_tickets_loading.dart';

class AttendeeTicketsBody extends StatelessWidget {
  final TabController tabController;

  const AttendeeTicketsBody({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar
        AttendeeTicketsTabBar(controller: tabController),

        // Tickets List
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              _refreshTickets(context);
            },
            color: Theme.of(context).colorScheme.primary,
            child: BlocBuilder<TicketWalletBloc, TicketWalletState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const AttendeeTicketsLoading(),
                  loading: () => const AttendeeTicketsLoading(),
                  searching: () => const AttendeeTicketsLoading(),
                  loaded: (walletData) => TabBarView(
                    controller: tabController,
                    children: [
                      AttendeeTicketsListView(tickets: walletData.upcomingTickets),
                      AttendeeTicketsListView(tickets: walletData.pastTickets),
                    ],
                  ),
                  ticketsLoaded: (tickets, filterType, selectedStatus) =>
                      AttendeeTicketsListView(tickets: tickets),
                  searchResults: (tickets, query) =>
                      AttendeeTicketsListView(tickets: tickets),
                  error: (error) => AttendeeTicketsError(
                    error: error,
                    onRetry: () => _refreshTickets(context),
                  ),
                );
              },
            ),
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
