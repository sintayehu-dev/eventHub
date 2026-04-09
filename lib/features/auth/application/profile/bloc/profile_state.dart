import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    FirebaseUserEntity? user,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default('') String successMessage,
    @Default(false) bool isUpdating,
  }) = _ProfileState;

  const ProfileState._();

  bool get hasUser => user != null;
  bool get isEmailVerified => user?.emailVerified ?? false;
}