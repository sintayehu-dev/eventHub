// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getThemeMode,
    required TResult Function(bool isDarkMode) changeTheme,
    required TResult Function() appInitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getThemeMode,
    TResult? Function(bool isDarkMode)? changeTheme,
    TResult? Function()? appInitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getThemeMode,
    TResult Function(bool isDarkMode)? changeTheme,
    TResult Function()? appInitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetThemeMode value) getThemeMode,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(AppInitialized value) appInitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetThemeMode value)? getThemeMode,
    TResult? Function(ChangeTheme value)? changeTheme,
    TResult? Function(AppInitialized value)? appInitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetThemeMode value)? getThemeMode,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(AppInitialized value)? appInitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetThemeModeImplCopyWith<$Res> {
  factory _$$GetThemeModeImplCopyWith(
          _$GetThemeModeImpl value, $Res Function(_$GetThemeModeImpl) then) =
      __$$GetThemeModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetThemeModeImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$GetThemeModeImpl>
    implements _$$GetThemeModeImplCopyWith<$Res> {
  __$$GetThemeModeImplCopyWithImpl(
      _$GetThemeModeImpl _value, $Res Function(_$GetThemeModeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetThemeModeImpl implements GetThemeMode {
  const _$GetThemeModeImpl();

  @override
  String toString() {
    return 'AppEvent.getThemeMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetThemeModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getThemeMode,
    required TResult Function(bool isDarkMode) changeTheme,
    required TResult Function() appInitialized,
  }) {
    return getThemeMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getThemeMode,
    TResult? Function(bool isDarkMode)? changeTheme,
    TResult? Function()? appInitialized,
  }) {
    return getThemeMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getThemeMode,
    TResult Function(bool isDarkMode)? changeTheme,
    TResult Function()? appInitialized,
    required TResult orElse(),
  }) {
    if (getThemeMode != null) {
      return getThemeMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetThemeMode value) getThemeMode,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(AppInitialized value) appInitialized,
  }) {
    return getThemeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetThemeMode value)? getThemeMode,
    TResult? Function(ChangeTheme value)? changeTheme,
    TResult? Function(AppInitialized value)? appInitialized,
  }) {
    return getThemeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetThemeMode value)? getThemeMode,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(AppInitialized value)? appInitialized,
    required TResult orElse(),
  }) {
    if (getThemeMode != null) {
      return getThemeMode(this);
    }
    return orElse();
  }
}

abstract class GetThemeMode implements AppEvent {
  const factory GetThemeMode() = _$GetThemeModeImpl;
}

/// @nodoc
abstract class _$$ChangeThemeImplCopyWith<$Res> {
  factory _$$ChangeThemeImplCopyWith(
          _$ChangeThemeImpl value, $Res Function(_$ChangeThemeImpl) then) =
      __$$ChangeThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$ChangeThemeImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ChangeThemeImpl>
    implements _$$ChangeThemeImplCopyWith<$Res> {
  __$$ChangeThemeImplCopyWithImpl(
      _$ChangeThemeImpl _value, $Res Function(_$ChangeThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(_$ChangeThemeImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeThemeImpl implements ChangeTheme {
  const _$ChangeThemeImpl({required this.isDarkMode});

  @override
  final bool isDarkMode;

  @override
  String toString() {
    return 'AppEvent.changeTheme(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      __$$ChangeThemeImplCopyWithImpl<_$ChangeThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getThemeMode,
    required TResult Function(bool isDarkMode) changeTheme,
    required TResult Function() appInitialized,
  }) {
    return changeTheme(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getThemeMode,
    TResult? Function(bool isDarkMode)? changeTheme,
    TResult? Function()? appInitialized,
  }) {
    return changeTheme?.call(isDarkMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getThemeMode,
    TResult Function(bool isDarkMode)? changeTheme,
    TResult Function()? appInitialized,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(isDarkMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetThemeMode value) getThemeMode,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(AppInitialized value) appInitialized,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetThemeMode value)? getThemeMode,
    TResult? Function(ChangeTheme value)? changeTheme,
    TResult? Function(AppInitialized value)? appInitialized,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetThemeMode value)? getThemeMode,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(AppInitialized value)? appInitialized,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class ChangeTheme implements AppEvent {
  const factory ChangeTheme({required final bool isDarkMode}) =
      _$ChangeThemeImpl;

  bool get isDarkMode;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppInitializedImplCopyWith<$Res> {
  factory _$$AppInitializedImplCopyWith(_$AppInitializedImpl value,
          $Res Function(_$AppInitializedImpl) then) =
      __$$AppInitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppInitializedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppInitializedImpl>
    implements _$$AppInitializedImplCopyWith<$Res> {
  __$$AppInitializedImplCopyWithImpl(
      _$AppInitializedImpl _value, $Res Function(_$AppInitializedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AppInitializedImpl implements AppInitialized {
  const _$AppInitializedImpl();

  @override
  String toString() {
    return 'AppEvent.appInitialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppInitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getThemeMode,
    required TResult Function(bool isDarkMode) changeTheme,
    required TResult Function() appInitialized,
  }) {
    return appInitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getThemeMode,
    TResult? Function(bool isDarkMode)? changeTheme,
    TResult? Function()? appInitialized,
  }) {
    return appInitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getThemeMode,
    TResult Function(bool isDarkMode)? changeTheme,
    TResult Function()? appInitialized,
    required TResult orElse(),
  }) {
    if (appInitialized != null) {
      return appInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetThemeMode value) getThemeMode,
    required TResult Function(ChangeTheme value) changeTheme,
    required TResult Function(AppInitialized value) appInitialized,
  }) {
    return appInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetThemeMode value)? getThemeMode,
    TResult? Function(ChangeTheme value)? changeTheme,
    TResult? Function(AppInitialized value)? appInitialized,
  }) {
    return appInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetThemeMode value)? getThemeMode,
    TResult Function(ChangeTheme value)? changeTheme,
    TResult Function(AppInitialized value)? appInitialized,
    required TResult orElse(),
  }) {
    if (appInitialized != null) {
      return appInitialized(this);
    }
    return orElse();
  }
}

abstract class AppInitialized implements AppEvent {
  const factory AppInitialized() = _$AppInitializedImpl;
}

/// @nodoc
mixin _$AppState {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get isInitialized => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({bool isDarkMode, bool isInitialized});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isInitialized = null,
  }) {
    return _then(_value.copyWith(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool isInitialized});
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isInitialized = null,
  }) {
    return _then(_$AppStateImpl(
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateImpl extends _AppState {
  const _$AppStateImpl({this.isDarkMode = false, this.isInitialized = false})
      : super._();

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool isInitialized;

  @override
  String toString() {
    return 'AppState(isDarkMode: $isDarkMode, isInitialized: $isInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode, isInitialized);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState extends AppState {
  const factory _AppState({final bool isDarkMode, final bool isInitialized}) =
      _$AppStateImpl;
  const _AppState._() : super._();

  @override
  bool get isDarkMode;
  @override
  bool get isInitialized;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
