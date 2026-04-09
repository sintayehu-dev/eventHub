// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_statistics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventStatistics _$EventStatisticsFromJson(Map<String, dynamic> json) {
  return _EventStatistics.fromJson(json);
}

/// @nodoc
mixin _$EventStatistics {
  String get eventId => throw _privateConstructorUsedError;
  int get totalTickets => throw _privateConstructorUsedError;
  int get soldTickets => throw _privateConstructorUsedError;
  int get availableTickets => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get targetRevenue => throw _privateConstructorUsedError;
  int get checkedInCount => throw _privateConstructorUsedError;
  double get conversionRate => throw _privateConstructorUsedError;
  Map<String, int> get ticketTypesSold => throw _privateConstructorUsedError;
  Map<String, double> get revenueByTicketType =>
      throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this EventStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventStatisticsCopyWith<EventStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStatisticsCopyWith<$Res> {
  factory $EventStatisticsCopyWith(
          EventStatistics value, $Res Function(EventStatistics) then) =
      _$EventStatisticsCopyWithImpl<$Res, EventStatistics>;
  @useResult
  $Res call(
      {String eventId,
      int totalTickets,
      int soldTickets,
      int availableTickets,
      double totalRevenue,
      double targetRevenue,
      int checkedInCount,
      double conversionRate,
      Map<String, int> ticketTypesSold,
      Map<String, double> revenueByTicketType,
      DateTime lastUpdated});
}

/// @nodoc
class _$EventStatisticsCopyWithImpl<$Res, $Val extends EventStatistics>
    implements $EventStatisticsCopyWith<$Res> {
  _$EventStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? totalTickets = null,
    Object? soldTickets = null,
    Object? availableTickets = null,
    Object? totalRevenue = null,
    Object? targetRevenue = null,
    Object? checkedInCount = null,
    Object? conversionRate = null,
    Object? ticketTypesSold = null,
    Object? revenueByTicketType = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      soldTickets: null == soldTickets
          ? _value.soldTickets
          : soldTickets // ignore: cast_nullable_to_non_nullable
              as int,
      availableTickets: null == availableTickets
          ? _value.availableTickets
          : availableTickets // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      targetRevenue: null == targetRevenue
          ? _value.targetRevenue
          : targetRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      checkedInCount: null == checkedInCount
          ? _value.checkedInCount
          : checkedInCount // ignore: cast_nullable_to_non_nullable
              as int,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      ticketTypesSold: null == ticketTypesSold
          ? _value.ticketTypesSold
          : ticketTypesSold // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      revenueByTicketType: null == revenueByTicketType
          ? _value.revenueByTicketType
          : revenueByTicketType // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventStatisticsImplCopyWith<$Res>
    implements $EventStatisticsCopyWith<$Res> {
  factory _$$EventStatisticsImplCopyWith(_$EventStatisticsImpl value,
          $Res Function(_$EventStatisticsImpl) then) =
      __$$EventStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      int totalTickets,
      int soldTickets,
      int availableTickets,
      double totalRevenue,
      double targetRevenue,
      int checkedInCount,
      double conversionRate,
      Map<String, int> ticketTypesSold,
      Map<String, double> revenueByTicketType,
      DateTime lastUpdated});
}

/// @nodoc
class __$$EventStatisticsImplCopyWithImpl<$Res>
    extends _$EventStatisticsCopyWithImpl<$Res, _$EventStatisticsImpl>
    implements _$$EventStatisticsImplCopyWith<$Res> {
  __$$EventStatisticsImplCopyWithImpl(
      _$EventStatisticsImpl _value, $Res Function(_$EventStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? totalTickets = null,
    Object? soldTickets = null,
    Object? availableTickets = null,
    Object? totalRevenue = null,
    Object? targetRevenue = null,
    Object? checkedInCount = null,
    Object? conversionRate = null,
    Object? ticketTypesSold = null,
    Object? revenueByTicketType = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$EventStatisticsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      soldTickets: null == soldTickets
          ? _value.soldTickets
          : soldTickets // ignore: cast_nullable_to_non_nullable
              as int,
      availableTickets: null == availableTickets
          ? _value.availableTickets
          : availableTickets // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      targetRevenue: null == targetRevenue
          ? _value.targetRevenue
          : targetRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      checkedInCount: null == checkedInCount
          ? _value.checkedInCount
          : checkedInCount // ignore: cast_nullable_to_non_nullable
              as int,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      ticketTypesSold: null == ticketTypesSold
          ? _value._ticketTypesSold
          : ticketTypesSold // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      revenueByTicketType: null == revenueByTicketType
          ? _value._revenueByTicketType
          : revenueByTicketType // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventStatisticsImpl implements _EventStatistics {
  const _$EventStatisticsImpl(
      {required this.eventId,
      required this.totalTickets,
      required this.soldTickets,
      required this.availableTickets,
      required this.totalRevenue,
      required this.targetRevenue,
      required this.checkedInCount,
      required this.conversionRate,
      required final Map<String, int> ticketTypesSold,
      required final Map<String, double> revenueByTicketType,
      required this.lastUpdated})
      : _ticketTypesSold = ticketTypesSold,
        _revenueByTicketType = revenueByTicketType;

  factory _$EventStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventStatisticsImplFromJson(json);

  @override
  final String eventId;
  @override
  final int totalTickets;
  @override
  final int soldTickets;
  @override
  final int availableTickets;
  @override
  final double totalRevenue;
  @override
  final double targetRevenue;
  @override
  final int checkedInCount;
  @override
  final double conversionRate;
  final Map<String, int> _ticketTypesSold;
  @override
  Map<String, int> get ticketTypesSold {
    if (_ticketTypesSold is EqualUnmodifiableMapView) return _ticketTypesSold;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ticketTypesSold);
  }

  final Map<String, double> _revenueByTicketType;
  @override
  Map<String, double> get revenueByTicketType {
    if (_revenueByTicketType is EqualUnmodifiableMapView)
      return _revenueByTicketType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_revenueByTicketType);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'EventStatistics(eventId: $eventId, totalTickets: $totalTickets, soldTickets: $soldTickets, availableTickets: $availableTickets, totalRevenue: $totalRevenue, targetRevenue: $targetRevenue, checkedInCount: $checkedInCount, conversionRate: $conversionRate, ticketTypesSold: $ticketTypesSold, revenueByTicketType: $revenueByTicketType, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventStatisticsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.totalTickets, totalTickets) ||
                other.totalTickets == totalTickets) &&
            (identical(other.soldTickets, soldTickets) ||
                other.soldTickets == soldTickets) &&
            (identical(other.availableTickets, availableTickets) ||
                other.availableTickets == availableTickets) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.targetRevenue, targetRevenue) ||
                other.targetRevenue == targetRevenue) &&
            (identical(other.checkedInCount, checkedInCount) ||
                other.checkedInCount == checkedInCount) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypesSold, _ticketTypesSold) &&
            const DeepCollectionEquality()
                .equals(other._revenueByTicketType, _revenueByTicketType) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      totalTickets,
      soldTickets,
      availableTickets,
      totalRevenue,
      targetRevenue,
      checkedInCount,
      conversionRate,
      const DeepCollectionEquality().hash(_ticketTypesSold),
      const DeepCollectionEquality().hash(_revenueByTicketType),
      lastUpdated);

  /// Create a copy of EventStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventStatisticsImplCopyWith<_$EventStatisticsImpl> get copyWith =>
      __$$EventStatisticsImplCopyWithImpl<_$EventStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventStatisticsImplToJson(
      this,
    );
  }
}

abstract class _EventStatistics implements EventStatistics {
  const factory _EventStatistics(
      {required final String eventId,
      required final int totalTickets,
      required final int soldTickets,
      required final int availableTickets,
      required final double totalRevenue,
      required final double targetRevenue,
      required final int checkedInCount,
      required final double conversionRate,
      required final Map<String, int> ticketTypesSold,
      required final Map<String, double> revenueByTicketType,
      required final DateTime lastUpdated}) = _$EventStatisticsImpl;

  factory _EventStatistics.fromJson(Map<String, dynamic> json) =
      _$EventStatisticsImpl.fromJson;

  @override
  String get eventId;
  @override
  int get totalTickets;
  @override
  int get soldTickets;
  @override
  int get availableTickets;
  @override
  double get totalRevenue;
  @override
  double get targetRevenue;
  @override
  int get checkedInCount;
  @override
  double get conversionRate;
  @override
  Map<String, int> get ticketTypesSold;
  @override
  Map<String, double> get revenueByTicketType;
  @override
  DateTime get lastUpdated;

  /// Create a copy of EventStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventStatisticsImplCopyWith<_$EventStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
