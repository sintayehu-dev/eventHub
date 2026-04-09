// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffReportEntity {
  String get eventId => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  DateTime get reportDate => throw _privateConstructorUsedError;
  StaffReportMetrics get metrics => throw _privateConstructorUsedError;
  List<HourlyCheckInData> get hourlyData => throw _privateConstructorUsedError;
  List<StaffPerformanceData> get staffPerformance =>
      throw _privateConstructorUsedError;

  /// Create a copy of StaffReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffReportEntityCopyWith<StaffReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffReportEntityCopyWith<$Res> {
  factory $StaffReportEntityCopyWith(
          StaffReportEntity value, $Res Function(StaffReportEntity) then) =
      _$StaffReportEntityCopyWithImpl<$Res, StaffReportEntity>;
  @useResult
  $Res call(
      {String eventId,
      String eventTitle,
      DateTime reportDate,
      StaffReportMetrics metrics,
      List<HourlyCheckInData> hourlyData,
      List<StaffPerformanceData> staffPerformance});

  $StaffReportMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$StaffReportEntityCopyWithImpl<$Res, $Val extends StaffReportEntity>
    implements $StaffReportEntityCopyWith<$Res> {
  _$StaffReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventTitle = null,
    Object? reportDate = null,
    Object? metrics = null,
    Object? hourlyData = null,
    Object? staffPerformance = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as StaffReportMetrics,
      hourlyData: null == hourlyData
          ? _value.hourlyData
          : hourlyData // ignore: cast_nullable_to_non_nullable
              as List<HourlyCheckInData>,
      staffPerformance: null == staffPerformance
          ? _value.staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceData>,
    ) as $Val);
  }

  /// Create a copy of StaffReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffReportMetricsCopyWith<$Res> get metrics {
    return $StaffReportMetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffReportEntityImplCopyWith<$Res>
    implements $StaffReportEntityCopyWith<$Res> {
  factory _$$StaffReportEntityImplCopyWith(_$StaffReportEntityImpl value,
          $Res Function(_$StaffReportEntityImpl) then) =
      __$$StaffReportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String eventTitle,
      DateTime reportDate,
      StaffReportMetrics metrics,
      List<HourlyCheckInData> hourlyData,
      List<StaffPerformanceData> staffPerformance});

  @override
  $StaffReportMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$StaffReportEntityImplCopyWithImpl<$Res>
    extends _$StaffReportEntityCopyWithImpl<$Res, _$StaffReportEntityImpl>
    implements _$$StaffReportEntityImplCopyWith<$Res> {
  __$$StaffReportEntityImplCopyWithImpl(_$StaffReportEntityImpl _value,
      $Res Function(_$StaffReportEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventTitle = null,
    Object? reportDate = null,
    Object? metrics = null,
    Object? hourlyData = null,
    Object? staffPerformance = null,
  }) {
    return _then(_$StaffReportEntityImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as StaffReportMetrics,
      hourlyData: null == hourlyData
          ? _value._hourlyData
          : hourlyData // ignore: cast_nullable_to_non_nullable
              as List<HourlyCheckInData>,
      staffPerformance: null == staffPerformance
          ? _value._staffPerformance
          : staffPerformance // ignore: cast_nullable_to_non_nullable
              as List<StaffPerformanceData>,
    ));
  }
}

/// @nodoc

class _$StaffReportEntityImpl implements _StaffReportEntity {
  const _$StaffReportEntityImpl(
      {required this.eventId,
      required this.eventTitle,
      required this.reportDate,
      required this.metrics,
      required final List<HourlyCheckInData> hourlyData,
      required final List<StaffPerformanceData> staffPerformance})
      : _hourlyData = hourlyData,
        _staffPerformance = staffPerformance;

  @override
  final String eventId;
  @override
  final String eventTitle;
  @override
  final DateTime reportDate;
  @override
  final StaffReportMetrics metrics;
  final List<HourlyCheckInData> _hourlyData;
  @override
  List<HourlyCheckInData> get hourlyData {
    if (_hourlyData is EqualUnmodifiableListView) return _hourlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyData);
  }

  final List<StaffPerformanceData> _staffPerformance;
  @override
  List<StaffPerformanceData> get staffPerformance {
    if (_staffPerformance is EqualUnmodifiableListView)
      return _staffPerformance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffPerformance);
  }

  @override
  String toString() {
    return 'StaffReportEntity(eventId: $eventId, eventTitle: $eventTitle, reportDate: $reportDate, metrics: $metrics, hourlyData: $hourlyData, staffPerformance: $staffPerformance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffReportEntityImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.reportDate, reportDate) ||
                other.reportDate == reportDate) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality()
                .equals(other._hourlyData, _hourlyData) &&
            const DeepCollectionEquality()
                .equals(other._staffPerformance, _staffPerformance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      eventTitle,
      reportDate,
      metrics,
      const DeepCollectionEquality().hash(_hourlyData),
      const DeepCollectionEquality().hash(_staffPerformance));

  /// Create a copy of StaffReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffReportEntityImplCopyWith<_$StaffReportEntityImpl> get copyWith =>
      __$$StaffReportEntityImplCopyWithImpl<_$StaffReportEntityImpl>(
          this, _$identity);
}

abstract class _StaffReportEntity implements StaffReportEntity {
  const factory _StaffReportEntity(
          {required final String eventId,
          required final String eventTitle,
          required final DateTime reportDate,
          required final StaffReportMetrics metrics,
          required final List<HourlyCheckInData> hourlyData,
          required final List<StaffPerformanceData> staffPerformance}) =
      _$StaffReportEntityImpl;

  @override
  String get eventId;
  @override
  String get eventTitle;
  @override
  DateTime get reportDate;
  @override
  StaffReportMetrics get metrics;
  @override
  List<HourlyCheckInData> get hourlyData;
  @override
  List<StaffPerformanceData> get staffPerformance;

  /// Create a copy of StaffReportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffReportEntityImplCopyWith<_$StaffReportEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StaffReportMetrics {
  int get totalCheckIns => throw _privateConstructorUsedError;
  int get todayCheckIns => throw _privateConstructorUsedError;
  double get averageWaitTime => throw _privateConstructorUsedError;
  String get peakHour => throw _privateConstructorUsedError;
  int get peakHourCheckIns => throw _privateConstructorUsedError;
  int get issuesResolved => throw _privateConstructorUsedError;
  int get pendingIssues => throw _privateConstructorUsedError;
  int get totalAttendees => throw _privateConstructorUsedError;
  int get checkedInAttendees => throw _privateConstructorUsedError;
  double get checkInRate => throw _privateConstructorUsedError;

  /// Create a copy of StaffReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffReportMetricsCopyWith<StaffReportMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffReportMetricsCopyWith<$Res> {
  factory $StaffReportMetricsCopyWith(
          StaffReportMetrics value, $Res Function(StaffReportMetrics) then) =
      _$StaffReportMetricsCopyWithImpl<$Res, StaffReportMetrics>;
  @useResult
  $Res call(
      {int totalCheckIns,
      int todayCheckIns,
      double averageWaitTime,
      String peakHour,
      int peakHourCheckIns,
      int issuesResolved,
      int pendingIssues,
      int totalAttendees,
      int checkedInAttendees,
      double checkInRate});
}

/// @nodoc
class _$StaffReportMetricsCopyWithImpl<$Res, $Val extends StaffReportMetrics>
    implements $StaffReportMetricsCopyWith<$Res> {
  _$StaffReportMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCheckIns = null,
    Object? todayCheckIns = null,
    Object? averageWaitTime = null,
    Object? peakHour = null,
    Object? peakHourCheckIns = null,
    Object? issuesResolved = null,
    Object? pendingIssues = null,
    Object? totalAttendees = null,
    Object? checkedInAttendees = null,
    Object? checkInRate = null,
  }) {
    return _then(_value.copyWith(
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      todayCheckIns: null == todayCheckIns
          ? _value.todayCheckIns
          : todayCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageWaitTime: null == averageWaitTime
          ? _value.averageWaitTime
          : averageWaitTime // ignore: cast_nullable_to_non_nullable
              as double,
      peakHour: null == peakHour
          ? _value.peakHour
          : peakHour // ignore: cast_nullable_to_non_nullable
              as String,
      peakHourCheckIns: null == peakHourCheckIns
          ? _value.peakHourCheckIns
          : peakHourCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      issuesResolved: null == issuesResolved
          ? _value.issuesResolved
          : issuesResolved // ignore: cast_nullable_to_non_nullable
              as int,
      pendingIssues: null == pendingIssues
          ? _value.pendingIssues
          : pendingIssues // ignore: cast_nullable_to_non_nullable
              as int,
      totalAttendees: null == totalAttendees
          ? _value.totalAttendees
          : totalAttendees // ignore: cast_nullable_to_non_nullable
              as int,
      checkedInAttendees: null == checkedInAttendees
          ? _value.checkedInAttendees
          : checkedInAttendees // ignore: cast_nullable_to_non_nullable
              as int,
      checkInRate: null == checkInRate
          ? _value.checkInRate
          : checkInRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffReportMetricsImplCopyWith<$Res>
    implements $StaffReportMetricsCopyWith<$Res> {
  factory _$$StaffReportMetricsImplCopyWith(_$StaffReportMetricsImpl value,
          $Res Function(_$StaffReportMetricsImpl) then) =
      __$$StaffReportMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCheckIns,
      int todayCheckIns,
      double averageWaitTime,
      String peakHour,
      int peakHourCheckIns,
      int issuesResolved,
      int pendingIssues,
      int totalAttendees,
      int checkedInAttendees,
      double checkInRate});
}

/// @nodoc
class __$$StaffReportMetricsImplCopyWithImpl<$Res>
    extends _$StaffReportMetricsCopyWithImpl<$Res, _$StaffReportMetricsImpl>
    implements _$$StaffReportMetricsImplCopyWith<$Res> {
  __$$StaffReportMetricsImplCopyWithImpl(_$StaffReportMetricsImpl _value,
      $Res Function(_$StaffReportMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCheckIns = null,
    Object? todayCheckIns = null,
    Object? averageWaitTime = null,
    Object? peakHour = null,
    Object? peakHourCheckIns = null,
    Object? issuesResolved = null,
    Object? pendingIssues = null,
    Object? totalAttendees = null,
    Object? checkedInAttendees = null,
    Object? checkInRate = null,
  }) {
    return _then(_$StaffReportMetricsImpl(
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      todayCheckIns: null == todayCheckIns
          ? _value.todayCheckIns
          : todayCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageWaitTime: null == averageWaitTime
          ? _value.averageWaitTime
          : averageWaitTime // ignore: cast_nullable_to_non_nullable
              as double,
      peakHour: null == peakHour
          ? _value.peakHour
          : peakHour // ignore: cast_nullable_to_non_nullable
              as String,
      peakHourCheckIns: null == peakHourCheckIns
          ? _value.peakHourCheckIns
          : peakHourCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      issuesResolved: null == issuesResolved
          ? _value.issuesResolved
          : issuesResolved // ignore: cast_nullable_to_non_nullable
              as int,
      pendingIssues: null == pendingIssues
          ? _value.pendingIssues
          : pendingIssues // ignore: cast_nullable_to_non_nullable
              as int,
      totalAttendees: null == totalAttendees
          ? _value.totalAttendees
          : totalAttendees // ignore: cast_nullable_to_non_nullable
              as int,
      checkedInAttendees: null == checkedInAttendees
          ? _value.checkedInAttendees
          : checkedInAttendees // ignore: cast_nullable_to_non_nullable
              as int,
      checkInRate: null == checkInRate
          ? _value.checkInRate
          : checkInRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StaffReportMetricsImpl implements _StaffReportMetrics {
  const _$StaffReportMetricsImpl(
      {required this.totalCheckIns,
      required this.todayCheckIns,
      required this.averageWaitTime,
      required this.peakHour,
      required this.peakHourCheckIns,
      required this.issuesResolved,
      required this.pendingIssues,
      required this.totalAttendees,
      required this.checkedInAttendees,
      required this.checkInRate});

  @override
  final int totalCheckIns;
  @override
  final int todayCheckIns;
  @override
  final double averageWaitTime;
  @override
  final String peakHour;
  @override
  final int peakHourCheckIns;
  @override
  final int issuesResolved;
  @override
  final int pendingIssues;
  @override
  final int totalAttendees;
  @override
  final int checkedInAttendees;
  @override
  final double checkInRate;

  @override
  String toString() {
    return 'StaffReportMetrics(totalCheckIns: $totalCheckIns, todayCheckIns: $todayCheckIns, averageWaitTime: $averageWaitTime, peakHour: $peakHour, peakHourCheckIns: $peakHourCheckIns, issuesResolved: $issuesResolved, pendingIssues: $pendingIssues, totalAttendees: $totalAttendees, checkedInAttendees: $checkedInAttendees, checkInRate: $checkInRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffReportMetricsImpl &&
            (identical(other.totalCheckIns, totalCheckIns) ||
                other.totalCheckIns == totalCheckIns) &&
            (identical(other.todayCheckIns, todayCheckIns) ||
                other.todayCheckIns == todayCheckIns) &&
            (identical(other.averageWaitTime, averageWaitTime) ||
                other.averageWaitTime == averageWaitTime) &&
            (identical(other.peakHour, peakHour) ||
                other.peakHour == peakHour) &&
            (identical(other.peakHourCheckIns, peakHourCheckIns) ||
                other.peakHourCheckIns == peakHourCheckIns) &&
            (identical(other.issuesResolved, issuesResolved) ||
                other.issuesResolved == issuesResolved) &&
            (identical(other.pendingIssues, pendingIssues) ||
                other.pendingIssues == pendingIssues) &&
            (identical(other.totalAttendees, totalAttendees) ||
                other.totalAttendees == totalAttendees) &&
            (identical(other.checkedInAttendees, checkedInAttendees) ||
                other.checkedInAttendees == checkedInAttendees) &&
            (identical(other.checkInRate, checkInRate) ||
                other.checkInRate == checkInRate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCheckIns,
      todayCheckIns,
      averageWaitTime,
      peakHour,
      peakHourCheckIns,
      issuesResolved,
      pendingIssues,
      totalAttendees,
      checkedInAttendees,
      checkInRate);

  /// Create a copy of StaffReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffReportMetricsImplCopyWith<_$StaffReportMetricsImpl> get copyWith =>
      __$$StaffReportMetricsImplCopyWithImpl<_$StaffReportMetricsImpl>(
          this, _$identity);
}

abstract class _StaffReportMetrics implements StaffReportMetrics {
  const factory _StaffReportMetrics(
      {required final int totalCheckIns,
      required final int todayCheckIns,
      required final double averageWaitTime,
      required final String peakHour,
      required final int peakHourCheckIns,
      required final int issuesResolved,
      required final int pendingIssues,
      required final int totalAttendees,
      required final int checkedInAttendees,
      required final double checkInRate}) = _$StaffReportMetricsImpl;

  @override
  int get totalCheckIns;
  @override
  int get todayCheckIns;
  @override
  double get averageWaitTime;
  @override
  String get peakHour;
  @override
  int get peakHourCheckIns;
  @override
  int get issuesResolved;
  @override
  int get pendingIssues;
  @override
  int get totalAttendees;
  @override
  int get checkedInAttendees;
  @override
  double get checkInRate;

  /// Create a copy of StaffReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffReportMetricsImplCopyWith<_$StaffReportMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HourlyCheckInData {
  int get hour => throw _privateConstructorUsedError;
  int get checkIns => throw _privateConstructorUsedError;
  double get averageWaitTime => throw _privateConstructorUsedError;

  /// Create a copy of HourlyCheckInData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyCheckInDataCopyWith<HourlyCheckInData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyCheckInDataCopyWith<$Res> {
  factory $HourlyCheckInDataCopyWith(
          HourlyCheckInData value, $Res Function(HourlyCheckInData) then) =
      _$HourlyCheckInDataCopyWithImpl<$Res, HourlyCheckInData>;
  @useResult
  $Res call({int hour, int checkIns, double averageWaitTime});
}

/// @nodoc
class _$HourlyCheckInDataCopyWithImpl<$Res, $Val extends HourlyCheckInData>
    implements $HourlyCheckInDataCopyWith<$Res> {
  _$HourlyCheckInDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyCheckInData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? checkIns = null,
    Object? averageWaitTime = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      checkIns: null == checkIns
          ? _value.checkIns
          : checkIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageWaitTime: null == averageWaitTime
          ? _value.averageWaitTime
          : averageWaitTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyCheckInDataImplCopyWith<$Res>
    implements $HourlyCheckInDataCopyWith<$Res> {
  factory _$$HourlyCheckInDataImplCopyWith(_$HourlyCheckInDataImpl value,
          $Res Function(_$HourlyCheckInDataImpl) then) =
      __$$HourlyCheckInDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int checkIns, double averageWaitTime});
}

/// @nodoc
class __$$HourlyCheckInDataImplCopyWithImpl<$Res>
    extends _$HourlyCheckInDataCopyWithImpl<$Res, _$HourlyCheckInDataImpl>
    implements _$$HourlyCheckInDataImplCopyWith<$Res> {
  __$$HourlyCheckInDataImplCopyWithImpl(_$HourlyCheckInDataImpl _value,
      $Res Function(_$HourlyCheckInDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourlyCheckInData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? checkIns = null,
    Object? averageWaitTime = null,
  }) {
    return _then(_$HourlyCheckInDataImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      checkIns: null == checkIns
          ? _value.checkIns
          : checkIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageWaitTime: null == averageWaitTime
          ? _value.averageWaitTime
          : averageWaitTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$HourlyCheckInDataImpl implements _HourlyCheckInData {
  const _$HourlyCheckInDataImpl(
      {required this.hour,
      required this.checkIns,
      required this.averageWaitTime});

  @override
  final int hour;
  @override
  final int checkIns;
  @override
  final double averageWaitTime;

  @override
  String toString() {
    return 'HourlyCheckInData(hour: $hour, checkIns: $checkIns, averageWaitTime: $averageWaitTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyCheckInDataImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.checkIns, checkIns) ||
                other.checkIns == checkIns) &&
            (identical(other.averageWaitTime, averageWaitTime) ||
                other.averageWaitTime == averageWaitTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hour, checkIns, averageWaitTime);

  /// Create a copy of HourlyCheckInData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyCheckInDataImplCopyWith<_$HourlyCheckInDataImpl> get copyWith =>
      __$$HourlyCheckInDataImplCopyWithImpl<_$HourlyCheckInDataImpl>(
          this, _$identity);
}

abstract class _HourlyCheckInData implements HourlyCheckInData {
  const factory _HourlyCheckInData(
      {required final int hour,
      required final int checkIns,
      required final double averageWaitTime}) = _$HourlyCheckInDataImpl;

  @override
  int get hour;
  @override
  int get checkIns;
  @override
  double get averageWaitTime;

  /// Create a copy of HourlyCheckInData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyCheckInDataImplCopyWith<_$HourlyCheckInDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StaffPerformanceData {
  String get staffId => throw _privateConstructorUsedError;
  String get staffName => throw _privateConstructorUsedError;
  int get checkIns => throw _privateConstructorUsedError;
  double get averageWaitTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get lastActivity => throw _privateConstructorUsedError;

  /// Create a copy of StaffPerformanceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffPerformanceDataCopyWith<StaffPerformanceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffPerformanceDataCopyWith<$Res> {
  factory $StaffPerformanceDataCopyWith(StaffPerformanceData value,
          $Res Function(StaffPerformanceData) then) =
      _$StaffPerformanceDataCopyWithImpl<$Res, StaffPerformanceData>;
  @useResult
  $Res call(
      {String staffId,
      String staffName,
      int checkIns,
      double averageWaitTime,
      String status,
      DateTime lastActivity});
}

/// @nodoc
class _$StaffPerformanceDataCopyWithImpl<$Res,
        $Val extends StaffPerformanceData>
    implements $StaffPerformanceDataCopyWith<$Res> {
  _$StaffPerformanceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffPerformanceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? staffName = null,
    Object? checkIns = null,
    Object? averageWaitTime = null,
    Object? status = null,
    Object? lastActivity = null,
  }) {
    return _then(_value.copyWith(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      checkIns: null == checkIns
          ? _value.checkIns
          : checkIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageWaitTime: null == averageWaitTime
          ? _value.averageWaitTime
          : averageWaitTime // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffPerformanceDataImplCopyWith<$Res>
    implements $StaffPerformanceDataCopyWith<$Res> {
  factory _$$StaffPerformanceDataImplCopyWith(_$StaffPerformanceDataImpl value,
          $Res Function(_$StaffPerformanceDataImpl) then) =
      __$$StaffPerformanceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String staffId,
      String staffName,
      int checkIns,
      double averageWaitTime,
      String status,
      DateTime lastActivity});
}

/// @nodoc
class __$$StaffPerformanceDataImplCopyWithImpl<$Res>
    extends _$StaffPerformanceDataCopyWithImpl<$Res, _$StaffPerformanceDataImpl>
    implements _$$StaffPerformanceDataImplCopyWith<$Res> {
  __$$StaffPerformanceDataImplCopyWithImpl(_$StaffPerformanceDataImpl _value,
      $Res Function(_$StaffPerformanceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffPerformanceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? staffName = null,
    Object? checkIns = null,
    Object? averageWaitTime = null,
    Object? status = null,
    Object? lastActivity = null,
  }) {
    return _then(_$StaffPerformanceDataImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      checkIns: null == checkIns
          ? _value.checkIns
          : checkIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageWaitTime: null == averageWaitTime
          ? _value.averageWaitTime
          : averageWaitTime // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$StaffPerformanceDataImpl implements _StaffPerformanceData {
  const _$StaffPerformanceDataImpl(
      {required this.staffId,
      required this.staffName,
      required this.checkIns,
      required this.averageWaitTime,
      required this.status,
      required this.lastActivity});

  @override
  final String staffId;
  @override
  final String staffName;
  @override
  final int checkIns;
  @override
  final double averageWaitTime;
  @override
  final String status;
  @override
  final DateTime lastActivity;

  @override
  String toString() {
    return 'StaffPerformanceData(staffId: $staffId, staffName: $staffName, checkIns: $checkIns, averageWaitTime: $averageWaitTime, status: $status, lastActivity: $lastActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffPerformanceDataImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.checkIns, checkIns) ||
                other.checkIns == checkIns) &&
            (identical(other.averageWaitTime, averageWaitTime) ||
                other.averageWaitTime == averageWaitTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, staffName, checkIns,
      averageWaitTime, status, lastActivity);

  /// Create a copy of StaffPerformanceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffPerformanceDataImplCopyWith<_$StaffPerformanceDataImpl>
      get copyWith =>
          __$$StaffPerformanceDataImplCopyWithImpl<_$StaffPerformanceDataImpl>(
              this, _$identity);
}

abstract class _StaffPerformanceData implements StaffPerformanceData {
  const factory _StaffPerformanceData(
      {required final String staffId,
      required final String staffName,
      required final int checkIns,
      required final double averageWaitTime,
      required final String status,
      required final DateTime lastActivity}) = _$StaffPerformanceDataImpl;

  @override
  String get staffId;
  @override
  String get staffName;
  @override
  int get checkIns;
  @override
  double get averageWaitTime;
  @override
  String get status;
  @override
  DateTime get lastActivity;

  /// Create a copy of StaffPerformanceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffPerformanceDataImplCopyWith<_$StaffPerformanceDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
