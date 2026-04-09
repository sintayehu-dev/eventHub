// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_reports_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffReportsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffReportsEventCopyWith<$Res> {
  factory $StaffReportsEventCopyWith(
          StaffReportsEvent value, $Res Function(StaffReportsEvent) then) =
      _$StaffReportsEventCopyWithImpl<$Res, StaffReportsEvent>;
}

/// @nodoc
class _$StaffReportsEventCopyWithImpl<$Res, $Val extends StaffReportsEvent>
    implements $StaffReportsEventCopyWith<$Res> {
  _$StaffReportsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadReportImplCopyWith<$Res> {
  factory _$$LoadReportImplCopyWith(
          _$LoadReportImpl value, $Res Function(_$LoadReportImpl) then) =
      __$$LoadReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String eventId,
      String staffId,
      ReportTimePeriod timePeriod,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$$LoadReportImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$LoadReportImpl>
    implements _$$LoadReportImplCopyWith<$Res> {
  __$$LoadReportImplCopyWithImpl(
      _$LoadReportImpl _value, $Res Function(_$LoadReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
    Object? timePeriod = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$LoadReportImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      timePeriod: null == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as ReportTimePeriod,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LoadReportImpl implements _LoadReport {
  const _$LoadReportImpl(
      {required this.eventId,
      required this.staffId,
      required this.timePeriod,
      this.startDate,
      this.endDate});

  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final ReportTimePeriod timePeriod;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'StaffReportsEvent.loadReport(eventId: $eventId, staffId: $staffId, timePeriod: $timePeriod, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadReportImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.timePeriod, timePeriod) ||
                other.timePeriod == timePeriod) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, eventId, staffId, timePeriod, startDate, endDate);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadReportImplCopyWith<_$LoadReportImpl> get copyWith =>
      __$$LoadReportImplCopyWithImpl<_$LoadReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return loadReport(eventId, staffId, timePeriod, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return loadReport?.call(eventId, staffId, timePeriod, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadReport != null) {
      return loadReport(eventId, staffId, timePeriod, startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadReport != null) {
      return loadReport(this);
    }
    return orElse();
  }
}

abstract class _LoadReport implements StaffReportsEvent {
  const factory _LoadReport(
      {required final String eventId,
      required final String staffId,
      required final ReportTimePeriod timePeriod,
      final DateTime? startDate,
      final DateTime? endDate}) = _$LoadReportImpl;

  String get eventId;
  String get staffId;
  ReportTimePeriod get timePeriod;
  DateTime? get startDate;
  DateTime? get endDate;

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadReportImplCopyWith<_$LoadReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadCheckInAnalyticsImplCopyWith<$Res> {
  factory _$$LoadCheckInAnalyticsImplCopyWith(_$LoadCheckInAnalyticsImpl value,
          $Res Function(_$LoadCheckInAnalyticsImpl) then) =
      __$$LoadCheckInAnalyticsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$$LoadCheckInAnalyticsImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$LoadCheckInAnalyticsImpl>
    implements _$$LoadCheckInAnalyticsImplCopyWith<$Res> {
  __$$LoadCheckInAnalyticsImplCopyWithImpl(_$LoadCheckInAnalyticsImpl _value,
      $Res Function(_$LoadCheckInAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$LoadCheckInAnalyticsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LoadCheckInAnalyticsImpl implements _LoadCheckInAnalytics {
  const _$LoadCheckInAnalyticsImpl(
      {required this.eventId, required this.startDate, required this.endDate});

  @override
  final String eventId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'StaffReportsEvent.loadCheckInAnalytics(eventId: $eventId, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCheckInAnalyticsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, startDate, endDate);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCheckInAnalyticsImplCopyWith<_$LoadCheckInAnalyticsImpl>
      get copyWith =>
          __$$LoadCheckInAnalyticsImplCopyWithImpl<_$LoadCheckInAnalyticsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return loadCheckInAnalytics(eventId, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return loadCheckInAnalytics?.call(eventId, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadCheckInAnalytics != null) {
      return loadCheckInAnalytics(eventId, startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadCheckInAnalytics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadCheckInAnalytics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadCheckInAnalytics != null) {
      return loadCheckInAnalytics(this);
    }
    return orElse();
  }
}

abstract class _LoadCheckInAnalytics implements StaffReportsEvent {
  const factory _LoadCheckInAnalytics(
      {required final String eventId,
      required final DateTime startDate,
      required final DateTime endDate}) = _$LoadCheckInAnalyticsImpl;

  String get eventId;
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCheckInAnalyticsImplCopyWith<_$LoadCheckInAnalyticsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadStaffPerformanceImplCopyWith<$Res> {
  factory _$$LoadStaffPerformanceImplCopyWith(_$LoadStaffPerformanceImpl value,
          $Res Function(_$LoadStaffPerformanceImpl) then) =
      __$$LoadStaffPerformanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$$LoadStaffPerformanceImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$LoadStaffPerformanceImpl>
    implements _$$LoadStaffPerformanceImplCopyWith<$Res> {
  __$$LoadStaffPerformanceImplCopyWithImpl(_$LoadStaffPerformanceImpl _value,
      $Res Function(_$LoadStaffPerformanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$LoadStaffPerformanceImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LoadStaffPerformanceImpl implements _LoadStaffPerformance {
  const _$LoadStaffPerformanceImpl(
      {required this.eventId, required this.startDate, required this.endDate});

  @override
  final String eventId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'StaffReportsEvent.loadStaffPerformance(eventId: $eventId, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStaffPerformanceImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, startDate, endDate);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadStaffPerformanceImplCopyWith<_$LoadStaffPerformanceImpl>
      get copyWith =>
          __$$LoadStaffPerformanceImplCopyWithImpl<_$LoadStaffPerformanceImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return loadStaffPerformance(eventId, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return loadStaffPerformance?.call(eventId, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadStaffPerformance != null) {
      return loadStaffPerformance(eventId, startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadStaffPerformance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadStaffPerformance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadStaffPerformance != null) {
      return loadStaffPerformance(this);
    }
    return orElse();
  }
}

abstract class _LoadStaffPerformance implements StaffReportsEvent {
  const factory _LoadStaffPerformance(
      {required final String eventId,
      required final DateTime startDate,
      required final DateTime endDate}) = _$LoadStaffPerformanceImpl;

  String get eventId;
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadStaffPerformanceImplCopyWith<_$LoadStaffPerformanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadRealTimeMetricsImplCopyWith<$Res> {
  factory _$$LoadRealTimeMetricsImplCopyWith(_$LoadRealTimeMetricsImpl value,
          $Res Function(_$LoadRealTimeMetricsImpl) then) =
      __$$LoadRealTimeMetricsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String staffId});
}

/// @nodoc
class __$$LoadRealTimeMetricsImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$LoadRealTimeMetricsImpl>
    implements _$$LoadRealTimeMetricsImplCopyWith<$Res> {
  __$$LoadRealTimeMetricsImplCopyWithImpl(_$LoadRealTimeMetricsImpl _value,
      $Res Function(_$LoadRealTimeMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$LoadRealTimeMetricsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadRealTimeMetricsImpl implements _LoadRealTimeMetrics {
  const _$LoadRealTimeMetricsImpl(
      {required this.eventId, required this.staffId});

  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'StaffReportsEvent.loadRealTimeMetrics(eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadRealTimeMetricsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, staffId);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadRealTimeMetricsImplCopyWith<_$LoadRealTimeMetricsImpl> get copyWith =>
      __$$LoadRealTimeMetricsImplCopyWithImpl<_$LoadRealTimeMetricsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return loadRealTimeMetrics(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return loadRealTimeMetrics?.call(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadRealTimeMetrics != null) {
      return loadRealTimeMetrics(eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadRealTimeMetrics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadRealTimeMetrics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadRealTimeMetrics != null) {
      return loadRealTimeMetrics(this);
    }
    return orElse();
  }
}

abstract class _LoadRealTimeMetrics implements StaffReportsEvent {
  const factory _LoadRealTimeMetrics(
      {required final String eventId,
      required final String staffId}) = _$LoadRealTimeMetricsImpl;

  String get eventId;
  String get staffId;

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadRealTimeMetricsImplCopyWith<_$LoadRealTimeMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTimePeriodImplCopyWith<$Res> {
  factory _$$ChangeTimePeriodImplCopyWith(_$ChangeTimePeriodImpl value,
          $Res Function(_$ChangeTimePeriodImpl) then) =
      __$$ChangeTimePeriodImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class __$$ChangeTimePeriodImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$ChangeTimePeriodImpl>
    implements _$$ChangeTimePeriodImplCopyWith<$Res> {
  __$$ChangeTimePeriodImplCopyWithImpl(_$ChangeTimePeriodImpl _value,
      $Res Function(_$ChangeTimePeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timePeriod = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$ChangeTimePeriodImpl(
      timePeriod: null == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as ReportTimePeriod,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ChangeTimePeriodImpl implements _ChangeTimePeriod {
  const _$ChangeTimePeriodImpl(
      {required this.timePeriod, this.startDate, this.endDate});

  @override
  final ReportTimePeriod timePeriod;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'StaffReportsEvent.changeTimePeriod(timePeriod: $timePeriod, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTimePeriodImpl &&
            (identical(other.timePeriod, timePeriod) ||
                other.timePeriod == timePeriod) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timePeriod, startDate, endDate);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTimePeriodImplCopyWith<_$ChangeTimePeriodImpl> get copyWith =>
      __$$ChangeTimePeriodImplCopyWithImpl<_$ChangeTimePeriodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return changeTimePeriod(timePeriod, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return changeTimePeriod?.call(timePeriod, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (changeTimePeriod != null) {
      return changeTimePeriod(timePeriod, startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return changeTimePeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return changeTimePeriod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (changeTimePeriod != null) {
      return changeTimePeriod(this);
    }
    return orElse();
  }
}

abstract class _ChangeTimePeriod implements StaffReportsEvent {
  const factory _ChangeTimePeriod(
      {required final ReportTimePeriod timePeriod,
      final DateTime? startDate,
      final DateTime? endDate}) = _$ChangeTimePeriodImpl;

  ReportTimePeriod get timePeriod;
  DateTime? get startDate;
  DateTime? get endDate;

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeTimePeriodImplCopyWith<_$ChangeTimePeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshReportImplCopyWith<$Res> {
  factory _$$RefreshReportImplCopyWith(
          _$RefreshReportImpl value, $Res Function(_$RefreshReportImpl) then) =
      __$$RefreshReportImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshReportImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$RefreshReportImpl>
    implements _$$RefreshReportImplCopyWith<$Res> {
  __$$RefreshReportImplCopyWithImpl(
      _$RefreshReportImpl _value, $Res Function(_$RefreshReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshReportImpl implements _RefreshReport {
  const _$RefreshReportImpl();

  @override
  String toString() {
    return 'StaffReportsEvent.refreshReport()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshReportImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return refreshReport();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return refreshReport?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (refreshReport != null) {
      return refreshReport();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return refreshReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return refreshReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (refreshReport != null) {
      return refreshReport(this);
    }
    return orElse();
  }
}

abstract class _RefreshReport implements StaffReportsEvent {
  const factory _RefreshReport() = _$RefreshReportImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$StaffReportsEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'StaffReportsEvent.clearError()';
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
    required TResult Function(String eventId, String staffId,
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        loadReport,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadCheckInAnalytics,
    required TResult Function(
            String eventId, DateTime startDate, DateTime endDate)
        loadStaffPerformance,
    required TResult Function(String eventId, String staffId)
        loadRealTimeMetrics,
    required TResult Function(
            ReportTimePeriod timePeriod, DateTime? startDate, DateTime? endDate)
        changeTimePeriod,
    required TResult Function() refreshReport,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult? Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult? Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult? Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult? Function()? refreshReport,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            String staffId,
            ReportTimePeriod timePeriod,
            DateTime? startDate,
            DateTime? endDate)?
        loadReport,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadCheckInAnalytics,
    TResult Function(String eventId, DateTime startDate, DateTime endDate)?
        loadStaffPerformance,
    TResult Function(String eventId, String staffId)? loadRealTimeMetrics,
    TResult Function(ReportTimePeriod timePeriod, DateTime? startDate,
            DateTime? endDate)?
        changeTimePeriod,
    TResult Function()? refreshReport,
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
    required TResult Function(_LoadReport value) loadReport,
    required TResult Function(_LoadCheckInAnalytics value) loadCheckInAnalytics,
    required TResult Function(_LoadStaffPerformance value) loadStaffPerformance,
    required TResult Function(_LoadRealTimeMetrics value) loadRealTimeMetrics,
    required TResult Function(_ChangeTimePeriod value) changeTimePeriod,
    required TResult Function(_RefreshReport value) refreshReport,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReport value)? loadReport,
    TResult? Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult? Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult? Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult? Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult? Function(_RefreshReport value)? refreshReport,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReport value)? loadReport,
    TResult Function(_LoadCheckInAnalytics value)? loadCheckInAnalytics,
    TResult Function(_LoadStaffPerformance value)? loadStaffPerformance,
    TResult Function(_LoadRealTimeMetrics value)? loadRealTimeMetrics,
    TResult Function(_ChangeTimePeriod value)? changeTimePeriod,
    TResult Function(_RefreshReport value)? refreshReport,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements StaffReportsEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$StaffReportsState {
  StaffReportEntity? get report => throw _privateConstructorUsedError;
  StaffReportMetrics? get metrics => throw _privateConstructorUsedError;
  List<HourlyCheckInData> get hourlyData => throw _privateConstructorUsedError;
  List<StaffPerformanceData> get staffPerformance =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMetrics => throw _privateConstructorUsedError;
  bool get isLoadingAnalytics => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  ReportTimePeriod get selectedTimePeriod => throw _privateConstructorUsedError;
  String? get currentEventId => throw _privateConstructorUsedError;
  String? get currentStaffId => throw _privateConstructorUsedError;
  DateTime? get customStartDate => throw _privateConstructorUsedError;
  DateTime? get customEndDate => throw _privateConstructorUsedError;

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffReportsStateCopyWith<StaffReportsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffReportsStateCopyWith<$Res> {
  factory $StaffReportsStateCopyWith(
          StaffReportsState value, $Res Function(StaffReportsState) then) =
      _$StaffReportsStateCopyWithImpl<$Res, StaffReportsState>;
  @useResult
  $Res call(
      {StaffReportEntity? report,
      StaffReportMetrics? metrics,
      List<HourlyCheckInData> hourlyData,
      List<StaffPerformanceData> staffPerformance,
      bool isLoading,
      bool isLoadingMetrics,
      bool isLoadingAnalytics,
      bool hasError,
      String errorMessage,
      ReportTimePeriod selectedTimePeriod,
      String? currentEventId,
      String? currentStaffId,
      DateTime? customStartDate,
      DateTime? customEndDate});

  $StaffReportEntityCopyWith<$Res>? get report;
  $StaffReportMetricsCopyWith<$Res>? get metrics;
}

/// @nodoc
class _$StaffReportsStateCopyWithImpl<$Res, $Val extends StaffReportsState>
    implements $StaffReportsStateCopyWith<$Res> {
  _$StaffReportsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = freezed,
    Object? metrics = freezed,
    Object? hourlyData = null,
    Object? staffPerformance = null,
    Object? isLoading = null,
    Object? isLoadingMetrics = null,
    Object? isLoadingAnalytics = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedTimePeriod = null,
    Object? currentEventId = freezed,
    Object? currentStaffId = freezed,
    Object? customStartDate = freezed,
    Object? customEndDate = freezed,
  }) {
    return _then(_value.copyWith(
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as StaffReportEntity?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as StaffReportMetrics?,
      hourlyData: null == hourlyData
          ? _value.hourlyData
          : hourlyData // ignore: cast_nullable_to_non_nullable
              as List<HourlyCheckInData>,
      staffPerformance: null == staffPerformance
          ? _value.staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMetrics: null == isLoadingMetrics
          ? _value.isLoadingMetrics
          : isLoadingMetrics // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAnalytics: null == isLoadingAnalytics
          ? _value.isLoadingAnalytics
          : isLoadingAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimePeriod: null == selectedTimePeriod
          ? _value.selectedTimePeriod
          : selectedTimePeriod // ignore: cast_nullable_to_non_nullable
              as ReportTimePeriod,
      currentEventId: freezed == currentEventId
          ? _value.currentEventId
          : currentEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStaffId: freezed == currentStaffId
          ? _value.currentStaffId
          : currentStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      customStartDate: freezed == customStartDate
          ? _value.customStartDate
          : customStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customEndDate: freezed == customEndDate
          ? _value.customEndDate
          : customEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffReportEntityCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $StaffReportEntityCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value) as $Val);
    });
  }

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffReportMetricsCopyWith<$Res>? get metrics {
    if (_value.metrics == null) {
      return null;
    }

    return $StaffReportMetricsCopyWith<$Res>(_value.metrics!, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffReportsStateImplCopyWith<$Res>
    implements $StaffReportsStateCopyWith<$Res> {
  factory _$$StaffReportsStateImplCopyWith(_$StaffReportsStateImpl value,
          $Res Function(_$StaffReportsStateImpl) then) =
      __$$StaffReportsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StaffReportEntity? report,
      StaffReportMetrics? metrics,
      List<HourlyCheckInData> hourlyData,
      List<StaffPerformanceData> staffPerformance,
      bool isLoading,
      bool isLoadingMetrics,
      bool isLoadingAnalytics,
      bool hasError,
      String errorMessage,
      ReportTimePeriod selectedTimePeriod,
      String? currentEventId,
      String? currentStaffId,
      DateTime? customStartDate,
      DateTime? customEndDate});

  @override
  $StaffReportEntityCopyWith<$Res>? get report;
  @override
  $StaffReportMetricsCopyWith<$Res>? get metrics;
}

/// @nodoc
class __$$StaffReportsStateImplCopyWithImpl<$Res>
    extends _$StaffReportsStateCopyWithImpl<$Res, _$StaffReportsStateImpl>
    implements _$$StaffReportsStateImplCopyWith<$Res> {
  __$$StaffReportsStateImplCopyWithImpl(_$StaffReportsStateImpl _value,
      $Res Function(_$StaffReportsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = freezed,
    Object? metrics = freezed,
    Object? hourlyData = null,
    Object? staffPerformance = null,
    Object? isLoading = null,
    Object? isLoadingMetrics = null,
    Object? isLoadingAnalytics = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedTimePeriod = null,
    Object? currentEventId = freezed,
    Object? currentStaffId = freezed,
    Object? customStartDate = freezed,
    Object? customEndDate = freezed,
  }) {
    return _then(_$StaffReportsStateImpl(
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as StaffReportEntity?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as StaffReportMetrics?,
      hourlyData: null == hourlyData
          ? _value._hourlyData
          : hourlyData // ignore: cast_nullable_to_non_nullable
              as List<HourlyCheckInData>,
      staffPerformance: null == staffPerformance
          ? _value._staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMetrics: null == isLoadingMetrics
          ? _value.isLoadingMetrics
          : isLoadingMetrics // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAnalytics: null == isLoadingAnalytics
          ? _value.isLoadingAnalytics
          : isLoadingAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimePeriod: null == selectedTimePeriod
          ? _value.selectedTimePeriod
          : selectedTimePeriod // ignore: cast_nullable_to_non_nullable
              as ReportTimePeriod,
      currentEventId: freezed == currentEventId
          ? _value.currentEventId
          : currentEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStaffId: freezed == currentStaffId
          ? _value.currentStaffId
          : currentStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      customStartDate: freezed == customStartDate
          ? _value.customStartDate
          : customStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customEndDate: freezed == customEndDate
          ? _value.customEndDate
          : customEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$StaffReportsStateImpl implements _StaffReportsState {
  const _$StaffReportsStateImpl(
      {this.report,
      this.metrics,
      final List<HourlyCheckInData> hourlyData = const [],
      final List<StaffPerformanceData> staffPerformance = const [],
      this.isLoading = false,
      this.isLoadingMetrics = false,
      this.isLoadingAnalytics = false,
      this.hasError = false,
      this.errorMessage = '',
      this.selectedTimePeriod = ReportTimePeriod.today,
      this.currentEventId,
      this.currentStaffId,
      this.customStartDate,
      this.customEndDate})
      : _hourlyData = hourlyData,
        _staffPerformance = staffPerformance;

  @override
  final StaffReportEntity? report;
  @override
  final StaffReportMetrics? metrics;
  final List<HourlyCheckInData> _hourlyData;
  @override
  @JsonKey()
  List<HourlyCheckInData> get hourlyData {
    if (_hourlyData is EqualUnmodifiableListView) return _hourlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyData);
  }

  final List<StaffPerformanceData> _staffPerformance;
  @override
  @JsonKey()
  List<StaffPerformanceData> get staffPerformance {
    if (_staffPerformance is EqualUnmodifiableListView)
      return _staffPerformance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffPerformance);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMetrics;
  @override
  @JsonKey()
  final bool isLoadingAnalytics;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final ReportTimePeriod selectedTimePeriod;
  @override
  final String? currentEventId;
  @override
  final String? currentStaffId;
  @override
  final DateTime? customStartDate;
  @override
  final DateTime? customEndDate;

  @override
  String toString() {
    return 'StaffReportsState(report: $report, metrics: $metrics, hourlyData: $hourlyData, staffPerformance: $staffPerformance, isLoading: $isLoading, isLoadingMetrics: $isLoadingMetrics, isLoadingAnalytics: $isLoadingAnalytics, hasError: $hasError, errorMessage: $errorMessage, selectedTimePeriod: $selectedTimePeriod, currentEventId: $currentEventId, currentStaffId: $currentStaffId, customStartDate: $customStartDate, customEndDate: $customEndDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffReportsStateImpl &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality()
                .equals(other._hourlyData, _hourlyData) &&
            const DeepCollectionEquality()
                .equals(other._staffPerformance, _staffPerformance) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMetrics, isLoadingMetrics) ||
                other.isLoadingMetrics == isLoadingMetrics) &&
            (identical(other.isLoadingAnalytics, isLoadingAnalytics) ||
                other.isLoadingAnalytics == isLoadingAnalytics) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedTimePeriod, selectedTimePeriod) ||
                other.selectedTimePeriod == selectedTimePeriod) &&
            (identical(other.currentEventId, currentEventId) ||
                other.currentEventId == currentEventId) &&
            (identical(other.currentStaffId, currentStaffId) ||
                other.currentStaffId == currentStaffId) &&
            (identical(other.customStartDate, customStartDate) ||
                other.customStartDate == customStartDate) &&
            (identical(other.customEndDate, customEndDate) ||
                other.customEndDate == customEndDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      report,
      metrics,
      const DeepCollectionEquality().hash(_hourlyData),
      const DeepCollectionEquality().hash(_staffPerformance),
      isLoading,
      isLoadingMetrics,
      isLoadingAnalytics,
      hasError,
      errorMessage,
      selectedTimePeriod,
      currentEventId,
      currentStaffId,
      customStartDate,
      customEndDate);

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffReportsStateImplCopyWith<_$StaffReportsStateImpl> get copyWith =>
      __$$StaffReportsStateImplCopyWithImpl<_$StaffReportsStateImpl>(
          this, _$identity);
}

abstract class _StaffReportsState implements StaffReportsState {
  const factory _StaffReportsState(
      {final StaffReportEntity? report,
      final StaffReportMetrics? metrics,
      final List<HourlyCheckInData> hourlyData,
      final List<StaffPerformanceData> staffPerformance,
      final bool isLoading,
      final bool isLoadingMetrics,
      final bool isLoadingAnalytics,
      final bool hasError,
      final String errorMessage,
      final ReportTimePeriod selectedTimePeriod,
      final String? currentEventId,
      final String? currentStaffId,
      final DateTime? customStartDate,
      final DateTime? customEndDate}) = _$StaffReportsStateImpl;

  @override
  StaffReportEntity? get report;
  @override
  StaffReportMetrics? get metrics;
  @override
  List<HourlyCheckInData> get hourlyData;
  @override
  List<StaffPerformanceData> get staffPerformance;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMetrics;
  @override
  bool get isLoadingAnalytics;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  ReportTimePeriod get selectedTimePeriod;
  @override
  String? get currentEventId;
  @override
  String? get currentStaffId;
  @override
  DateTime? get customStartDate;
  @override
  DateTime? get customEndDate;

  /// Create a copy of StaffReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffReportsStateImplCopyWith<_$StaffReportsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
