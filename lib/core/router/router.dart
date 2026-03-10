import 'package:go_router/go_router.dart';
import 'package:eventhub/core/navigation/navigation_service.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/auth/presentation/pages/login/login_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/registration/registration_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/terms/terms_and_conditions_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/verification/otp_verification_screen.dart';
import 'package:eventhub/features/auth/presentation/pages/splash/splash_screen.dart';
import 'package:eventhub/core/presentation/main/main_screen.dart';
import 'package:eventhub/core/presentation/main/shell_page.dart';

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

    // Registration
    GoRoute(
      name: RouteName.registrationScreen,
      path: '/${RouteName.registrationScreen}',
      builder: (context, state) => const RegistrationScreen(),
    ),

    // Login
    GoRoute(
      name: RouteName.login,
      path: '/${RouteName.login}',
      builder: (context, state) => const LoginScreen(),
    ),

    // OTP Verification
    GoRoute(
      name: RouteName.otpVerification,
      path: '/${RouteName.otpVerification}',
      builder: (context, state) {
        final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        return OTPVerificationScreen(
          phoneNumber: extra['phoneNumber'] as String,
          expiresAt: extra['expiresAt'] as DateTime?,
        );
      },
    ),

    // Terms and Conditions
    GoRoute(
      name: RouteName.termsAndConditionsScreen,
      path: '/${RouteName.termsAndConditionsScreen}',
      builder: (context, state) => const TermsAndConditionsScreen(),
    ),

    // Settings
    // GoRoute(
    //   name: RouteName.settings,
    //   path: '/${RouteName.settings}',
    //   builder: (context, state) => const SettingsPage(),
    // ),

    // Register
    // GoRoute(
    //   name: RouteName.register,
    //   path: '/${RouteName.register}',
    //   builder: (context, state) => const RegisterPage(),
    // ),

    // Shell Route for Main Navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ShellPage(navigationShell: navigationShell);
      },
      branches: [
        // Single Branch: Home/Main
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RouteName.mainScreen,
              path: '/${RouteName.mainScreen}',
              builder: (context, state) => const MainScreen(),
            ),
          ],
        ),
      ],
    )
  ]
);
