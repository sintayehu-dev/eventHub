import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_state.dart';
import '../widgets/ticket_wallet_header.dart';
import '../widgets/attendee_tickets/attendee_tickets_body.dart';

class AttendeeTicketsScreen extends StatelessWidget {
  const AttendeeTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketWalletBloc>(),
      child: const _AttendeeTicketsScreenContent(),
    );
  }
}

class _AttendeeTicketsScreenContent extends StatefulWidget {
  const _AttendeeTicketsScreenContent();

  @override
  State<_AttendeeTicketsScreenContent> createState() => __AttendeeTicketsScreenContentState();
}

class __AttendeeTicketsScreenContentState extends State<_AttendeeTicketsScreenContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

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
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, authState) {
        if (authState.status == AuthStatus.authenticated &&
            authState.user != null) {
          final newUserId = authState.user!.uid;
          if (_userId != newUserId) {
            _userId = newUserId;
            context.read<TicketWalletBloc>().add(
                  TicketWalletEvent.loadWalletTickets(userId: _userId!),
                );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              TicketWalletHeader(
                title: 'My Tickets',
                action: GestureDetector(
                  onTap: () {}, // Search functionality could be added here
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),

              // Body
              Expanded(
                child: AttendeeTicketsBody(tabController: _tabController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}