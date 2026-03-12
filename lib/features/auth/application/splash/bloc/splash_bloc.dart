import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_event.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_state.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
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
      final authRepository = getIt<AuthRepository>();

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

      // Check Firebase auth status
      final result = await authRepository.getCurrentUser();

      await result.fold(
        (failure) async {
          log('Auth check failed: $failure');
          if (!emit.isDone) {
            emit(state.copyWith(
                isLoading: false, isError: false, routeName: RouteName.login));
          }
        },
        (firebaseUser) async {
          if (firebaseUser != null) {
            log('User is authenticated: ${firebaseUser.email}');
            // Save user data locally
            await userService.saveUserData(firebaseUser);

            // Get user profile to determine role
            final userProfile =
                await userService.getUserProfile(firebaseUser.uid);

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
              // User profile not found, redirect to login
              log('User profile not found in Firestore');
              if (!emit.isDone) {
                emit(state.copyWith(
                    isLoading: false,
                    isError: false,
                    routeName: RouteName.login));
              }
            }
          } else {
            log('No authenticated user found');
            if (!emit.isDone) {
              emit(state.copyWith(
                  isLoading: false,
                  isError: false,
                  routeName: RouteName.login));
            }
          }
        },
      );
    } catch (e) {
      log('Splash error: $e');
      if (!emit.isDone) {
        emit(state.copyWith(isLoading: false, isError: true));
      }
    }
  }
} 
