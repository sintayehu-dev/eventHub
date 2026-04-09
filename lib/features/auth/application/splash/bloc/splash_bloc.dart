import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_event.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_state.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<CheckUserStatus>(_onCheckUserStatus);
  }

  Future<void> _onCheckUserStatus(
    CheckUserStatus event, 
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final userService = getIt<UserService>();

      // Check if first time opening app
      final isFirstTime = userService.isFirstTimeOpeningApp();
      log('isFirstTime: $isFirstTime');
      
      if (isFirstTime) {
        if (!emit.isDone) {
          emit(state.copyWith(
              isLoading: false, routeName: RouteName.onboarding));
        }
        return;
      }

      // First check local storage for immediate routing
      final hasValidUserData = LocalStorage.instance.hasValidUserData();
      log('hasValidUserData from local storage: $hasValidUserData');

      if (!hasValidUserData) {
        // No valid local auth data, go to login
        log('No valid local auth data, routing to login');
        if (!emit.isDone) {
          emit(state.copyWith(
              isLoading: false, isError: false, routeName: RouteName.login));
        }
        return;
      }

      // Get stored user data and route based on role
      final userData = LocalStorage.instance.getFirebaseUserData();
      final userId = userData?['uid'] as String?;

      if (userId != null) {
        log('Found stored user: ${userData?['email']}');

        // Get user profile to determine role
        final userProfile = await userService.getUserProfile(userId);

        if (userProfile != null) {
          // Route based on user role
          String routeName;
          switch (userProfile.role.toLowerCase()) {
            case 'attendee':
              routeName = RouteName.attendeeHome;
              break;
            case 'organizer':
              routeName = RouteName.organizerHome;
              break;
            case 'staff':
              routeName = RouteName.staffScanner;
              break;
            default:
              // Default to attendee if role is unknown
              routeName = RouteName.attendeeHome;
              break;
          }

          log('Routing user with role ${userProfile.role} to $routeName');
          if (!emit.isDone) {
            emit(state.copyWith(
                isLoading: false, isError: false, routeName: routeName));
          }
        } else {
          // User profile not found, clear local data and redirect to login
          log('User profile not found in Firestore, clearing local data');
          await LocalStorage.instance.clearUserSession();
          if (!emit.isDone) {
            emit(state.copyWith(
                isLoading: false, isError: false, routeName: RouteName.login));
          }
        }
      } else {
        // Invalid stored data, clear and go to login
        log('Invalid stored user data, clearing and routing to login');
        await LocalStorage.instance.clearUserSession();
        if (!emit.isDone) {
          emit(state.copyWith(
              isLoading: false, isError: false, routeName: RouteName.login));
        }
      }
    } catch (e) {
      log('Splash error: $e');
      // Clear potentially corrupted data and go to login
      await LocalStorage.instance.clearUserSession();
      if (!emit.isDone) {
        emit(state.copyWith(
            isLoading: false, isError: false, routeName: RouteName.login));
      }
    }
  }
} 
