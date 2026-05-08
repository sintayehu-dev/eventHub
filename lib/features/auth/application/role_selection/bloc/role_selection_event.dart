import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_selection_event.freezed.dart';

@freezed
class RoleSelectionEvent with _$RoleSelectionEvent {
  const factory RoleSelectionEvent.roleSelected(String role) = RoleSelected;
}
