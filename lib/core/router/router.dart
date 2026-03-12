import 'package:go_router/go_router.dart';
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
import 'package:eventhub/features/attendee/ticket_wallet/presentation/pages/attendee_tickets_screen.dart';
import 'package:eventhub/features/attendee/profile/presentation/pages/attendee_profile_screen.dart';

// Organizer screens
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_home_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_events_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_analytics_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/create_event_screen.dart';
import 'package:eventhub/features/organizer/event_management/presentation/pages/organizer_event_detail_screen.dart';
import 'package:eventhub/features/organizer/attendee_management/presentation/pages/event_attendees_screen.dart';
import 'package:eventhub/features/organizer/attendee_management/presentation/pages/attendee_list_screen.dart';
import 'package:eventhub/features/organizer/profile/presentation/pages/organizer_profile_screen.dart';

// Staff screens
import 'package:eventhub/features/staff/ticket_scanner/presentation/pages/staff_home_screen.dart';
import 'package:eventhub/features/staff/checkin_management/presentation/pages/attendees_screen.dart';
import 'package:eventhub/features/staff/checkin_management/presentation/pages/staff_reports_screen.dart';
import 'package:eventhub/features/staff/profile/presentation/pages/staff_settings_screen.dart';

// Shared screens
import 'package:eventhub/features/shared/event_details/presentation/pages/event_detail_screen.dart';

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
              name: RouteName.attendeeTickets,
              path: '/attendee/tickets',
              builder: (context, state) => const AttendeeTicketsScreen(),
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
        // Staff Attendees Branch (index 1)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.staffAttendees,
              path: '/staff/attendees',
              builder: (context, state) => const AttendeesScreen(),
            ),
          ],
        ),
        // Staff Reports Branch (index 2)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.staffReports,
              path: '/staff/reports',
              builder: (context, state) => const StaffReportsScreen(),
            ),
          ],
        ),
        // Staff Settings Branch (index 3)
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.staffSettings,
              path: '/staff/settings',
              builder: (context, state) => const StaffSettingsScreen(),
            ),
          ],
        ),
      ],
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
  ],
);


