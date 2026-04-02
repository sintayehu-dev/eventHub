
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/navigation/navigation_service.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/auth/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/sign_up/sign_up_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/terms/terms_and_conditions_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/splash/splash_screen.dart';
import 'package:eventhub/features/auth/presentation/providers/auth_providers.dart';

// Role-based imports
import 'package:eventhub/core/presentation/main/attendee_shell_page.dart';
import 'package:eventhub/core/presentation/main/organizer_shell_page.dart';
import 'package:eventhub/core/presentation/main/staff_shell_page.dart';

// Attendee screens
import 'package:eventhub/features/attendee/event_discovery/presentation/pages/attendee_home_screen.dart';
import 'package:eventhub/features/attendee/event_discovery/presentation/pages/discover_screen.dart';
import 'package:eventhub/features/attendee/profile/presentation/pages/attendee_profile_screen.dart';

// Ticket purchase screens
import 'package:eventhub/features/attendee/ticket_purchase/presentation/pages/ticket_selection_screen.dart';
import 'package:eventhub/features/attendee/ticket_purchase/presentation/pages/purchase_confirmation_screen.dart';
import 'package:eventhub/features/attendee/ticket_purchase/presentation/pages/purchase_success_screen.dart';
import 'package:eventhub/features/attendee/ticket_purchase/application/ticket_purchase/bloc/ticket_purchase_bloc.dart';

// Ticket wallet screens
import 'package:eventhub/features/attendee/ticket_wallet/presentation/pages/ticket_wallet_screen.dart';
import 'package:eventhub/features/attendee/ticket_wallet/presentation/pages/ticket_details_screen.dart';
import 'package:eventhub/features/attendee/ticket_wallet/presentation/pages/ticket_qr_screen.dart';
import 'package:eventhub/features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart';

// Event discovery
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

// Organizer screens
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_home_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_events_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_analytics_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/create_event_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/edit_event_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_event_detail_screen.dart';
import 'package:eventhub/features/organizer/attendee_management/presentation/pages/event_attendees_screen.dart';
import 'package:eventhub/features/organizer/attendee_management/presentation/pages/attendee_list_screen.dart';
import 'package:eventhub/features/organizer/profile/presentation/pages/organizer_profile_screen.dart';

// Staff screens
import 'package:eventhub/features/staff/ticket_scanner/presentation/pages/staff_home_screen.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/pages/qr_scanner_screen.dart';
import 'package:eventhub/features/staff/attendee_management/presentation/pages/attendees_screen.dart';
import 'package:eventhub/features/staff/reports/presentation/pages/staff_reports_screen.dart';
import 'package:eventhub/features/staff/profile/presentation/pages/staff_profile_screen.dart';

// Shared screens
import 'package:eventhub/features/shared/event_details/presentation/pages/event_detail_screen.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

final router = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: '/${RouteName.splash}',
  routes: [
    // Splash
    GoRoute(
      name: RouteName.splash,
      path: '/${RouteName.splash}',
      builder: (context, state) => const SplashPage(),
    ),

    // Onboarding
    GoRoute(
      name: RouteName.onboarding,
      path: '/${RouteName.onboarding}',
      builder: (context, state) => const OnboardingPage(),
    ),

    // Sign Up
    GoRoute(
      name: RouteName.registrationScreen,
      path: '/${RouteName.registrationScreen}',
      builder: (context, state) => const AuthProviders(
        child: SignUpScreen(),
      ),
    ),

    // Sign Up (alternative route)
    GoRoute(
      name: RouteName.signUp,
      path: '/${RouteName.signUp}',
      builder: (context, state) => const AuthProviders(
        child: SignUpScreen(),
      ),
    ),

    // Sign In
    GoRoute(
      name: RouteName.login,
      path: '/${RouteName.login}',
      builder: (context, state) => const AuthProviders(
        child: SignInScreen(),
      ),
    ),

    // Sign In (alternative route)
    GoRoute(
      name: RouteName.signIn,
      path: '/${RouteName.signIn}',
      builder: (context, state) => const AuthProviders(
        child: SignInScreen(),
      ),
    ),

    // Terms and Conditions
    GoRoute(
      name: RouteName.termsAndConditionsScreen,
      path: '/${RouteName.termsAndConditionsScreen}',
      builder: (context, state) => const TermsAndConditionsScreen(),
    ),

    // Terms (alternative route)
    GoRoute(
      name: RouteName.terms,
      path: '/${RouteName.terms}',
      builder: (context, state) => const TermsAndConditionsScreen(),
    ),

    // Event Detail (shared route)
    GoRoute(
      name: RouteName.eventDetail,
      path: '/event/:eventId',
      builder: (context, state) {
        final eventId = state.pathParameters['eventId'];
        return EventDetailScreen(eventId: eventId);
      },
    ),

    // ATTENDEE ROUTES
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AttendeeShellPage(navigationShell: navigationShell);
      },
      branches: [
        // Attendee Home Branch (index 0)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.attendeeHome,
              path: '/attendee/home',
              builder: (context, state) => const AttendeeHomeScreen(),
            ),
          ],
        ),
        // Attendee Discover Branch (index 1)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.attendeeDiscover,
              path: '/attendee/discover',
              builder: (context, state) => const DiscoverScreen(),
            ),
          ],
        ),
        // Attendee Tickets Branch (index 2)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.ticketWallet,
              path: '/attendee/tickets',
              builder: (context, state) => BlocProvider(
                create: (_) => getIt<TicketWalletBloc>(),
                child: const TicketWalletScreen(),
              ),
            ),
          ],
        ),
        // Attendee Profile Branch (index 3)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.attendeeProfile,
              path: '/attendee/profile',
              builder: (context, state) => const AttendeeProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    // ORGANIZER ROUTES
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return OrganizerShellPage(navigationShell: navigationShell);
      },
      branches: [
        // Organizer Home Branch (index 0)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.organizerHome,
              path: '/organizer/home',
              builder: (context, state) => const OrganizerHomeScreen(),
            ),
          ],
        ),
        // Organizer Events Branch (index 1)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.organizerEvents,
              path: '/organizer/events',
              builder: (context, state) => const OrganizerEventsScreen(),
            ),
          ],
        ),
        // Organizer Analytics Branch (index 2)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.organizerAnalytics,
              path: '/organizer/analytics',
              builder: (context, state) => const OrganizerAnalyticsScreen(),
            ),
          ],
        ),
        // Organizer Profile Branch (index 3)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.organizerProfile,
              path: '/organizer/profile',
              builder: (context, state) => const OrganizerProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    // STAFF ROUTES
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return StaffShellPage(navigationShell: navigationShell);
      },
      branches: [
        // Staff Scanner Branch (index 0)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.staffScanner,
              path: '/staff/scanner',
              builder: (context, state) => const StaffHomeScreen(),
            ),
          ],
        ),
        // Staff Reports Branch (index 1)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.staffReports,
              path: '/staff/reports',
              builder: (context, state) => const StaffReportsScreen(),
            ),
          ],
        ),
        // Staff Profile Branch (index 2)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.staffProfile,
              path: '/staff/profile',
              builder: (context, state) => const StaffProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    // Staff Attendees - Outside shell to allow parameters
    GoRoute(
      name: RouteName.staffAttendees,
      path: '/staff/attendees/:eventId/:staffId',
      builder: (context, state) {
        final eventId = state.pathParameters['eventId'] ?? '';
        final staffId = state.pathParameters['staffId'] ?? '';
        print(
            'Router - eventId: "$eventId", staffId: "$staffId"'); // Debug log
        return AttendeesScreen(
          eventId: eventId,
          staffId: staffId,
        );
      },
    ),

    // QR Scanner Screen (separate from shell navigation)
    GoRoute(
      name: RouteName.qrScanner,
      path: '/staff/qr-scanner',
      builder: (context, state) {
        final eventId = state.uri.queryParameters['eventId'] ?? '';
        final eventTitle = state.uri.queryParameters['eventTitle'] ?? 'Event';
        return QRScannerScreen(
          eventId: eventId,
          eventTitle: eventTitle,
        );
      },
    ),

    // Legacy home route (redirect to attendee for now)
    GoRoute(
      name: RouteName.home,
      path: '/${RouteName.home}',
      redirect: (context, state) => '/attendee/home',
    ),

    // Create Event Screen
    GoRoute(
      name: RouteName.createEventScreen,
      path: '/organizer/create-event',
      builder: (context, state) => const CreateEventScreen(),
    ),

    // Edit Event Screen
    GoRoute(
      name: RouteName.editEventScreen,
      path: '/organizer/event/:eventId/edit',
      builder: (context, state) {
        final event = state.extra as EventEntity;
        return EditEventScreen(event: event);
      },
    ),

    // Event Attendees Screen
    GoRoute(
      name: RouteName.eventAttendees,
      path: '/organizer/event/:eventId/attendees',
      builder: (context, state) {
        final eventId = state.pathParameters['eventId']!;
        return EventAttendeesScreen(eventId: eventId);
      },
    ),

    // Organizer Event Detail Screen
    GoRoute(
      name: RouteName.organizerEventDetail,
      path: '/organizer/event/:eventId/details',
      builder: (context, state) {
        final eventId = state.pathParameters['eventId']!;
        return OrganizerEventDetailScreen(eventId: eventId);
      },
    ),

    // Attendee List Screen
    GoRoute(
      name: RouteName.attendeeList,
      path: '/organizer/event/:eventId/attendee-list',
      builder: (context, state) {
        final eventId = state.pathParameters['eventId']!;
        return AttendeeListScreen(eventId: eventId);
      },
    ),

    // TICKET PURCHASE ROUTES
    GoRoute(
      name: RouteName.ticketSelection,
      path: '/ticket-selection',
      builder: (context, state) {
        final event = state.extra as EventDiscoveryEntity;
        return TicketSelectionScreen(event: event);
      },
    ),

    GoRoute(
      name: RouteName.purchaseConfirmation,
      path: '/purchase-confirmation',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider(
          create: (_) => getIt<TicketPurchaseBloc>(),
          child: PurchaseConfirmationScreen(
            event: data['event'] as EventDiscoveryEntity,
            selectedTickets:
                data['selectedTickets'] as List<Map<String, dynamic>>,
            totalAmount: data['totalAmount'] as double,
          ),
        );
      },
    ),

    GoRoute(
      name: RouteName.purchaseSuccess,
      path: '/purchase-success',
      builder: (context, state) {
        final result = state.extra as PurchaseResult;
        return PurchaseSuccessScreen(purchaseResult: result);
      },
    ),

    GoRoute(
      name: RouteName.ticketDetails,
      path: '/ticket/:ticketId/details',
      builder: (context, state) {
        final ticket = state.extra as TicketEntity;
        return TicketDetailsScreen(ticket: ticket);
      },
    ),

    GoRoute(
      name: RouteName.ticketQR,
      path: '/ticket/:ticketId/qr',
      builder: (context, state) {
        final ticket = state.extra as TicketEntity;
        return TicketQRScreen(ticket: ticket);
      },
    ),
  ],
);


