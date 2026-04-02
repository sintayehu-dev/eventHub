import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).padding.top + 20.h, 0, 100.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TicketWalletHeader(
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
            ),

            SizedBox(height: 20.h),
            
            // Ticket Wallet Body with expanded height
            Expanded(
              child: TicketWalletBody(tabController: _tabController),
            ),
          ],
        ),
      ),
    );
  }

  void _refreshTickets() {
    final userId = LocalStorage.instance.getUserId();
    if (userId != null) {
      context.read<TicketWalletBloc>().add(
            TicketWalletEvent.refreshWallet(userId: userId),
      );
    }
  }
}