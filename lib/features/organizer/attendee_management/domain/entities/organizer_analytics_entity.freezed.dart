// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organizer_analytics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganizerAnalyticsEntity _$OrganizerAnalyticsEntityFromJson(
    Map<String, dynamic> json) {
  return _OrganizerAnalyticsEntity.fromJson(json);
}

/// @nodoc
mixin _$OrganizerAnalyticsEntity {
  String get organizerId => throw _privateConstructorUsedError;
  AnalyticsPeriod get period => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  int get totalTicketsSold => throw _privateConstructorUsedError;
  int get totalEvents => throw _privateConstructorUsedError;
  double get averageTicketPrice => throw _privateConstructorUsedError;
  double get conversionRate => throw _privateConstructorUsedError;
  List<EventPerformanceEntity> get topEvents =>
      throw _privateConstructorUsedError;
  List<RevenueDataPoint> get revenueChart => throw _privateConstructorUsedError;
  Map<String, double> get revenueByCategory =>
      throw _privateConstructorUsedError;
  Map<String, int> get ticketsByType => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this OrganizerAnalyticsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganizerAnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizerAnalyticsEntityCopyWith<OrganizerAnalyticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizerAnalyticsEntityCopyWith<$Res> {
  factory $OrganizerAnalyticsEntityCopyWith(OrganizerAnalyticsEntity value,
          $Res Function(OrganizerAnalyticsEntity) then) =
      _$OrganizerAnalyticsEntityCopyWithImpl<$Res, OrganizerAnalyticsEntity>;
  @useResult
  $Res call(
      {String organizerId,
      AnalyticsPeriod period,
      double totalRevenue,
      int totalTicketsSold,
      int totalEvents,
      double averageTicketPrice,
      double conversionRate,
      List<EventPerformanceEntity> topEvents,
      List<RevenueDataPoint> revenueChart,
      Map<String, double> revenueByCategory,
      Map<String, int> ticketsByType,
      DateTime lastUpdated});
}

/// @nodoc
class _$OrganizerAnalyticsEntityCopyWithImpl<$Res,
        $Val extends OrganizerAnalyticsEntity>
    implements $OrganizerAnalyticsEntityCopyWith<$Res> {
  _$OrganizerAnalyticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizerAnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? period = null,
    Object? totalRevenue = null,
    Object? totalTicketsSold = null,
    Object? totalEvents = null,
    Object? averageTicketPrice = null,
    Object? conversionRate = null,
    Object? topEvents = null,
    Object? revenueChart = null,
    Object? revenueByCategory = null,
    Object? ticketsByType = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTicketsSold: null == totalTicketsSold
          ? _value.totalTicketsSold
          : totalTicketsSold // ignore: cast_nullable_to_non_nullable
              as int,
      totalEvents: null == totalEvents
          ? _value.totalEvents
          : totalEvents // ignore: cast_nullable_to_non_nullable
              as int,
      averageTicketPrice: null == averageTicketPrice
          ? _value.averageTicketPrice
          : averageTicketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      topEvents: null == topEvents
          ? _value.topEvents
          : topEvents // ignore: cast_nullable_to_non_nullable
              as List<EventPerformanceEntity>,
      revenueChart: null == revenueChart
          ? _value.revenueChart
          : revenueChart // ignore: cast_nullable_to_non_nullable
              as List<RevenueDataPoint>,
      revenueByCategory: null == revenueByCategory
          ? _value.revenueByCategory
          : revenueByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      ticketsByType: null == ticketsByType
          ? _value.ticketsByType
          : ticketsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizerAnalyticsEntityImplCopyWith<$Res>
    implements $OrganizerAnalyticsEntityCopyWith<$Res> {
  factory _$$OrganizerAnalyticsEntityImplCopyWith(
          _$OrganizerAnalyticsEntityImpl value,
          $Res Function(_$OrganizerAnalyticsEntityImpl) then) =
      __$$OrganizerAnalyticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String organizerId,
      AnalyticsPeriod period,
      double totalRevenue,
      int totalTicketsSold,
      int totalEvents,
      double averageTicketPrice,
      double conversionRate,
      List<EventPerformanceEntity> topEvents,
      List<RevenueDataPoint> revenueChart,
      Map<String, double> revenueByCategory,
      Map<String, int> ticketsByType,
      DateTime lastUpdated});
}

/// @nodoc
class __$$OrganizerAnalyticsEntityImplCopyWithImpl<$Res>
    extends _$OrganizerAnalyticsEntityCopyWithImpl<$Res,
        _$OrganizerAnalyticsEntityImpl>
    implements _$$OrganizerAnalyticsEntityImplCopyWith<$Res> {
  __$$OrganizerAnalyticsEntityImplCopyWithImpl(
      _$OrganizerAnalyticsEntityImpl _value,
      $Res Function(_$OrganizerAnalyticsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizerAnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? period = null,
    Object? totalRevenue = null,
    Object? totalTicketsSold = null,
    Object? totalEvents = null,
    Object? averageTicketPrice = null,
    Object? conversionRate = null,
    Object? topEvents = null,
    Object? revenueChart = null,
    Object? revenueByCategory = null,
    Object? ticketsByType = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$OrganizerAnalyticsEntityImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTicketsSold: null == totalTicketsSold
          ? _value.totalTicketsSold
          : totalTicketsSold // ignore: cast_nullable_to_non_nullable
              as int,
      totalEvents: null == totalEvents
          ? _value.totalEvents
          : totalEvents // ignore: cast_nullable_to_non_nullable
              as int,
      averageTicketPrice: null == averageTicketPrice
          ? _value.averageTicketPrice
          : averageTicketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      topEvents: null == topEvents
          ? _value._topEvents
          : topEvents // ignore: cast_nullable_to_non_nullable
              as List<EventPerformanceEntity>,
      revenueChart: null == revenueChart
          ? _value._revenueChart
          : revenueChart // ignore: cast_nullable_to_non_nullable
              as List<RevenueDataPoint>,
      revenueByCategory: null == revenueByCategory
          ? _value._revenueByCategory
          : revenueByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      ticketsByType: null == ticketsByType
          ? _value._ticketsByType
          : ticketsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizerAnalyticsEntityImpl implements _OrganizerAnalyticsEntity {
  const _$OrganizerAnalyticsEntityImpl(
      {required this.organizerId,
      required this.period,
      required this.totalRevenue,
      required this.totalTicketsSold,
      required this.totalEvents,
      required this.averageTicketPrice,
      required this.conversionRate,
      required final List<EventPerformanceEntity> topEvents,
      required final List<RevenueDataPoint> revenueChart,
      required final Map<String, double> revenueByCategory,
      required final Map<String, int> ticketsByType,
      required this.lastUpdated})
      : _topEvents = topEvents,
        _revenueChart = revenueChart,
        _revenueByCategory = revenueByCategory,
        _ticketsByType = ticketsByType;

  factory _$OrganizerAnalyticsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizerAnalyticsEntityImplFromJson(json);

  @override
  final String organizerId;
  @override
  final AnalyticsPeriod period;
  @override
  final double totalRevenue;
  @override
  final int totalTicketsSold;
  @override
  final int totalEvents;
  @override
  final double averageTicketPrice;
  @override
  final double conversionRate;
  final List<EventPerformanceEntity> _topEvents;
  @override
  List<EventPerformanceEntity> get topEvents {
    if (_topEvents is EqualUnmodifiableListView) return _topEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topEvents);
  }

  final List<RevenueDataPoint> _revenueChart;
  @override
  List<RevenueDataPoint> get revenueChart {
    if (_revenueChart is EqualUnmodifiableListView) return _revenueChart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_revenueChart);
  }

  final Map<String, double> _revenueByCategory;
  @override
  Map<String, double> get revenueByCategory {
    if (_revenueByCategory is EqualUnmodifiableMapView)
      return _revenueByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_revenueByCategory);
  }

  final Map<String, int> _ticketsByType;
  @override
  Map<String, int> get ticketsByType {
    if (_ticketsByType is EqualUnmodifiableMapView) return _ticketsByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ticketsByType);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'OrganizerAnalyticsEntity(organizerId: $organizerId, period: $period, totalRevenue: $totalRevenue, totalTicketsSold: $totalTicketsSold, totalEvents: $totalEvents, averageTicketPrice: $averageTicketPrice, conversionRate: $conversionRate, topEvents: $topEvents, revenueChart: $revenueChart, revenueByCategory: $revenueByCategory, ticketsByType: $ticketsByType, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizerAnalyticsEntityImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.totalTicketsSold, totalTicketsSold) ||
                other.totalTicketsSold == totalTicketsSold) &&
            (identical(other.totalEvents, totalEvents) ||
                other.totalEvents == totalEvents) &&
            (identical(other.averageTicketPrice, averageTicketPrice) ||
                other.averageTicketPrice == averageTicketPrice) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            const DeepCollectionEquality()
                .equals(other._topEvents, _topEvents) &&
            const DeepCollectionEquality()
                .equals(other._revenueChart, _revenueChart) &&
            const DeepCollectionEquality()
                .equals(other._revenueByCategory, _revenueByCategory) &&
            const DeepCollectionEquality()
                .equals(other._ticketsByType, _ticketsByType) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      organizerId,
      period,
      totalRevenue,
      totalTicketsSold,
      totalEvents,
      averageTicketPrice,
      conversionRate,
      const DeepCollectionEquality().hash(_topEvents),
      const DeepCollectionEquality().hash(_revenueChart),
      const DeepCollectionEquality().hash(_revenueByCategory),
      const DeepCollectionEquality().hash(_ticketsByType),
      lastUpdated);

  /// Create a copy of OrganizerAnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizerAnalyticsEntityImplCopyWith<_$OrganizerAnalyticsEntityImpl>
      get copyWith => __$$OrganizerAnalyticsEntityImplCopyWithImpl<
          _$OrganizerAnalyticsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizerAnalyticsEntityImplToJson(
      this,
    );
  }
}

abstract class _OrganizerAnalyticsEntity implements OrganizerAnalyticsEntity {
  const factory _OrganizerAnalyticsEntity(
      {required final String organizerId,
      required final AnalyticsPeriod period,
      required final double totalRevenue,
      required final int totalTicketsSold,
      required final int totalEvents,
      required final double averageTicketPrice,
      required final double conversionRate,
      required final List<EventPerformanceEntity> topEvents,
      required final List<RevenueDataPoint> revenueChart,
      required final Map<String, double> revenueByCategory,
      required final Map<String, int> ticketsByType,
      required final DateTime lastUpdated}) = _$OrganizerAnalyticsEntityImpl;

  factory _OrganizerAnalyticsEntity.fromJson(Map<String, dynamic> json) =
      _$OrganizerAnalyticsEntityImpl.fromJson;

  @override
  String get organizerId;
  @override
  AnalyticsPeriod get period;
  @override
  double get totalRevenue;
  @override
  int get totalTicketsSold;
  @override
  int get totalEvents;
  @override
  double get averageTicketPrice;
  @override
  double get conversionRate;
  @override
  List<EventPerformanceEntity> get topEvents;
  @override
  List<RevenueDataPoint> get revenueChart;
  @override
  Map<String, double> get revenueByCategory;
  @override
  Map<String, int> get ticketsByType;
  @override
  DateTime get lastUpdated;

  /// Create a copy of OrganizerAnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizerAnalyticsEntityImplCopyWith<_$OrganizerAnalyticsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EventPerformanceEntity _$EventPerformanceEntityFromJson(
    Map<String, dynamic> json) {
  return _EventPerformanceEntity.fromJson(json);
}

/// @nodoc
mixin _$EventPerformanceEntity {
  String get eventId => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  int get ticketsSold => throw _privateConstructorUsedError;
  int get totalTickets => throw _privateConstructorUsedError;
  double get conversionRate => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;

  /// Serializes this EventPerformanceEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventPerformanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventPerformanceEntityCopyWith<EventPerformanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventPerformanceEntityCopyWith<$Res> {
  factory $EventPerformanceEntityCopyWith(EventPerformanceEntity value,
          $Res Function(EventPerformanceEntity) then) =
      _$EventPerformanceEntityCopyWithImpl<$Res, EventPerformanceEntity>;
  @useResult
  $Res call(
      {String eventId,
      String eventTitle,
      double revenue,
      int ticketsSold,
      int totalTickets,
      double conversionRate,
      String? bannerUrl});
}

/// @nodoc
class _$EventPerformanceEntityCopyWithImpl<$Res,
        $Val extends EventPerformanceEntity>
    implements $EventPerformanceEntityCopyWith<$Res> {
  _$EventPerformanceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventPerformanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventTitle = null,
    Object? revenue = null,
    Object? ticketsSold = null,
    Object? totalTickets = null,
    Object? conversionRate = null,
    Object? bannerUrl = freezed,
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
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      ticketsSold: null == ticketsSold
          ? _value.ticketsSold
          : ticketsSold // ignore: cast_nullable_to_non_nullable
              as int,
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventPerformanceEntityImplCopyWith<$Res>
    implements $EventPerformanceEntityCopyWith<$Res> {
  factory _$$EventPerformanceEntityImplCopyWith(
          _$EventPerformanceEntityImpl value,
          $Res Function(_$EventPerformanceEntityImpl) then) =
      __$$EventPerformanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String eventTitle,
      double revenue,
      int ticketsSold,
      int totalTickets,
      double conversionRate,
      String? bannerUrl});
}

/// @nodoc
class __$$EventPerformanceEntityImplCopyWithImpl<$Res>
    extends _$EventPerformanceEntityCopyWithImpl<$Res,
        _$EventPerformanceEntityImpl>
    implements _$$EventPerformanceEntityImplCopyWith<$Res> {
  __$$EventPerformanceEntityImplCopyWithImpl(
      _$EventPerformanceEntityImpl _value,
      $Res Function(_$EventPerformanceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventPerformanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventTitle = null,
    Object? revenue = null,
    Object? ticketsSold = null,
    Object? totalTickets = null,
    Object? conversionRate = null,
    Object? bannerUrl = freezed,
  }) {
    return _then(_$EventPerformanceEntityImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      ticketsSold: null == ticketsSold
          ? _value.ticketsSold
          : ticketsSold // ignore: cast_nullable_to_non_nullable
              as int,
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventPerformanceEntityImpl implements _EventPerformanceEntity {
  const _$EventPerformanceEntityImpl(
      {required this.eventId,
      required this.eventTitle,
      required this.revenue,
      required this.ticketsSold,
      required this.totalTickets,
      required this.conversionRate,
      this.bannerUrl});

  factory _$EventPerformanceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventPerformanceEntityImplFromJson(json);

  @override
  final String eventId;
  @override
  final String eventTitle;
  @override
  final double revenue;
  @override
  final int ticketsSold;
  @override
  final int totalTickets;
  @override
  final double conversionRate;
  @override
  final String? bannerUrl;

  @override
  String toString() {
    return 'EventPerformanceEntity(eventId: $eventId, eventTitle: $eventTitle, revenue: $revenue, ticketsSold: $ticketsSold, totalTickets: $totalTickets, conversionRate: $conversionRate, bannerUrl: $bannerUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventPerformanceEntityImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.ticketsSold, ticketsSold) ||
                other.ticketsSold == ticketsSold) &&
            (identical(other.totalTickets, totalTickets) ||
                other.totalTickets == totalTickets) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, eventTitle, revenue,
      ticketsSold, totalTickets, conversionRate, bannerUrl);

  /// Create a copy of EventPerformanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventPerformanceEntityImplCopyWith<_$EventPerformanceEntityImpl>
      get copyWith => __$$EventPerformanceEntityImplCopyWithImpl<
          _$EventPerformanceEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventPerformanceEntityImplToJson(
      this,
    );
  }
}

abstract class _EventPerformanceEntity implements EventPerformanceEntity {
  const factory _EventPerformanceEntity(
      {required final String eventId,
      required final String eventTitle,
      required final double revenue,
      required final int ticketsSold,
      required final int totalTickets,
      required final double conversionRate,
      final String? bannerUrl}) = _$EventPerformanceEntityImpl;

  factory _EventPerformanceEntity.fromJson(Map<String, dynamic> json) =
      _$EventPerformanceEntityImpl.fromJson;

  @override
  String get eventId;
  @override
  String get eventTitle;
  @override
  double get revenue;
  @override
  int get ticketsSold;
  @override
  int get totalTickets;
  @override
  double get conversionRate;
  @override
  String? get bannerUrl;

  /// Create a copy of EventPerformanceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventPerformanceEntityImplCopyWith<_$EventPerformanceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RevenueDataPoint _$RevenueDataPointFromJson(Map<String, dynamic> json) {
  return _RevenueDataPoint.fromJson(json);
}

/// @nodoc
mixin _$RevenueDataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  int get ticketsSold => throw _privateConstructorUsedError;

  /// Serializes this RevenueDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenueDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueDataPointCopyWith<RevenueDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueDataPointCopyWith<$Res> {
  factory $RevenueDataPointCopyWith(
          RevenueDataPoint value, $Res Function(RevenueDataPoint) then) =
      _$RevenueDataPointCopyWithImpl<$Res, RevenueDataPoint>;
  @useResult
  $Res call({DateTime date, double revenue, int ticketsSold});
}

/// @nodoc
class _$RevenueDataPointCopyWithImpl<$Res, $Val extends RevenueDataPoint>
    implements $RevenueDataPointCopyWith<$Res> {
  _$RevenueDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenueDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? revenue = null,
    Object? ticketsSold = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      ticketsSold: null == ticketsSold
          ? _value.ticketsSold
          : ticketsSold // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenueDataPointImplCopyWith<$Res>
    implements $RevenueDataPointCopyWith<$Res> {
  factory _$$RevenueDataPointImplCopyWith(_$RevenueDataPointImpl value,
          $Res Function(_$RevenueDataPointImpl) then) =
      __$$RevenueDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double revenue, int ticketsSold});
}

/// @nodoc
class __$$RevenueDataPointImplCopyWithImpl<$Res>
    extends _$RevenueDataPointCopyWithImpl<$Res, _$RevenueDataPointImpl>
    implements _$$RevenueDataPointImplCopyWith<$Res> {
  __$$RevenueDataPointImplCopyWithImpl(_$RevenueDataPointImpl _value,
      $Res Function(_$RevenueDataPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of RevenueDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? revenue = null,
    Object? ticketsSold = null,
  }) {
    return _then(_$RevenueDataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      ticketsSold: null == ticketsSold
          ? _value.ticketsSold
          : ticketsSold // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueDataPointImpl implements _RevenueDataPoint {
  const _$RevenueDataPointImpl(
      {required this.date, required this.revenue, required this.ticketsSold});

  factory _$RevenueDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueDataPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double revenue;
  @override
  final int ticketsSold;

  @override
  String toString() {
    return 'RevenueDataPoint(date: $date, revenue: $revenue, ticketsSold: $ticketsSold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueDataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.ticketsSold, ticketsSold) ||
                other.ticketsSold == ticketsSold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, revenue, ticketsSold);

  /// Create a copy of RevenueDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueDataPointImplCopyWith<_$RevenueDataPointImpl> get copyWith =>
      __$$RevenueDataPointImplCopyWithImpl<_$RevenueDataPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueDataPointImplToJson(
      this,
    );
  }
}

abstract class _RevenueDataPoint implements RevenueDataPoint {
  const factory _RevenueDataPoint(
      {required final DateTime date,
      required final double revenue,
      required final int ticketsSold}) = _$RevenueDataPointImpl;

  factory _RevenueDataPoint.fromJson(Map<String, dynamic> json) =
      _$RevenueDataPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get revenue;
  @override
  int get ticketsSold;

  /// Create a copy of RevenueDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueDataPointImplCopyWith<_$RevenueDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsComparison _$AnalyticsComparisonFromJson(Map<String, dynamic> json) {
  return _AnalyticsComparison.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsComparison {
  OrganizerAnalyticsEntity get current => throw _privateConstructorUsedError;
  OrganizerAnalyticsEntity get previous => throw _privateConstructorUsedError;
  AnalyticsChanges get changes => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsComparisonCopyWith<AnalyticsComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsComparisonCopyWith<$Res> {
  factory $AnalyticsComparisonCopyWith(
          AnalyticsComparison value, $Res Function(AnalyticsComparison) then) =
      _$AnalyticsComparisonCopyWithImpl<$Res, AnalyticsComparison>;
  @useResult
  $Res call(
      {OrganizerAnalyticsEntity current,
      OrganizerAnalyticsEntity previous,
      AnalyticsChanges changes});

  $OrganizerAnalyticsEntityCopyWith<$Res> get current;
  $OrganizerAnalyticsEntityCopyWith<$Res> get previous;
  $AnalyticsChangesCopyWith<$Res> get changes;
}

/// @nodoc
class _$AnalyticsComparisonCopyWithImpl<$Res, $Val extends AnalyticsComparison>
    implements $AnalyticsComparisonCopyWith<$Res> {
  _$AnalyticsComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? previous = null,
    Object? changes = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as OrganizerAnalyticsEntity,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as OrganizerAnalyticsEntity,
      changes: null == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as AnalyticsChanges,
    ) as $Val);
  }

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerAnalyticsEntityCopyWith<$Res> get current {
    return $OrganizerAnalyticsEntityCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerAnalyticsEntityCopyWith<$Res> get previous {
    return $OrganizerAnalyticsEntityCopyWith<$Res>(_value.previous, (value) {
      return _then(_value.copyWith(previous: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsChangesCopyWith<$Res> get changes {
    return $AnalyticsChangesCopyWith<$Res>(_value.changes, (value) {
      return _then(_value.copyWith(changes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsComparisonImplCopyWith<$Res>
    implements $AnalyticsComparisonCopyWith<$Res> {
  factory _$$AnalyticsComparisonImplCopyWith(_$AnalyticsComparisonImpl value,
          $Res Function(_$AnalyticsComparisonImpl) then) =
      __$$AnalyticsComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrganizerAnalyticsEntity current,
      OrganizerAnalyticsEntity previous,
      AnalyticsChanges changes});

  @override
  $OrganizerAnalyticsEntityCopyWith<$Res> get current;
  @override
  $OrganizerAnalyticsEntityCopyWith<$Res> get previous;
  @override
  $AnalyticsChangesCopyWith<$Res> get changes;
}

/// @nodoc
class __$$AnalyticsComparisonImplCopyWithImpl<$Res>
    extends _$AnalyticsComparisonCopyWithImpl<$Res, _$AnalyticsComparisonImpl>
    implements _$$AnalyticsComparisonImplCopyWith<$Res> {
  __$$AnalyticsComparisonImplCopyWithImpl(_$AnalyticsComparisonImpl _value,
      $Res Function(_$AnalyticsComparisonImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? previous = null,
    Object? changes = null,
  }) {
    return _then(_$AnalyticsComparisonImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as OrganizerAnalyticsEntity,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as OrganizerAnalyticsEntity,
      changes: null == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as AnalyticsChanges,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsComparisonImpl implements _AnalyticsComparison {
  const _$AnalyticsComparisonImpl(
      {required this.current, required this.previous, required this.changes});

  factory _$AnalyticsComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsComparisonImplFromJson(json);

  @override
  final OrganizerAnalyticsEntity current;
  @override
  final OrganizerAnalyticsEntity previous;
  @override
  final AnalyticsChanges changes;

  @override
  String toString() {
    return 'AnalyticsComparison(current: $current, previous: $previous, changes: $changes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsComparisonImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.changes, changes) || other.changes == changes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current, previous, changes);

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsComparisonImplCopyWith<_$AnalyticsComparisonImpl> get copyWith =>
      __$$AnalyticsComparisonImplCopyWithImpl<_$AnalyticsComparisonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsComparisonImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsComparison implements AnalyticsComparison {
  const factory _AnalyticsComparison(
      {required final OrganizerAnalyticsEntity current,
      required final OrganizerAnalyticsEntity previous,
      required final AnalyticsChanges changes}) = _$AnalyticsComparisonImpl;

  factory _AnalyticsComparison.fromJson(Map<String, dynamic> json) =
      _$AnalyticsComparisonImpl.fromJson;

  @override
  OrganizerAnalyticsEntity get current;
  @override
  OrganizerAnalyticsEntity get previous;
  @override
  AnalyticsChanges get changes;

  /// Create a copy of AnalyticsComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsComparisonImplCopyWith<_$AnalyticsComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsChanges _$AnalyticsChangesFromJson(Map<String, dynamic> json) {
  return _AnalyticsChanges.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsChanges {
  double get revenueChange => throw _privateConstructorUsedError;
  double get ticketsSoldChange => throw _privateConstructorUsedError;
  double get conversionRateChange => throw _privateConstructorUsedError;
  double get averageTicketPriceChange => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsChanges to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsChanges
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsChangesCopyWith<AnalyticsChanges> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsChangesCopyWith<$Res> {
  factory $AnalyticsChangesCopyWith(
          AnalyticsChanges value, $Res Function(AnalyticsChanges) then) =
      _$AnalyticsChangesCopyWithImpl<$Res, AnalyticsChanges>;
  @useResult
  $Res call(
      {double revenueChange,
      double ticketsSoldChange,
      double conversionRateChange,
      double averageTicketPriceChange});
}

/// @nodoc
class _$AnalyticsChangesCopyWithImpl<$Res, $Val extends AnalyticsChanges>
    implements $AnalyticsChangesCopyWith<$Res> {
  _$AnalyticsChangesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsChanges
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revenueChange = null,
    Object? ticketsSoldChange = null,
    Object? conversionRateChange = null,
    Object? averageTicketPriceChange = null,
  }) {
    return _then(_value.copyWith(
      revenueChange: null == revenueChange
          ? _value.revenueChange
          : revenueChange // ignore: cast_nullable_to_non_nullable
              as double,
      ticketsSoldChange: null == ticketsSoldChange
          ? _value.ticketsSoldChange
          : ticketsSoldChange // ignore: cast_nullable_to_non_nullable
              as double,
      conversionRateChange: null == conversionRateChange
          ? _value.conversionRateChange
          : conversionRateChange // ignore: cast_nullable_to_non_nullable
              as double,
      averageTicketPriceChange: null == averageTicketPriceChange
          ? _value.averageTicketPriceChange
          : averageTicketPriceChange // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsChangesImplCopyWith<$Res>
    implements $AnalyticsChangesCopyWith<$Res> {
  factory _$$AnalyticsChangesImplCopyWith(_$AnalyticsChangesImpl value,
          $Res Function(_$AnalyticsChangesImpl) then) =
      __$$AnalyticsChangesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double revenueChange,
      double ticketsSoldChange,
      double conversionRateChange,
      double averageTicketPriceChange});
}

/// @nodoc
class __$$AnalyticsChangesImplCopyWithImpl<$Res>
    extends _$AnalyticsChangesCopyWithImpl<$Res, _$AnalyticsChangesImpl>
    implements _$$AnalyticsChangesImplCopyWith<$Res> {
  __$$AnalyticsChangesImplCopyWithImpl(_$AnalyticsChangesImpl _value,
      $Res Function(_$AnalyticsChangesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsChanges
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revenueChange = null,
    Object? ticketsSoldChange = null,
    Object? conversionRateChange = null,
    Object? averageTicketPriceChange = null,
  }) {
    return _then(_$AnalyticsChangesImpl(
      revenueChange: null == revenueChange
          ? _value.revenueChange
          : revenueChange // ignore: cast_nullable_to_non_nullable
              as double,
      ticketsSoldChange: null == ticketsSoldChange
          ? _value.ticketsSoldChange
          : ticketsSoldChange // ignore: cast_nullable_to_non_nullable
              as double,
      conversionRateChange: null == conversionRateChange
          ? _value.conversionRateChange
          : conversionRateChange // ignore: cast_nullable_to_non_nullable
              as double,
      averageTicketPriceChange: null == averageTicketPriceChange
          ? _value.averageTicketPriceChange
          : averageTicketPriceChange // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsChangesImpl extends _AnalyticsChanges {
  const _$AnalyticsChangesImpl(
      {required this.revenueChange,
      required this.ticketsSoldChange,
      required this.conversionRateChange,
      required this.averageTicketPriceChange})
      : super._();

  factory _$AnalyticsChangesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsChangesImplFromJson(json);

  @override
  final double revenueChange;
  @override
  final double ticketsSoldChange;
  @override
  final double conversionRateChange;
  @override
  final double averageTicketPriceChange;

  @override
  String toString() {
    return 'AnalyticsChanges(revenueChange: $revenueChange, ticketsSoldChange: $ticketsSoldChange, conversionRateChange: $conversionRateChange, averageTicketPriceChange: $averageTicketPriceChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsChangesImpl &&
            (identical(other.revenueChange, revenueChange) ||
                other.revenueChange == revenueChange) &&
            (identical(other.ticketsSoldChange, ticketsSoldChange) ||
                other.ticketsSoldChange == ticketsSoldChange) &&
            (identical(other.conversionRateChange, conversionRateChange) ||
                other.conversionRateChange == conversionRateChange) &&
            (identical(
                    other.averageTicketPriceChange, averageTicketPriceChange) ||
                other.averageTicketPriceChange == averageTicketPriceChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, revenueChange, ticketsSoldChange,
      conversionRateChange, averageTicketPriceChange);

  /// Create a copy of AnalyticsChanges
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsChangesImplCopyWith<_$AnalyticsChangesImpl> get copyWith =>
      __$$AnalyticsChangesImplCopyWithImpl<_$AnalyticsChangesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsChangesImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsChanges extends AnalyticsChanges {
  const factory _AnalyticsChanges(
      {required final double revenueChange,
      required final double ticketsSoldChange,
      required final double conversionRateChange,
      required final double averageTicketPriceChange}) = _$AnalyticsChangesImpl;
  const _AnalyticsChanges._() : super._();

  factory _AnalyticsChanges.fromJson(Map<String, dynamic> json) =
      _$AnalyticsChangesImpl.fromJson;

  @override
  double get revenueChange;
  @override
  double get ticketsSoldChange;
  @override
  double get conversionRateChange;
  @override
  double get averageTicketPriceChange;

  /// Create a copy of AnalyticsChanges
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsChangesImplCopyWith<_$AnalyticsChangesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
