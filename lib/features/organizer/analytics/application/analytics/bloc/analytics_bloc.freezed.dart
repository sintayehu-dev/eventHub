// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalyticsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, AnalyticsPeriod period)
        loadAnalytics,
    required TResult Function(AnalyticsPeriod period) changePeriod,
    required TResult Function() refreshAnalytics,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, AnalyticsPeriod period)?
        loadAnalytics,
    TResult? Function(AnalyticsPeriod period)? changePeriod,
    TResult? Function()? refreshAnalytics,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, AnalyticsPeriod period)? loadAnalytics,
    TResult Function(AnalyticsPeriod period)? changePeriod,
    TResult Function()? refreshAnalytics,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAnalytics value) loadAnalytics,
    required TResult Function(_ChangePeriod value) changePeriod,
    required TResult Function(_RefreshAnalytics value) refreshAnalytics,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAnalytics value)? loadAnalytics,
    TResult? Function(_ChangePeriod value)? changePeriod,
    TResult? Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAnalytics value)? loadAnalytics,
    TResult Function(_ChangePeriod value)? changePeriod,
    TResult Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsEventCopyWith<$Res> {
  factory $AnalyticsEventCopyWith(
          AnalyticsEvent value, $Res Function(AnalyticsEvent) then) =
      _$AnalyticsEventCopyWithImpl<$Res, AnalyticsEvent>;
}

/// @nodoc
class _$AnalyticsEventCopyWithImpl<$Res, $Val extends AnalyticsEvent>
    implements $AnalyticsEventCopyWith<$Res> {
  _$AnalyticsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadAnalyticsImplCopyWith<$Res> {
  factory _$$LoadAnalyticsImplCopyWith(
          _$LoadAnalyticsImpl value, $Res Function(_$LoadAnalyticsImpl) then) =
      __$$LoadAnalyticsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String organizerId, AnalyticsPeriod period});
}

/// @nodoc
class __$$LoadAnalyticsImplCopyWithImpl<$Res>
    extends _$AnalyticsEventCopyWithImpl<$Res, _$LoadAnalyticsImpl>
    implements _$$LoadAnalyticsImplCopyWith<$Res> {
  __$$LoadAnalyticsImplCopyWithImpl(
      _$LoadAnalyticsImpl _value, $Res Function(_$LoadAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? period = null,
  }) {
    return _then(_$LoadAnalyticsImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
    ));
  }
}

/// @nodoc

class _$LoadAnalyticsImpl implements _LoadAnalytics {
  const _$LoadAnalyticsImpl({required this.organizerId, required this.period});

  @override
  final String organizerId;
  @override
  final AnalyticsPeriod period;

  @override
  String toString() {
    return 'AnalyticsEvent.loadAnalytics(organizerId: $organizerId, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAnalyticsImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizerId, period);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAnalyticsImplCopyWith<_$LoadAnalyticsImpl> get copyWith =>
      __$$LoadAnalyticsImplCopyWithImpl<_$LoadAnalyticsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, AnalyticsPeriod period)
        loadAnalytics,
    required TResult Function(AnalyticsPeriod period) changePeriod,
    required TResult Function() refreshAnalytics,
    required TResult Function() clearError,
  }) {
    return loadAnalytics(organizerId, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, AnalyticsPeriod period)?
        loadAnalytics,
    TResult? Function(AnalyticsPeriod period)? changePeriod,
    TResult? Function()? refreshAnalytics,
    TResult? Function()? clearError,
  }) {
    return loadAnalytics?.call(organizerId, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, AnalyticsPeriod period)? loadAnalytics,
    TResult Function(AnalyticsPeriod period)? changePeriod,
    TResult Function()? refreshAnalytics,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadAnalytics != null) {
      return loadAnalytics(organizerId, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAnalytics value) loadAnalytics,
    required TResult Function(_ChangePeriod value) changePeriod,
    required TResult Function(_RefreshAnalytics value) refreshAnalytics,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadAnalytics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAnalytics value)? loadAnalytics,
    TResult? Function(_ChangePeriod value)? changePeriod,
    TResult? Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadAnalytics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAnalytics value)? loadAnalytics,
    TResult Function(_ChangePeriod value)? changePeriod,
    TResult Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadAnalytics != null) {
      return loadAnalytics(this);
    }
    return orElse();
  }
}

abstract class _LoadAnalytics implements AnalyticsEvent {
  const factory _LoadAnalytics(
      {required final String organizerId,
      required final AnalyticsPeriod period}) = _$LoadAnalyticsImpl;

  String get organizerId;
  AnalyticsPeriod get period;

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAnalyticsImplCopyWith<_$LoadAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePeriodImplCopyWith<$Res> {
  factory _$$ChangePeriodImplCopyWith(
          _$ChangePeriodImpl value, $Res Function(_$ChangePeriodImpl) then) =
      __$$ChangePeriodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnalyticsPeriod period});
}

/// @nodoc
class __$$ChangePeriodImplCopyWithImpl<$Res>
    extends _$AnalyticsEventCopyWithImpl<$Res, _$ChangePeriodImpl>
    implements _$$ChangePeriodImplCopyWith<$Res> {
  __$$ChangePeriodImplCopyWithImpl(
      _$ChangePeriodImpl _value, $Res Function(_$ChangePeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
  }) {
    return _then(_$ChangePeriodImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
    ));
  }
}

/// @nodoc

class _$ChangePeriodImpl implements _ChangePeriod {
  const _$ChangePeriodImpl({required this.period});

  @override
  final AnalyticsPeriod period;

  @override
  String toString() {
    return 'AnalyticsEvent.changePeriod(period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePeriodImpl &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePeriodImplCopyWith<_$ChangePeriodImpl> get copyWith =>
      __$$ChangePeriodImplCopyWithImpl<_$ChangePeriodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, AnalyticsPeriod period)
        loadAnalytics,
    required TResult Function(AnalyticsPeriod period) changePeriod,
    required TResult Function() refreshAnalytics,
    required TResult Function() clearError,
  }) {
    return changePeriod(period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, AnalyticsPeriod period)?
        loadAnalytics,
    TResult? Function(AnalyticsPeriod period)? changePeriod,
    TResult? Function()? refreshAnalytics,
    TResult? Function()? clearError,
  }) {
    return changePeriod?.call(period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, AnalyticsPeriod period)? loadAnalytics,
    TResult Function(AnalyticsPeriod period)? changePeriod,
    TResult Function()? refreshAnalytics,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (changePeriod != null) {
      return changePeriod(period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAnalytics value) loadAnalytics,
    required TResult Function(_ChangePeriod value) changePeriod,
    required TResult Function(_RefreshAnalytics value) refreshAnalytics,
    required TResult Function(_ClearError value) clearError,
  }) {
    return changePeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAnalytics value)? loadAnalytics,
    TResult? Function(_ChangePeriod value)? changePeriod,
    TResult? Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return changePeriod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAnalytics value)? loadAnalytics,
    TResult Function(_ChangePeriod value)? changePeriod,
    TResult Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (changePeriod != null) {
      return changePeriod(this);
    }
    return orElse();
  }
}

abstract class _ChangePeriod implements AnalyticsEvent {
  const factory _ChangePeriod({required final AnalyticsPeriod period}) =
      _$ChangePeriodImpl;

  AnalyticsPeriod get period;

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePeriodImplCopyWith<_$ChangePeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshAnalyticsImplCopyWith<$Res> {
  factory _$$RefreshAnalyticsImplCopyWith(_$RefreshAnalyticsImpl value,
          $Res Function(_$RefreshAnalyticsImpl) then) =
      __$$RefreshAnalyticsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshAnalyticsImplCopyWithImpl<$Res>
    extends _$AnalyticsEventCopyWithImpl<$Res, _$RefreshAnalyticsImpl>
    implements _$$RefreshAnalyticsImplCopyWith<$Res> {
  __$$RefreshAnalyticsImplCopyWithImpl(_$RefreshAnalyticsImpl _value,
      $Res Function(_$RefreshAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshAnalyticsImpl implements _RefreshAnalytics {
  const _$RefreshAnalyticsImpl();

  @override
  String toString() {
    return 'AnalyticsEvent.refreshAnalytics()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshAnalyticsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, AnalyticsPeriod period)
        loadAnalytics,
    required TResult Function(AnalyticsPeriod period) changePeriod,
    required TResult Function() refreshAnalytics,
    required TResult Function() clearError,
  }) {
    return refreshAnalytics();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, AnalyticsPeriod period)?
        loadAnalytics,
    TResult? Function(AnalyticsPeriod period)? changePeriod,
    TResult? Function()? refreshAnalytics,
    TResult? Function()? clearError,
  }) {
    return refreshAnalytics?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, AnalyticsPeriod period)? loadAnalytics,
    TResult Function(AnalyticsPeriod period)? changePeriod,
    TResult Function()? refreshAnalytics,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (refreshAnalytics != null) {
      return refreshAnalytics();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAnalytics value) loadAnalytics,
    required TResult Function(_ChangePeriod value) changePeriod,
    required TResult Function(_RefreshAnalytics value) refreshAnalytics,
    required TResult Function(_ClearError value) clearError,
  }) {
    return refreshAnalytics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAnalytics value)? loadAnalytics,
    TResult? Function(_ChangePeriod value)? changePeriod,
    TResult? Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return refreshAnalytics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAnalytics value)? loadAnalytics,
    TResult Function(_ChangePeriod value)? changePeriod,
    TResult Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (refreshAnalytics != null) {
      return refreshAnalytics(this);
    }
    return orElse();
  }
}

abstract class _RefreshAnalytics implements AnalyticsEvent {
  const factory _RefreshAnalytics() = _$RefreshAnalyticsImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$AnalyticsEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'AnalyticsEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, AnalyticsPeriod period)
        loadAnalytics,
    required TResult Function(AnalyticsPeriod period) changePeriod,
    required TResult Function() refreshAnalytics,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, AnalyticsPeriod period)?
        loadAnalytics,
    TResult? Function(AnalyticsPeriod period)? changePeriod,
    TResult? Function()? refreshAnalytics,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, AnalyticsPeriod period)? loadAnalytics,
    TResult Function(AnalyticsPeriod period)? changePeriod,
    TResult Function()? refreshAnalytics,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAnalytics value) loadAnalytics,
    required TResult Function(_ChangePeriod value) changePeriod,
    required TResult Function(_RefreshAnalytics value) refreshAnalytics,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAnalytics value)? loadAnalytics,
    TResult? Function(_ChangePeriod value)? changePeriod,
    TResult? Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAnalytics value)? loadAnalytics,
    TResult Function(_ChangePeriod value)? changePeriod,
    TResult Function(_RefreshAnalytics value)? refreshAnalytics,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements AnalyticsEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$AnalyticsState {
  OrganizerAnalyticsEntity? get analytics => throw _privateConstructorUsedError;
  AnalyticsComparison? get comparison => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AnalyticsPeriod get selectedPeriod => throw _privateConstructorUsedError;
  String? get organizerId => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsStateCopyWith<AnalyticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsStateCopyWith(
          AnalyticsState value, $Res Function(AnalyticsState) then) =
      _$AnalyticsStateCopyWithImpl<$Res, AnalyticsState>;
  @useResult
  $Res call(
      {OrganizerAnalyticsEntity? analytics,
      AnalyticsComparison? comparison,
      bool isLoading,
      bool hasError,
      String errorMessage,
      AnalyticsPeriod selectedPeriod,
      String? organizerId});

  $OrganizerAnalyticsEntityCopyWith<$Res>? get analytics;
  $AnalyticsComparisonCopyWith<$Res>? get comparison;
}

/// @nodoc
class _$AnalyticsStateCopyWithImpl<$Res, $Val extends AnalyticsState>
    implements $AnalyticsStateCopyWith<$Res> {
  _$AnalyticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analytics = freezed,
    Object? comparison = freezed,
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedPeriod = null,
    Object? organizerId = freezed,
  }) {
    return _then(_value.copyWith(
      analytics: freezed == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as OrganizerAnalyticsEntity?,
      comparison: freezed == comparison
          ? _value.comparison
          : comparison // ignore: cast_nullable_to_non_nullable
              as AnalyticsComparison?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPeriod: null == selectedPeriod
          ? _value.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerAnalyticsEntityCopyWith<$Res>? get analytics {
    if (_value.analytics == null) {
      return null;
    }

    return $OrganizerAnalyticsEntityCopyWith<$Res>(_value.analytics!, (value) {
      return _then(_value.copyWith(analytics: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsComparisonCopyWith<$Res>? get comparison {
    if (_value.comparison == null) {
      return null;
    }

    return $AnalyticsComparisonCopyWith<$Res>(_value.comparison!, (value) {
      return _then(_value.copyWith(comparison: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsStateImplCopyWith<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  factory _$$AnalyticsStateImplCopyWith(_$AnalyticsStateImpl value,
          $Res Function(_$AnalyticsStateImpl) then) =
      __$$AnalyticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrganizerAnalyticsEntity? analytics,
      AnalyticsComparison? comparison,
      bool isLoading,
      bool hasError,
      String errorMessage,
      AnalyticsPeriod selectedPeriod,
      String? organizerId});

  @override
  $OrganizerAnalyticsEntityCopyWith<$Res>? get analytics;
  @override
  $AnalyticsComparisonCopyWith<$Res>? get comparison;
}

/// @nodoc
class __$$AnalyticsStateImplCopyWithImpl<$Res>
    extends _$AnalyticsStateCopyWithImpl<$Res, _$AnalyticsStateImpl>
    implements _$$AnalyticsStateImplCopyWith<$Res> {
  __$$AnalyticsStateImplCopyWithImpl(
      _$AnalyticsStateImpl _value, $Res Function(_$AnalyticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analytics = freezed,
    Object? comparison = freezed,
    Object? isLoading = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedPeriod = null,
    Object? organizerId = freezed,
  }) {
    return _then(_$AnalyticsStateImpl(
      analytics: freezed == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as OrganizerAnalyticsEntity?,
      comparison: freezed == comparison
          ? _value.comparison
          : comparison // ignore: cast_nullable_to_non_nullable
              as AnalyticsComparison?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPeriod: null == selectedPeriod
          ? _value.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AnalyticsStateImpl implements _AnalyticsState {
  const _$AnalyticsStateImpl(
      {this.analytics,
      this.comparison,
      this.isLoading = false,
      this.hasError = false,
      this.errorMessage = '',
      this.selectedPeriod = AnalyticsPeriod.thisMonth,
      this.organizerId});

  @override
  final OrganizerAnalyticsEntity? analytics;
  @override
  final AnalyticsComparison? comparison;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final AnalyticsPeriod selectedPeriod;
  @override
  final String? organizerId;

  @override
  String toString() {
    return 'AnalyticsState(analytics: $analytics, comparison: $comparison, isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, selectedPeriod: $selectedPeriod, organizerId: $organizerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsStateImpl &&
            (identical(other.analytics, analytics) ||
                other.analytics == analytics) &&
            (identical(other.comparison, comparison) ||
                other.comparison == comparison) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedPeriod, selectedPeriod) ||
                other.selectedPeriod == selectedPeriod) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, analytics, comparison, isLoading,
      hasError, errorMessage, selectedPeriod, organizerId);

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsStateImplCopyWith<_$AnalyticsStateImpl> get copyWith =>
      __$$AnalyticsStateImplCopyWithImpl<_$AnalyticsStateImpl>(
          this, _$identity);
}

abstract class _AnalyticsState implements AnalyticsState {
  const factory _AnalyticsState(
      {final OrganizerAnalyticsEntity? analytics,
      final AnalyticsComparison? comparison,
      final bool isLoading,
      final bool hasError,
      final String errorMessage,
      final AnalyticsPeriod selectedPeriod,
      final String? organizerId}) = _$AnalyticsStateImpl;

  @override
  OrganizerAnalyticsEntity? get analytics;
  @override
  AnalyticsComparison? get comparison;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  AnalyticsPeriod get selectedPeriod;
  @override
  String? get organizerId;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsStateImplCopyWith<_$AnalyticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
