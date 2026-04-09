// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_profile_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffStatistics {
  int get totalEventsWorked => throw _privateConstructorUsedError;
  int get totalCheckIns => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  int get totalHoursWorked => throw _privateConstructorUsedError;
  DateTime get lastActiveDate => throw _privateConstructorUsedError;
  List<String> get recentEvents => throw _privateConstructorUsedError;

  /// Create a copy of StaffStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffStatisticsCopyWith<StaffStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStatisticsCopyWith<$Res> {
  factory $StaffStatisticsCopyWith(
          StaffStatistics value, $Res Function(StaffStatistics) then) =
      _$StaffStatisticsCopyWithImpl<$Res, StaffStatistics>;
  @useResult
  $Res call(
      {int totalEventsWorked,
      int totalCheckIns,
      double averageRating,
      int totalHoursWorked,
      DateTime lastActiveDate,
      List<String> recentEvents});
}

/// @nodoc
class _$StaffStatisticsCopyWithImpl<$Res, $Val extends StaffStatistics>
    implements $StaffStatisticsCopyWith<$Res> {
  _$StaffStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEventsWorked = null,
    Object? totalCheckIns = null,
    Object? averageRating = null,
    Object? totalHoursWorked = null,
    Object? lastActiveDate = null,
    Object? recentEvents = null,
  }) {
    return _then(_value.copyWith(
      totalEventsWorked: null == totalEventsWorked
          ? _value.totalEventsWorked
          : totalEventsWorked // ignore: cast_nullable_to_non_nullable
              as int,
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalHoursWorked: null == totalHoursWorked
          ? _value.totalHoursWorked
          : totalHoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
      lastActiveDate: null == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recentEvents: null == recentEvents
          ? _value.recentEvents
          : recentEvents // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffStatisticsImplCopyWith<$Res>
    implements $StaffStatisticsCopyWith<$Res> {
  factory _$$StaffStatisticsImplCopyWith(_$StaffStatisticsImpl value,
          $Res Function(_$StaffStatisticsImpl) then) =
      __$$StaffStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalEventsWorked,
      int totalCheckIns,
      double averageRating,
      int totalHoursWorked,
      DateTime lastActiveDate,
      List<String> recentEvents});
}

/// @nodoc
class __$$StaffStatisticsImplCopyWithImpl<$Res>
    extends _$StaffStatisticsCopyWithImpl<$Res, _$StaffStatisticsImpl>
    implements _$$StaffStatisticsImplCopyWith<$Res> {
  __$$StaffStatisticsImplCopyWithImpl(
      _$StaffStatisticsImpl _value, $Res Function(_$StaffStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEventsWorked = null,
    Object? totalCheckIns = null,
    Object? averageRating = null,
    Object? totalHoursWorked = null,
    Object? lastActiveDate = null,
    Object? recentEvents = null,
  }) {
    return _then(_$StaffStatisticsImpl(
      totalEventsWorked: null == totalEventsWorked
          ? _value.totalEventsWorked
          : totalEventsWorked // ignore: cast_nullable_to_non_nullable
              as int,
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalHoursWorked: null == totalHoursWorked
          ? _value.totalHoursWorked
          : totalHoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
      lastActiveDate: null == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recentEvents: null == recentEvents
          ? _value._recentEvents
          : recentEvents // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$StaffStatisticsImpl implements _StaffStatistics {
  const _$StaffStatisticsImpl(
      {required this.totalEventsWorked,
      required this.totalCheckIns,
      required this.averageRating,
      required this.totalHoursWorked,
      required this.lastActiveDate,
      required final List<String> recentEvents})
      : _recentEvents = recentEvents;

  @override
  final int totalEventsWorked;
  @override
  final int totalCheckIns;
  @override
  final double averageRating;
  @override
  final int totalHoursWorked;
  @override
  final DateTime lastActiveDate;
  final List<String> _recentEvents;
  @override
  List<String> get recentEvents {
    if (_recentEvents is EqualUnmodifiableListView) return _recentEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentEvents);
  }

  @override
  String toString() {
    return 'StaffStatistics(totalEventsWorked: $totalEventsWorked, totalCheckIns: $totalCheckIns, averageRating: $averageRating, totalHoursWorked: $totalHoursWorked, lastActiveDate: $lastActiveDate, recentEvents: $recentEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffStatisticsImpl &&
            (identical(other.totalEventsWorked, totalEventsWorked) ||
                other.totalEventsWorked == totalEventsWorked) &&
            (identical(other.totalCheckIns, totalCheckIns) ||
                other.totalCheckIns == totalCheckIns) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalHoursWorked, totalHoursWorked) ||
                other.totalHoursWorked == totalHoursWorked) &&
            (identical(other.lastActiveDate, lastActiveDate) ||
                other.lastActiveDate == lastActiveDate) &&
            const DeepCollectionEquality()
                .equals(other._recentEvents, _recentEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalEventsWorked,
      totalCheckIns,
      averageRating,
      totalHoursWorked,
      lastActiveDate,
      const DeepCollectionEquality().hash(_recentEvents));

  /// Create a copy of StaffStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffStatisticsImplCopyWith<_$StaffStatisticsImpl> get copyWith =>
      __$$StaffStatisticsImplCopyWithImpl<_$StaffStatisticsImpl>(
          this, _$identity);
}

abstract class _StaffStatistics implements StaffStatistics {
  const factory _StaffStatistics(
      {required final int totalEventsWorked,
      required final int totalCheckIns,
      required final double averageRating,
      required final int totalHoursWorked,
      required final DateTime lastActiveDate,
      required final List<String> recentEvents}) = _$StaffStatisticsImpl;

  @override
  int get totalEventsWorked;
  @override
  int get totalCheckIns;
  @override
  double get averageRating;
  @override
  int get totalHoursWorked;
  @override
  DateTime get lastActiveDate;
  @override
  List<String> get recentEvents;

  /// Create a copy of StaffStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffStatisticsImplCopyWith<_$StaffStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
