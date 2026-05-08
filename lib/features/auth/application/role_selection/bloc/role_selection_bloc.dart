import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/auth/application/role_selection/bloc/role_selection_event.dart';
import 'package:eventhub/features/auth/application/role_selection/bloc/role_selection_state.dart';
import 'package:eventhub/features/auth/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

@injectable
class RoleSelectionBloc
    extends Bloc<RoleSelectionEvent, RoleSelectionState> {
  final UserService _userService;

  RoleSelectionBloc(this._userService)
      : super(const RoleSelectionState()) {
    on<RoleSelected>(_onRoleSelected);
  }

  String _getRouteNameForRole(String role) {
    switch (role.toLowerCase()) {
      case 'attendee':
        return RouteName.attendeeHome;
      case 'organizer':
        return RouteName.organizerHome;
      default:
        return RouteName.attendeeHome;
    }
  }

  Future<void> _onRoleSelected(
    RoleSelected event,
    Emitter<RoleSelectionState> emit,
  ) async {
    final connected = await AppConnectivity.connectivity();

    if (!connected) {
      emit(state.copyWith(
        isError: true,
        errorMessage: "No internet connection. Please check your network.",
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, isError: false));

    try {
      // Get current Firebase user
      final firebaseUser = _userService.getCurrentUser();

      if (firebaseUser == null) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: "No user found. Please sign in again.",
        ));
        return;
      }

      // Create user profile with selected role
      final userProfile = UserProfileEntity.fromFirebaseUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        displayName: firebaseUser.displayName,
        photoURL: firebaseUser.photoUrl,
        isEmailVerified: firebaseUser.emailVerified,
        role: event.role,
      );

      // Save to Firestore
      await _userService.createUserProfile(userProfile);

      // Get route name based on role
      final routeName = _getRouteNameForRole(event.role);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        routeName: routeName,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: 'Failed to create profile: ${e.toString()}',
      ));
    }
  }
}
