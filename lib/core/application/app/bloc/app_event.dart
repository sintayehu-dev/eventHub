part of 'app_bloc.dart';

@freezed
abstract class AppEvent with _$AppEvent {
  const factory AppEvent.getThemeMode() = GetThemeMode;
  const factory AppEvent.changeTheme({required bool isDarkMode}) = ChangeTheme;
  const factory AppEvent.appInitialized() = AppInitialized;
} 
