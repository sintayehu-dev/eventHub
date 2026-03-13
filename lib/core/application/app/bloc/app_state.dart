part of 'app_bloc.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isDarkMode,
    @Default(false) bool isInitialized,
  }) = _AppState;

  const AppState._();
} 
