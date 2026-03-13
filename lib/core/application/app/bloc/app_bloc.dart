import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/utils/local_storage.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<GetThemeMode>(_onGetThemeMode);
    on<ChangeTheme>(_onChangeTheme);
    on<AppInitialized>(_onAppInitialized);
  }

  Future<void> _onGetThemeMode(GetThemeMode event, Emitter<AppState> emit) async {
    final isDarkMode = LocalStorage.instance.getAppThemeMode();
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<AppState> emit) async {
    await LocalStorage.instance.setAppThemeMode(event.isDarkMode);
    emit(state.copyWith(isDarkMode: event.isDarkMode));
  }

  void _onAppInitialized(AppInitialized event, Emitter<AppState> emit) {
    emit(state.copyWith(isInitialized: true));
  }
} 
