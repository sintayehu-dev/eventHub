import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_selection_state.freezed.dart';

@freezed
class RoleSelectionState with _$RoleSelectionState {
  const factory RoleSelectionState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    String? routeName,
  }) = _RoleSelectionState;
}
