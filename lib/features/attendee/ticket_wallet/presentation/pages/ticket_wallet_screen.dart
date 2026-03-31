import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import '../widgets/ticket_wallet_header.dart';
import '../widgets/ticket_wallet/ticket_wallet_body.dart';

class TicketWalletScreen extends StatelessWidget {
  const TicketWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketWalletBloc>(),
      child: const _TicketWalletScreenContent(),
    );
  }
}

class _TicketWalletScreenContent extends StatefulWidget {
  const _TicketWalletScreenContent();

  @override
  State<_TicketWalletScreenContent> createState() => _TicketWalletScreenContentState();
}

class _TicketWalletScreenContentState extends State<_TicketWalletScreenContent>
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
        body: SafeArea(
          child: Column(
            children: [
              const TicketWalletHeader(title: 'My Tickets'),
              Expanded(
                child: Center(
                  child: Text(
                    'Please log in to view your tickets',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            TicketWalletHeader(
              title: 'My Tickets',
              action: GestureDetector(
                onTap: _refreshTickets,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.refresh_rounded,
                    color: colorScheme.primary,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: TicketWalletBody(tabController: _tabController),
            ),
          ],
        ),
      ),
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