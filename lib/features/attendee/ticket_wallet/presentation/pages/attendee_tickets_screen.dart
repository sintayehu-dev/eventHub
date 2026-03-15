import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_state.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';

class AttendeeTicketsScreen extends StatefulWidget {
  const AttendeeTicketsScreen({super.key});

  @override
  State<AttendeeTicketsScreen> createState() => _AttendeeTicketsScreenState();
}

class _AttendeeTicketsScreenState extends State<AttendeeTicketsScreen> {
  int selectedTab = 0; // 0 for UPCOMING, 1 for PAST
  String? _userId;

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthStatusBloc>().state;
    _userId = authState.user?.uid;

    if (_userId != null) {
      context.read<TicketWalletBloc>().add(
            TicketWalletEvent.loadWalletTickets(userId: _userId!),
          );
    }
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
      child: BlocBuilder<AuthStatusBloc, AuthStatusState>(
        builder: (context, authState) {
          if (authState.status == AuthStatus.unknown || authState.isLoading) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: SafeArea(
                child: Column(
                  children: [
                    _buildHeader(),
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (authState.status != AuthStatus.authenticated ||
              authState.user == null) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: SafeArea(
                child: Column(
                  children: [
                    _buildHeader(),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Please log in to view your tickets',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
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
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Column(
                children: [
                  // Header
                  _buildHeader(),

                  // Tab Bar
                  _buildTabBar(),

                  // Tickets List
                  Expanded(
                    child: BlocBuilder<TicketWalletBloc, TicketWalletState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => _buildLoadingState(),
                          loading: () => _buildLoadingState(),
                          searching: () => _buildLoadingState(),
                          loaded: (walletData) =>
                              _buildTicketsContent(walletData),
                          ticketsLoaded:
                              (tickets, filterType, selectedStatus) =>
                                  _buildTicketsListFromData(tickets),
                          searchResults: (tickets, query) =>
                              _buildTicketsListFromData(tickets),
                          error: (message) => _buildErrorState(message),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: colorScheme.primary,
                    size: 20.sp,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'My Tickets',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.search,
                  color: colorScheme.primary,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedTab = 0),
                child: Column(
                  children: [
                    Text(
                      'UPCOMING',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: selectedTab == 0 
                            ? colorScheme.primary
                            : colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 2.h,
                      width: 60.w,
                      color: selectedTab == 0 
                          ? colorScheme.primary
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 32.w),
              GestureDetector(
                onTap: () => setState(() => selectedTab = 1),
                child: Column(
                  children: [
                    Text(
                      'PAST',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: selectedTab == 1 
                            ? colorScheme.primary
                            : colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 2.h,
                      width: 40.w,
                      color: selectedTab == 1 
                          ? colorScheme.primary
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;

        return Center(
          child: CircularProgressIndicator(
            color: colorScheme.primary,
          ),
        );
      },
    );
  }

  Widget _buildErrorState(NetworkExceptions error) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: colorScheme.error,
                size: 48.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                'Failed to load tickets',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                NetworkExceptions.getRawErrorMessage(error),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 16.h),
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
        );
      },
    );
  }

  Widget _buildTicketsContent(TicketWalletData walletData) {
    final tickets =
        selectedTab == 0 ? walletData.upcomingTickets : walletData.pastTickets;

    return _buildTicketsListFromData(tickets);
  }

  Widget _buildTicketsListFromData(List<TicketEntity> tickets) {
    if (tickets.isEmpty) {
      return Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final colorScheme = theme.colorScheme;
          
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.confirmation_number_outlined,
                  color: colorScheme.primary,
                  size: 48.sp,
                ),
                SizedBox(height: 16.h),
                Text(
                  selectedTab == 0 ? 'No upcoming tickets' : 'No past tickets',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  selectedTab == 0
                      ? 'Your upcoming event tickets will appear here'
                      : 'Your past event tickets will appear here',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: tickets.length,
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        return _buildTicketCard(tickets[index]);
      },
    );
  }

  Widget _buildTicketCard(TicketEntity ticket) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        return GestureDetector(
          onTap: () => _viewTicketDetails(ticket),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.surface,
                ],
              ),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image with Concert Scene
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Stack(
                children: [
                  // Concert background
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.r)),
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                              colorScheme.surface,
                              colorScheme.primaryContainer,
                              colorScheme.primary.withValues(alpha: 0.3),
                        ],
                      ),
                    ),
                  ),

                  // Stage lights effect
                  Positioned(
                    top: 20.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.8,
                          colors: [
                                colorScheme.onSurface.withValues(alpha: 0.6),
                                colorScheme.tertiary.withValues(alpha: 0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // QR Code placeholder in center
                  if (ticket.isActive && ticket.isUpcoming)
                    Positioned(
                      top: 40.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                                color:
                                    colorScheme.surface.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.qr_code,
                                color: colorScheme.onSurface,
                            size: 40.sp,
                          ),
                        ),
                      ),
                    ),

                  // Status badge
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: _getStatusColor(ticket.status),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        ticket.status.displayName,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Event Details
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    ticket.eventTitle,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Date and Time
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        _formatDateTime(ticket.eventDateTime),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          ticket.eventLocation,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.7),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  
                  // Ticket Type and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TICKET TYPE',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.6),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            ticket.ticketTypeName,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'PRICE',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$${ticket.ticketPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: const Color(0xFF8B5CF6),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // View QR Code Button
                  if (ticket.isActive && ticket.isUpcoming)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showQRCode(ticket),
                        style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                                  color: colorScheme.onPrimary,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'View QR Code',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }

  Color _getStatusColor(TicketStatus status) {
    switch (status) {
      case TicketStatus.confirmed:
        return Theme.of(context).colorScheme.primary;
      case TicketStatus.pending:
        return Colors.orange;
      case TicketStatus.cancelled:
      case TicketStatus.refunded:
        return Colors.red;
      case TicketStatus.used:
        return Colors.blue;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    final month = months[dateTime.month - 1];
    final day = dateTime.day;
    final year = dateTime.year;
    final hour = dateTime.hour;
    final minute = dateTime.minute;

    final timeString =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    return '$month $day, $year • $timeString';
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