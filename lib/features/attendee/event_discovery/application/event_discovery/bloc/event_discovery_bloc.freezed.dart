// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_discovery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventDiscoveryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDiscoveryEventCopyWith<$Res> {
  factory $EventDiscoveryEventCopyWith(
          EventDiscoveryEvent value, $Res Function(EventDiscoveryEvent) then) =
      _$EventDiscoveryEventCopyWithImpl<$Res, EventDiscoveryEvent>;
}

/// @nodoc
class _$EventDiscoveryEventCopyWithImpl<$Res, $Val extends EventDiscoveryEvent>
    implements $EventDiscoveryEventCopyWith<$Res> {
  _$EventDiscoveryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadUpcomingEventsImplCopyWith<$Res> {
  factory _$$LoadUpcomingEventsImplCopyWith(_$LoadUpcomingEventsImpl value,
          $Res Function(_$LoadUpcomingEventsImpl) then) =
      __$$LoadUpcomingEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? limit, String? lastEventId});
}

/// @nodoc
class __$$LoadUpcomingEventsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$LoadUpcomingEventsImpl>
    implements _$$LoadUpcomingEventsImplCopyWith<$Res> {
  __$$LoadUpcomingEventsImplCopyWithImpl(_$LoadUpcomingEventsImpl _value,
      $Res Function(_$LoadUpcomingEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? lastEventId = freezed,
  }) {
    return _then(_$LoadUpcomingEventsImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      lastEventId: freezed == lastEventId
          ? _value.lastEventId
          : lastEventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadUpcomingEventsImpl implements _LoadUpcomingEvents {
  const _$LoadUpcomingEventsImpl({this.limit, this.lastEventId});

  @override
  final int? limit;
  @override
  final String? lastEventId;

  @override
  String toString() {
    return 'EventDiscoveryEvent.loadUpcomingEvents(limit: $limit, lastEventId: $lastEventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUpcomingEventsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lastEventId, lastEventId) ||
                other.lastEventId == lastEventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, lastEventId);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUpcomingEventsImplCopyWith<_$LoadUpcomingEventsImpl> get copyWith =>
      __$$LoadUpcomingEventsImplCopyWithImpl<_$LoadUpcomingEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return loadUpcomingEvents(limit, lastEventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return loadUpcomingEvents?.call(limit, lastEventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadUpcomingEvents != null) {
      return loadUpcomingEvents(limit, lastEventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadUpcomingEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadUpcomingEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadUpcomingEvents != null) {
      return loadUpcomingEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadUpcomingEvents implements EventDiscoveryEvent {
  const factory _LoadUpcomingEvents(
      {final int? limit, final String? lastEventId}) = _$LoadUpcomingEventsImpl;

  int? get limit;
  String? get lastEventId;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUpcomingEventsImplCopyWith<_$LoadUpcomingEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFeaturedEventsImplCopyWith<$Res> {
  factory _$$LoadFeaturedEventsImplCopyWith(_$LoadFeaturedEventsImpl value,
          $Res Function(_$LoadFeaturedEventsImpl) then) =
      __$$LoadFeaturedEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? limit});
}

/// @nodoc
class __$$LoadFeaturedEventsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$LoadFeaturedEventsImpl>
    implements _$$LoadFeaturedEventsImplCopyWith<$Res> {
  __$$LoadFeaturedEventsImplCopyWithImpl(_$LoadFeaturedEventsImpl _value,
      $Res Function(_$LoadFeaturedEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
  }) {
    return _then(_$LoadFeaturedEventsImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadFeaturedEventsImpl implements _LoadFeaturedEvents {
  const _$LoadFeaturedEventsImpl({this.limit});

  @override
  final int? limit;

  @override
  String toString() {
    return 'EventDiscoveryEvent.loadFeaturedEvents(limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFeaturedEventsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFeaturedEventsImplCopyWith<_$LoadFeaturedEventsImpl> get copyWith =>
      __$$LoadFeaturedEventsImplCopyWithImpl<_$LoadFeaturedEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return loadFeaturedEvents(limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return loadFeaturedEvents?.call(limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadFeaturedEvents != null) {
      return loadFeaturedEvents(limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadFeaturedEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadFeaturedEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadFeaturedEvents != null) {
      return loadFeaturedEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadFeaturedEvents implements EventDiscoveryEvent {
  const factory _LoadFeaturedEvents({final int? limit}) =
      _$LoadFeaturedEventsImpl;

  int? get limit;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFeaturedEventsImplCopyWith<_$LoadFeaturedEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadEventsByCategoryImplCopyWith<$Res> {
  factory _$$LoadEventsByCategoryImplCopyWith(_$LoadEventsByCategoryImpl value,
          $Res Function(_$LoadEventsByCategoryImpl) then) =
      __$$LoadEventsByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EventCategory category, int? limit});
}

/// @nodoc
class __$$LoadEventsByCategoryImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$LoadEventsByCategoryImpl>
    implements _$$LoadEventsByCategoryImplCopyWith<$Res> {
  __$$LoadEventsByCategoryImplCopyWithImpl(_$LoadEventsByCategoryImpl _value,
      $Res Function(_$LoadEventsByCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? limit = freezed,
  }) {
    return _then(_$LoadEventsByCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadEventsByCategoryImpl implements _LoadEventsByCategory {
  const _$LoadEventsByCategoryImpl({required this.category, this.limit});

  @override
  final EventCategory category;
  @override
  final int? limit;

  @override
  String toString() {
    return 'EventDiscoveryEvent.loadEventsByCategory(category: $category, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventsByCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, limit);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventsByCategoryImplCopyWith<_$LoadEventsByCategoryImpl>
      get copyWith =>
          __$$LoadEventsByCategoryImplCopyWithImpl<_$LoadEventsByCategoryImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return loadEventsByCategory(category, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return loadEventsByCategory?.call(category, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadEventsByCategory != null) {
      return loadEventsByCategory(category, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadEventsByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadEventsByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadEventsByCategory != null) {
      return loadEventsByCategory(this);
    }
    return orElse();
  }
}

abstract class _LoadEventsByCategory implements EventDiscoveryEvent {
  const factory _LoadEventsByCategory(
      {required final EventCategory category,
      final int? limit}) = _$LoadEventsByCategoryImpl;

  EventCategory get category;
  int? get limit;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventsByCategoryImplCopyWith<_$LoadEventsByCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventsImplCopyWith<$Res> {
  factory _$$SearchEventsImplCopyWith(
          _$SearchEventsImpl value, $Res Function(_$SearchEventsImpl) then) =
      __$$SearchEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EventSearchFilters filters, int? limit});

  $EventSearchFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$SearchEventsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$SearchEventsImpl>
    implements _$$SearchEventsImplCopyWith<$Res> {
  __$$SearchEventsImplCopyWithImpl(
      _$SearchEventsImpl _value, $Res Function(_$SearchEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? limit = freezed,
  }) {
    return _then(_$SearchEventsImpl(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as EventSearchFilters,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventSearchFiltersCopyWith<$Res> get filters {
    return $EventSearchFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc

class _$SearchEventsImpl implements _SearchEvents {
  const _$SearchEventsImpl({required this.filters, this.limit});

  @override
  final EventSearchFilters filters;
  @override
  final int? limit;

  @override
  String toString() {
    return 'EventDiscoveryEvent.searchEvents(filters: $filters, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventsImpl &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filters, limit);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventsImplCopyWith<_$SearchEventsImpl> get copyWith =>
      __$$SearchEventsImplCopyWithImpl<_$SearchEventsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return searchEvents(filters, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return searchEvents?.call(filters, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (searchEvents != null) {
      return searchEvents(filters, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return searchEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return searchEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (searchEvents != null) {
      return searchEvents(this);
    }
    return orElse();
  }
}

abstract class _SearchEvents implements EventDiscoveryEvent {
  const factory _SearchEvents(
      {required final EventSearchFilters filters,
      final int? limit}) = _$SearchEventsImpl;

  EventSearchFilters get filters;
  int? get limit;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchEventsImplCopyWith<_$SearchEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadEventDetailsImplCopyWith<$Res> {
  factory _$$LoadEventDetailsImplCopyWith(_$LoadEventDetailsImpl value,
          $Res Function(_$LoadEventDetailsImpl) then) =
      __$$LoadEventDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String? userId});
}

/// @nodoc
class __$$LoadEventDetailsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$LoadEventDetailsImpl>
    implements _$$LoadEventDetailsImplCopyWith<$Res> {
  __$$LoadEventDetailsImplCopyWithImpl(_$LoadEventDetailsImpl _value,
      $Res Function(_$LoadEventDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? userId = freezed,
  }) {
    return _then(_$LoadEventDetailsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadEventDetailsImpl implements _LoadEventDetails {
  const _$LoadEventDetailsImpl({required this.eventId, this.userId});

  @override
  final String eventId;
  @override
  final String? userId;

  @override
  String toString() {
    return 'EventDiscoveryEvent.loadEventDetails(eventId: $eventId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventDetailsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, userId);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventDetailsImplCopyWith<_$LoadEventDetailsImpl> get copyWith =>
      __$$LoadEventDetailsImplCopyWithImpl<_$LoadEventDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return loadEventDetails(eventId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return loadEventDetails?.call(eventId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadEventDetails != null) {
      return loadEventDetails(eventId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadEventDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadEventDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadEventDetails != null) {
      return loadEventDetails(this);
    }
    return orElse();
  }
}

abstract class _LoadEventDetails implements EventDiscoveryEvent {
  const factory _LoadEventDetails(
      {required final String eventId,
      final String? userId}) = _$LoadEventDetailsImpl;

  String get eventId;
  String? get userId;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventDetailsImplCopyWith<_$LoadEventDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFavoriteImplCopyWith<$Res> {
  factory _$$ToggleFavoriteImplCopyWith(_$ToggleFavoriteImpl value,
          $Res Function(_$ToggleFavoriteImpl) then) =
      __$$ToggleFavoriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String eventId});
}

/// @nodoc
class __$$ToggleFavoriteImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$ToggleFavoriteImpl>
    implements _$$ToggleFavoriteImplCopyWith<$Res> {
  __$$ToggleFavoriteImplCopyWithImpl(
      _$ToggleFavoriteImpl _value, $Res Function(_$ToggleFavoriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? eventId = null,
  }) {
    return _then(_$ToggleFavoriteImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleFavoriteImpl implements _ToggleFavorite {
  const _$ToggleFavoriteImpl({required this.userId, required this.eventId});

  @override
  final String userId;
  @override
  final String eventId;

  @override
  String toString() {
    return 'EventDiscoveryEvent.toggleFavorite(userId: $userId, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFavoriteImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, eventId);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFavoriteImplCopyWith<_$ToggleFavoriteImpl> get copyWith =>
      __$$ToggleFavoriteImplCopyWithImpl<_$ToggleFavoriteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return toggleFavorite(userId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return toggleFavorite?.call(userId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(userId, eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return toggleFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return toggleFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(this);
    }
    return orElse();
  }
}

abstract class _ToggleFavorite implements EventDiscoveryEvent {
  const factory _ToggleFavorite(
      {required final String userId,
      required final String eventId}) = _$ToggleFavoriteImpl;

  String get userId;
  String get eventId;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleFavoriteImplCopyWith<_$ToggleFavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFavoriteEventsImplCopyWith<$Res> {
  factory _$$LoadFavoriteEventsImplCopyWith(_$LoadFavoriteEventsImpl value,
          $Res Function(_$LoadFavoriteEventsImpl) then) =
      __$$LoadFavoriteEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadFavoriteEventsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$LoadFavoriteEventsImpl>
    implements _$$LoadFavoriteEventsImplCopyWith<$Res> {
  __$$LoadFavoriteEventsImplCopyWithImpl(_$LoadFavoriteEventsImpl _value,
      $Res Function(_$LoadFavoriteEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadFavoriteEventsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFavoriteEventsImpl implements _LoadFavoriteEvents {
  const _$LoadFavoriteEventsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'EventDiscoveryEvent.loadFavoriteEvents(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFavoriteEventsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFavoriteEventsImplCopyWith<_$LoadFavoriteEventsImpl> get copyWith =>
      __$$LoadFavoriteEventsImplCopyWithImpl<_$LoadFavoriteEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return loadFavoriteEvents(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return loadFavoriteEvents?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadFavoriteEvents != null) {
      return loadFavoriteEvents(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadFavoriteEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadFavoriteEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadFavoriteEvents != null) {
      return loadFavoriteEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadFavoriteEvents implements EventDiscoveryEvent {
  const factory _LoadFavoriteEvents({required final String userId}) =
      _$LoadFavoriteEventsImpl;

  String get userId;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFavoriteEventsImplCopyWith<_$LoadFavoriteEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadNearbyEventsImplCopyWith<$Res> {
  factory _$$LoadNearbyEventsImplCopyWith(_$LoadNearbyEventsImpl value,
          $Res Function(_$LoadNearbyEventsImpl) then) =
      __$$LoadNearbyEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude, double? radiusKm, int? limit});
}

/// @nodoc
class __$$LoadNearbyEventsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$LoadNearbyEventsImpl>
    implements _$$LoadNearbyEventsImplCopyWith<$Res> {
  __$$LoadNearbyEventsImplCopyWithImpl(_$LoadNearbyEventsImpl _value,
      $Res Function(_$LoadNearbyEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? radiusKm = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$LoadNearbyEventsImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radiusKm: freezed == radiusKm
          ? _value.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadNearbyEventsImpl implements _LoadNearbyEvents {
  const _$LoadNearbyEventsImpl(
      {required this.latitude,
      required this.longitude,
      this.radiusKm,
      this.limit});

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? radiusKm;
  @override
  final int? limit;

  @override
  String toString() {
    return 'EventDiscoveryEvent.loadNearbyEvents(latitude: $latitude, longitude: $longitude, radiusKm: $radiusKm, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNearbyEventsImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, radiusKm, limit);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadNearbyEventsImplCopyWith<_$LoadNearbyEventsImpl> get copyWith =>
      __$$LoadNearbyEventsImplCopyWithImpl<_$LoadNearbyEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return loadNearbyEvents(latitude, longitude, radiusKm, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return loadNearbyEvents?.call(latitude, longitude, radiusKm, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadNearbyEvents != null) {
      return loadNearbyEvents(latitude, longitude, radiusKm, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadNearbyEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadNearbyEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadNearbyEvents != null) {
      return loadNearbyEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadNearbyEvents implements EventDiscoveryEvent {
  const factory _LoadNearbyEvents(
      {required final double latitude,
      required final double longitude,
      final double? radiusKm,
      final int? limit}) = _$LoadNearbyEventsImpl;

  double get latitude;
  double get longitude;
  double? get radiusKm;
  int? get limit;

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadNearbyEventsImplCopyWith<_$LoadNearbyEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshEventsImplCopyWith<$Res> {
  factory _$$RefreshEventsImplCopyWith(
          _$RefreshEventsImpl value, $Res Function(_$RefreshEventsImpl) then) =
      __$$RefreshEventsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshEventsImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$RefreshEventsImpl>
    implements _$$RefreshEventsImplCopyWith<$Res> {
  __$$RefreshEventsImplCopyWithImpl(
      _$RefreshEventsImpl _value, $Res Function(_$RefreshEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshEventsImpl implements _RefreshEvents {
  const _$RefreshEventsImpl();

  @override
  String toString() {
    return 'EventDiscoveryEvent.refreshEvents()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshEventsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return refreshEvents();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return refreshEvents?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (refreshEvents != null) {
      return refreshEvents();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return refreshEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return refreshEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (refreshEvents != null) {
      return refreshEvents(this);
    }
    return orElse();
  }
}

abstract class _RefreshEvents implements EventDiscoveryEvent {
  const factory _RefreshEvents() = _$RefreshEventsImpl;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'EventDiscoveryEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, String? lastEventId)
        loadUpcomingEvents,
    required TResult Function(int? limit) loadFeaturedEvents,
    required TResult Function(EventCategory category, int? limit)
        loadEventsByCategory,
    required TResult Function(EventSearchFilters filters, int? limit)
        searchEvents,
    required TResult Function(String eventId, String? userId) loadEventDetails,
    required TResult Function(String userId, String eventId) toggleFavorite,
    required TResult Function(String userId) loadFavoriteEvents,
    required TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)
        loadNearbyEvents,
    required TResult Function() refreshEvents,
    required TResult Function() clearSearch,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult? Function(int? limit)? loadFeaturedEvents,
    TResult? Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult? Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult? Function(String eventId, String? userId)? loadEventDetails,
    TResult? Function(String userId, String eventId)? toggleFavorite,
    TResult? Function(String userId)? loadFavoriteEvents,
    TResult? Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult? Function()? refreshEvents,
    TResult? Function()? clearSearch,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, String? lastEventId)? loadUpcomingEvents,
    TResult Function(int? limit)? loadFeaturedEvents,
    TResult Function(EventCategory category, int? limit)? loadEventsByCategory,
    TResult Function(EventSearchFilters filters, int? limit)? searchEvents,
    TResult Function(String eventId, String? userId)? loadEventDetails,
    TResult Function(String userId, String eventId)? toggleFavorite,
    TResult Function(String userId)? loadFavoriteEvents,
    TResult Function(
            double latitude, double longitude, double? radiusKm, int? limit)?
        loadNearbyEvents,
    TResult Function()? refreshEvents,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUpcomingEvents value) loadUpcomingEvents,
    required TResult Function(_LoadFeaturedEvents value) loadFeaturedEvents,
    required TResult Function(_LoadEventsByCategory value) loadEventsByCategory,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventDetails value) loadEventDetails,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_LoadFavoriteEvents value) loadFavoriteEvents,
    required TResult Function(_LoadNearbyEvents value) loadNearbyEvents,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult? Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult? Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventDetails value)? loadEventDetails,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult? Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUpcomingEvents value)? loadUpcomingEvents,
    TResult Function(_LoadFeaturedEvents value)? loadFeaturedEvents,
    TResult Function(_LoadEventsByCategory value)? loadEventsByCategory,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventDetails value)? loadEventDetails,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_LoadFavoriteEvents value)? loadFavoriteEvents,
    TResult Function(_LoadNearbyEvents value)? loadNearbyEvents,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements EventDiscoveryEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
mixin _$EventDiscoveryState {
  List<EventDiscoveryEntity> get events => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingDetails => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isSearchResult => throw _privateConstructorUsedError;
  EventCategory? get selectedCategory => throw _privateConstructorUsedError;
  EventSearchFilters? get searchFilters => throw _privateConstructorUsedError;
  EventDiscoveryEntity? get selectedEvent => throw _privateConstructorUsedError;

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDiscoveryStateCopyWith<EventDiscoveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDiscoveryStateCopyWith<$Res> {
  factory $EventDiscoveryStateCopyWith(
          EventDiscoveryState value, $Res Function(EventDiscoveryState) then) =
      _$EventDiscoveryStateCopyWithImpl<$Res, EventDiscoveryState>;
  @useResult
  $Res call(
      {List<EventDiscoveryEntity> events,
      bool isLoading,
      bool isLoadingDetails,
      bool hasError,
      String errorMessage,
      bool isSearchResult,
      EventCategory? selectedCategory,
      EventSearchFilters? searchFilters,
      EventDiscoveryEntity? selectedEvent});

  $EventSearchFiltersCopyWith<$Res>? get searchFilters;
  $EventDiscoveryEntityCopyWith<$Res>? get selectedEvent;
}

/// @nodoc
class _$EventDiscoveryStateCopyWithImpl<$Res, $Val extends EventDiscoveryState>
    implements $EventDiscoveryStateCopyWith<$Res> {
  _$EventDiscoveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? isLoading = null,
    Object? isLoadingDetails = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? isSearchResult = null,
    Object? selectedCategory = freezed,
    Object? searchFilters = freezed,
    Object? selectedEvent = freezed,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDiscoveryEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _value.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isSearchResult: null == isSearchResult
          ? _value.isSearchResult
          : isSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory?,
      searchFilters: freezed == searchFilters
          ? _value.searchFilters
          : searchFilters // ignore: cast_nullable_to_non_nullable
              as EventSearchFilters?,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as EventDiscoveryEntity?,
    ) as $Val);
  }

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventSearchFiltersCopyWith<$Res>? get searchFilters {
    if (_value.searchFilters == null) {
      return null;
    }

    return $EventSearchFiltersCopyWith<$Res>(_value.searchFilters!, (value) {
      return _then(_value.copyWith(searchFilters: value) as $Val);
    });
  }

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventDiscoveryEntityCopyWith<$Res>? get selectedEvent {
    if (_value.selectedEvent == null) {
      return null;
    }

    return $EventDiscoveryEntityCopyWith<$Res>(_value.selectedEvent!, (value) {
      return _then(_value.copyWith(selectedEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventDiscoveryStateImplCopyWith<$Res>
    implements $EventDiscoveryStateCopyWith<$Res> {
  factory _$$EventDiscoveryStateImplCopyWith(_$EventDiscoveryStateImpl value,
          $Res Function(_$EventDiscoveryStateImpl) then) =
      __$$EventDiscoveryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventDiscoveryEntity> events,
      bool isLoading,
      bool isLoadingDetails,
      bool hasError,
      String errorMessage,
      bool isSearchResult,
      EventCategory? selectedCategory,
      EventSearchFilters? searchFilters,
      EventDiscoveryEntity? selectedEvent});

  @override
  $EventSearchFiltersCopyWith<$Res>? get searchFilters;
  @override
  $EventDiscoveryEntityCopyWith<$Res>? get selectedEvent;
}

/// @nodoc
class __$$EventDiscoveryStateImplCopyWithImpl<$Res>
    extends _$EventDiscoveryStateCopyWithImpl<$Res, _$EventDiscoveryStateImpl>
    implements _$$EventDiscoveryStateImplCopyWith<$Res> {
  __$$EventDiscoveryStateImplCopyWithImpl(_$EventDiscoveryStateImpl _value,
      $Res Function(_$EventDiscoveryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? isLoading = null,
    Object? isLoadingDetails = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? isSearchResult = null,
    Object? selectedCategory = freezed,
    Object? searchFilters = freezed,
    Object? selectedEvent = freezed,
  }) {
    return _then(_$EventDiscoveryStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventDiscoveryEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _value.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isSearchResult: null == isSearchResult
          ? _value.isSearchResult
          : isSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory?,
      searchFilters: freezed == searchFilters
          ? _value.searchFilters
          : searchFilters // ignore: cast_nullable_to_non_nullable
              as EventSearchFilters?,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as EventDiscoveryEntity?,
    ));
  }
}

/// @nodoc

class _$EventDiscoveryStateImpl implements _EventDiscoveryState {
  const _$EventDiscoveryStateImpl(
      {final List<EventDiscoveryEntity> events = const [],
      this.isLoading = false,
      this.isLoadingDetails = false,
      this.hasError = false,
      this.errorMessage = '',
      this.isSearchResult = false,
      this.selectedCategory,
      this.searchFilters,
      this.selectedEvent})
      : _events = events;

  final List<EventDiscoveryEntity> _events;
  @override
  @JsonKey()
  List<EventDiscoveryEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingDetails;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isSearchResult;
  @override
  final EventCategory? selectedCategory;
  @override
  final EventSearchFilters? searchFilters;
  @override
  final EventDiscoveryEntity? selectedEvent;

  @override
  String toString() {
    return 'EventDiscoveryState(events: $events, isLoading: $isLoading, isLoadingDetails: $isLoadingDetails, hasError: $hasError, errorMessage: $errorMessage, isSearchResult: $isSearchResult, selectedCategory: $selectedCategory, searchFilters: $searchFilters, selectedEvent: $selectedEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDiscoveryStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingDetails, isLoadingDetails) ||
                other.isLoadingDetails == isLoadingDetails) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSearchResult, isSearchResult) ||
                other.isSearchResult == isSearchResult) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.searchFilters, searchFilters) ||
                other.searchFilters == searchFilters) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      isLoading,
      isLoadingDetails,
      hasError,
      errorMessage,
      isSearchResult,
      selectedCategory,
      searchFilters,
      selectedEvent);

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDiscoveryStateImplCopyWith<_$EventDiscoveryStateImpl> get copyWith =>
      __$$EventDiscoveryStateImplCopyWithImpl<_$EventDiscoveryStateImpl>(
          this, _$identity);
}

abstract class _EventDiscoveryState implements EventDiscoveryState {
  const factory _EventDiscoveryState(
      {final List<EventDiscoveryEntity> events,
      final bool isLoading,
      final bool isLoadingDetails,
      final bool hasError,
      final String errorMessage,
      final bool isSearchResult,
      final EventCategory? selectedCategory,
      final EventSearchFilters? searchFilters,
      final EventDiscoveryEntity? selectedEvent}) = _$EventDiscoveryStateImpl;

  @override
  List<EventDiscoveryEntity> get events;
  @override
  bool get isLoading;
  @override
  bool get isLoadingDetails;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  bool get isSearchResult;
  @override
  EventCategory? get selectedCategory;
  @override
  EventSearchFilters? get searchFilters;
  @override
  EventDiscoveryEntity? get selectedEvent;

  /// Create a copy of EventDiscoveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDiscoveryStateImplCopyWith<_$EventDiscoveryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
