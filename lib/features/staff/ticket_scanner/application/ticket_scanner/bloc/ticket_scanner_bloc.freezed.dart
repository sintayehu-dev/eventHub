// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_scanner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketScannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketScannerEventCopyWith<$Res> {
  factory $TicketScannerEventCopyWith(
          TicketScannerEvent value, $Res Function(TicketScannerEvent) then) =
      _$TicketScannerEventCopyWithImpl<$Res, TicketScannerEvent>;
}

/// @nodoc
class _$TicketScannerEventCopyWithImpl<$Res, $Val extends TicketScannerEvent>
    implements $TicketScannerEventCopyWith<$Res> {
  _$TicketScannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TicketScannerEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TicketScannerEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ScanQRCodeImplCopyWith<$Res> {
  factory _$$ScanQRCodeImplCopyWith(
          _$ScanQRCodeImpl value, $Res Function(_$ScanQRCodeImpl) then) =
      __$$ScanQRCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String qrCode, String eventId, String staffId});
}

/// @nodoc
class __$$ScanQRCodeImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$ScanQRCodeImpl>
    implements _$$ScanQRCodeImplCopyWith<$Res> {
  __$$ScanQRCodeImplCopyWithImpl(
      _$ScanQRCodeImpl _value, $Res Function(_$ScanQRCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$ScanQRCodeImpl(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$ScanQRCodeImpl implements _ScanQRCode {
  const _$ScanQRCodeImpl(
      {required this.qrCode, required this.eventId, required this.staffId});

  @override
  final String qrCode;
  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'TicketScannerEvent.scanQRCode(qrCode: $qrCode, eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanQRCodeImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrCode, eventId, staffId);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanQRCodeImplCopyWith<_$ScanQRCodeImpl> get copyWith =>
      __$$ScanQRCodeImplCopyWithImpl<_$ScanQRCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return scanQRCode(qrCode, eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return scanQRCode?.call(qrCode, eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (scanQRCode != null) {
      return scanQRCode(qrCode, eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return scanQRCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return scanQRCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (scanQRCode != null) {
      return scanQRCode(this);
    }
    return orElse();
  }
}

abstract class _ScanQRCode implements TicketScannerEvent {
  const factory _ScanQRCode(
      {required final String qrCode,
      required final String eventId,
      required final String staffId}) = _$ScanQRCodeImpl;

  String get qrCode;
  String get eventId;
  String get staffId;

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanQRCodeImplCopyWith<_$ScanQRCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateTicketImplCopyWith<$Res> {
  factory _$$ValidateTicketImplCopyWith(_$ValidateTicketImpl value,
          $Res Function(_$ValidateTicketImpl) then) =
      __$$ValidateTicketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String qrCode, String eventId, String staffId});
}

/// @nodoc
class __$$ValidateTicketImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$ValidateTicketImpl>
    implements _$$ValidateTicketImplCopyWith<$Res> {
  __$$ValidateTicketImplCopyWithImpl(
      _$ValidateTicketImpl _value, $Res Function(_$ValidateTicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$ValidateTicketImpl(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$ValidateTicketImpl implements _ValidateTicket {
  const _$ValidateTicketImpl(
      {required this.qrCode, required this.eventId, required this.staffId});

  @override
  final String qrCode;
  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'TicketScannerEvent.validateTicket(qrCode: $qrCode, eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateTicketImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrCode, eventId, staffId);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateTicketImplCopyWith<_$ValidateTicketImpl> get copyWith =>
      __$$ValidateTicketImplCopyWithImpl<_$ValidateTicketImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return validateTicket(qrCode, eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return validateTicket?.call(qrCode, eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (validateTicket != null) {
      return validateTicket(qrCode, eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return validateTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return validateTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (validateTicket != null) {
      return validateTicket(this);
    }
    return orElse();
  }
}

abstract class _ValidateTicket implements TicketScannerEvent {
  const factory _ValidateTicket(
      {required final String qrCode,
      required final String eventId,
      required final String staffId}) = _$ValidateTicketImpl;

  String get qrCode;
  String get eventId;
  String get staffId;

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateTicketImplCopyWith<_$ValidateTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckInTicketImplCopyWith<$Res> {
  factory _$$CheckInTicketImplCopyWith(
          _$CheckInTicketImpl value, $Res Function(_$CheckInTicketImpl) then) =
      __$$CheckInTicketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId, String eventId, String staffId, String? notes});
}

/// @nodoc
class __$$CheckInTicketImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$CheckInTicketImpl>
    implements _$$CheckInTicketImplCopyWith<$Res> {
  __$$CheckInTicketImplCopyWithImpl(
      _$CheckInTicketImpl _value, $Res Function(_$CheckInTicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? eventId = null,
    Object? staffId = null,
    Object? notes = freezed,
  }) {
    return _then(_$CheckInTicketImpl(
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckInTicketImpl implements _CheckInTicket {
  const _$CheckInTicketImpl(
      {required this.ticketId,
      required this.eventId,
      required this.staffId,
      this.notes});

  @override
  final String ticketId;
  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TicketScannerEvent.checkInTicket(ticketId: $ticketId, eventId: $eventId, staffId: $staffId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInTicketImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ticketId, eventId, staffId, notes);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInTicketImplCopyWith<_$CheckInTicketImpl> get copyWith =>
      __$$CheckInTicketImplCopyWithImpl<_$CheckInTicketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return checkInTicket(ticketId, eventId, staffId, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return checkInTicket?.call(ticketId, eventId, staffId, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (checkInTicket != null) {
      return checkInTicket(ticketId, eventId, staffId, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return checkInTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return checkInTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (checkInTicket != null) {
      return checkInTicket(this);
    }
    return orElse();
  }
}

abstract class _CheckInTicket implements TicketScannerEvent {
  const factory _CheckInTicket(
      {required final String ticketId,
      required final String eventId,
      required final String staffId,
      final String? notes}) = _$CheckInTicketImpl;

  String get ticketId;
  String get eventId;
  String get staffId;
  String? get notes;

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInTicketImplCopyWith<_$CheckInTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadStatsImplCopyWith<$Res> {
  factory _$$LoadStatsImplCopyWith(
          _$LoadStatsImpl value, $Res Function(_$LoadStatsImpl) then) =
      __$$LoadStatsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String staffId});
}

/// @nodoc
class __$$LoadStatsImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$LoadStatsImpl>
    implements _$$LoadStatsImplCopyWith<$Res> {
  __$$LoadStatsImplCopyWithImpl(
      _$LoadStatsImpl _value, $Res Function(_$LoadStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$LoadStatsImpl(
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

class _$LoadStatsImpl implements _LoadStats {
  const _$LoadStatsImpl({required this.eventId, required this.staffId});

  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'TicketScannerEvent.loadStats(eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStatsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, staffId);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadStatsImplCopyWith<_$LoadStatsImpl> get copyWith =>
      __$$LoadStatsImplCopyWithImpl<_$LoadStatsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return loadStats(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return loadStats?.call(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadStats != null) {
      return loadStats(eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadStats != null) {
      return loadStats(this);
    }
    return orElse();
  }
}

abstract class _LoadStats implements TicketScannerEvent {
  const factory _LoadStats(
      {required final String eventId,
      required final String staffId}) = _$LoadStatsImpl;

  String get eventId;
  String get staffId;

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadStatsImplCopyWith<_$LoadStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadRecentCheckInsImplCopyWith<$Res> {
  factory _$$LoadRecentCheckInsImplCopyWith(_$LoadRecentCheckInsImpl value,
          $Res Function(_$LoadRecentCheckInsImpl) then) =
      __$$LoadRecentCheckInsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String staffId, int limit});
}

/// @nodoc
class __$$LoadRecentCheckInsImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$LoadRecentCheckInsImpl>
    implements _$$LoadRecentCheckInsImplCopyWith<$Res> {
  __$$LoadRecentCheckInsImplCopyWithImpl(_$LoadRecentCheckInsImpl _value,
      $Res Function(_$LoadRecentCheckInsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
    Object? limit = null,
  }) {
    return _then(_$LoadRecentCheckInsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadRecentCheckInsImpl implements _LoadRecentCheckIns {
  const _$LoadRecentCheckInsImpl(
      {required this.eventId, required this.staffId, this.limit = 10});

  @override
  final String eventId;
  @override
  final String staffId;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'TicketScannerEvent.loadRecentCheckIns(eventId: $eventId, staffId: $staffId, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadRecentCheckInsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, staffId, limit);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadRecentCheckInsImplCopyWith<_$LoadRecentCheckInsImpl> get copyWith =>
      __$$LoadRecentCheckInsImplCopyWithImpl<_$LoadRecentCheckInsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return loadRecentCheckIns(eventId, staffId, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return loadRecentCheckIns?.call(eventId, staffId, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadRecentCheckIns != null) {
      return loadRecentCheckIns(eventId, staffId, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadRecentCheckIns(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadRecentCheckIns?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadRecentCheckIns != null) {
      return loadRecentCheckIns(this);
    }
    return orElse();
  }
}

abstract class _LoadRecentCheckIns implements TicketScannerEvent {
  const factory _LoadRecentCheckIns(
      {required final String eventId,
      required final String staffId,
      final int limit}) = _$LoadRecentCheckInsImpl;

  String get eventId;
  String get staffId;
  int get limit;

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadRecentCheckInsImplCopyWith<_$LoadRecentCheckInsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetScannerImplCopyWith<$Res> {
  factory _$$ResetScannerImplCopyWith(
          _$ResetScannerImpl value, $Res Function(_$ResetScannerImpl) then) =
      __$$ResetScannerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetScannerImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$ResetScannerImpl>
    implements _$$ResetScannerImplCopyWith<$Res> {
  __$$ResetScannerImplCopyWithImpl(
      _$ResetScannerImpl _value, $Res Function(_$ResetScannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetScannerImpl implements _ResetScanner {
  const _$ResetScannerImpl();

  @override
  String toString() {
    return 'TicketScannerEvent.resetScanner()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetScannerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return resetScanner();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return resetScanner?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (resetScanner != null) {
      return resetScanner();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return resetScanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return resetScanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (resetScanner != null) {
      return resetScanner(this);
    }
    return orElse();
  }
}

abstract class _ResetScanner implements TicketScannerEvent {
  const factory _ResetScanner() = _$ResetScannerImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$TicketScannerEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'TicketScannerEvent.clearError()';
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
    required TResult Function() started,
    required TResult Function(String qrCode, String eventId, String staffId)
        scanQRCode,
    required TResult Function(String qrCode, String eventId, String staffId)
        validateTicket,
    required TResult Function(
            String ticketId, String eventId, String staffId, String? notes)
        checkInTicket,
    required TResult Function(String eventId, String staffId) loadStats,
    required TResult Function(String eventId, String staffId, int limit)
        loadRecentCheckIns,
    required TResult Function() resetScanner,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String qrCode, String eventId, String staffId)?
        scanQRCode,
    TResult? Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult? Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult? Function(String eventId, String staffId)? loadStats,
    TResult? Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult? Function()? resetScanner,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String qrCode, String eventId, String staffId)? scanQRCode,
    TResult Function(String qrCode, String eventId, String staffId)?
        validateTicket,
    TResult Function(
            String ticketId, String eventId, String staffId, String? notes)?
        checkInTicket,
    TResult Function(String eventId, String staffId)? loadStats,
    TResult Function(String eventId, String staffId, int limit)?
        loadRecentCheckIns,
    TResult Function()? resetScanner,
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
    required TResult Function(_Started value) started,
    required TResult Function(_ScanQRCode value) scanQRCode,
    required TResult Function(_ValidateTicket value) validateTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_LoadStats value) loadStats,
    required TResult Function(_LoadRecentCheckIns value) loadRecentCheckIns,
    required TResult Function(_ResetScanner value) resetScanner,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ScanQRCode value)? scanQRCode,
    TResult? Function(_ValidateTicket value)? validateTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_LoadStats value)? loadStats,
    TResult? Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult? Function(_ResetScanner value)? resetScanner,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ScanQRCode value)? scanQRCode,
    TResult Function(_ValidateTicket value)? validateTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_LoadStats value)? loadStats,
    TResult Function(_LoadRecentCheckIns value)? loadRecentCheckIns,
    TResult Function(_ResetScanner value)? resetScanner,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements TicketScannerEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$TicketScannerState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isScanning => throw _privateConstructorUsedError;
  bool get isValidating => throw _privateConstructorUsedError;
  bool get isCheckingIn => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  TicketValidationResult? get validationResult =>
      throw _privateConstructorUsedError;
  CheckInEntity? get checkInResult => throw _privateConstructorUsedError;
  CheckInStats? get stats => throw _privateConstructorUsedError;
  List<CheckInEntity> get recentCheckIns => throw _privateConstructorUsedError;
  bool get isTicketValidated => throw _privateConstructorUsedError;
  bool get isCheckInSuccessful => throw _privateConstructorUsedError;
  bool get isCheckInFailed => throw _privateConstructorUsedError;
  bool get areStatsLoaded => throw _privateConstructorUsedError;

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketScannerStateCopyWith<TicketScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketScannerStateCopyWith<$Res> {
  factory $TicketScannerStateCopyWith(
          TicketScannerState value, $Res Function(TicketScannerState) then) =
      _$TicketScannerStateCopyWithImpl<$Res, TicketScannerState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isScanning,
      bool isValidating,
      bool isCheckingIn,
      bool hasError,
      String errorMessage,
      TicketValidationResult? validationResult,
      CheckInEntity? checkInResult,
      CheckInStats? stats,
      List<CheckInEntity> recentCheckIns,
      bool isTicketValidated,
      bool isCheckInSuccessful,
      bool isCheckInFailed,
      bool areStatsLoaded});

  $TicketValidationResultCopyWith<$Res>? get validationResult;
  $CheckInEntityCopyWith<$Res>? get checkInResult;
  $CheckInStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$TicketScannerStateCopyWithImpl<$Res, $Val extends TicketScannerState>
    implements $TicketScannerStateCopyWith<$Res> {
  _$TicketScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isScanning = null,
    Object? isValidating = null,
    Object? isCheckingIn = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? validationResult = freezed,
    Object? checkInResult = freezed,
    Object? stats = freezed,
    Object? recentCheckIns = null,
    Object? isTicketValidated = null,
    Object? isCheckInSuccessful = null,
    Object? isCheckInFailed = null,
    Object? areStatsLoaded = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingIn: null == isCheckingIn
          ? _value.isCheckingIn
          : isCheckingIn // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      validationResult: freezed == validationResult
          ? _value.validationResult
          : validationResult // ignore: cast_nullable_to_non_nullable
              as TicketValidationResult?,
      checkInResult: freezed == checkInResult
          ? _value.checkInResult
          : checkInResult // ignore: cast_nullable_to_non_nullable
              as CheckInEntity?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CheckInStats?,
      recentCheckIns: null == recentCheckIns
          ? _value.recentCheckIns
          : recentCheckIns // ignore: cast_nullable_to_non_nullable
              as List<CheckInEntity>,
      isTicketValidated: null == isTicketValidated
          ? _value.isTicketValidated
          : isTicketValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckInSuccessful: null == isCheckInSuccessful
          ? _value.isCheckInSuccessful
          : isCheckInSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckInFailed: null == isCheckInFailed
          ? _value.isCheckInFailed
          : isCheckInFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      areStatsLoaded: null == areStatsLoaded
          ? _value.areStatsLoaded
          : areStatsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketValidationResultCopyWith<$Res>? get validationResult {
    if (_value.validationResult == null) {
      return null;
    }

    return $TicketValidationResultCopyWith<$Res>(_value.validationResult!,
        (value) {
      return _then(_value.copyWith(validationResult: value) as $Val);
    });
  }

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInEntityCopyWith<$Res>? get checkInResult {
    if (_value.checkInResult == null) {
      return null;
    }

    return $CheckInEntityCopyWith<$Res>(_value.checkInResult!, (value) {
      return _then(_value.copyWith(checkInResult: value) as $Val);
    });
  }

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $CheckInStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketScannerStateImplCopyWith<$Res>
    implements $TicketScannerStateCopyWith<$Res> {
  factory _$$TicketScannerStateImplCopyWith(_$TicketScannerStateImpl value,
          $Res Function(_$TicketScannerStateImpl) then) =
      __$$TicketScannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isScanning,
      bool isValidating,
      bool isCheckingIn,
      bool hasError,
      String errorMessage,
      TicketValidationResult? validationResult,
      CheckInEntity? checkInResult,
      CheckInStats? stats,
      List<CheckInEntity> recentCheckIns,
      bool isTicketValidated,
      bool isCheckInSuccessful,
      bool isCheckInFailed,
      bool areStatsLoaded});

  @override
  $TicketValidationResultCopyWith<$Res>? get validationResult;
  @override
  $CheckInEntityCopyWith<$Res>? get checkInResult;
  @override
  $CheckInStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$TicketScannerStateImplCopyWithImpl<$Res>
    extends _$TicketScannerStateCopyWithImpl<$Res, _$TicketScannerStateImpl>
    implements _$$TicketScannerStateImplCopyWith<$Res> {
  __$$TicketScannerStateImplCopyWithImpl(_$TicketScannerStateImpl _value,
      $Res Function(_$TicketScannerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isScanning = null,
    Object? isValidating = null,
    Object? isCheckingIn = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? validationResult = freezed,
    Object? checkInResult = freezed,
    Object? stats = freezed,
    Object? recentCheckIns = null,
    Object? isTicketValidated = null,
    Object? isCheckInSuccessful = null,
    Object? isCheckInFailed = null,
    Object? areStatsLoaded = null,
  }) {
    return _then(_$TicketScannerStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingIn: null == isCheckingIn
          ? _value.isCheckingIn
          : isCheckingIn // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      validationResult: freezed == validationResult
          ? _value.validationResult
          : validationResult // ignore: cast_nullable_to_non_nullable
              as TicketValidationResult?,
      checkInResult: freezed == checkInResult
          ? _value.checkInResult
          : checkInResult // ignore: cast_nullable_to_non_nullable
              as CheckInEntity?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CheckInStats?,
      recentCheckIns: null == recentCheckIns
          ? _value._recentCheckIns
          : recentCheckIns // ignore: cast_nullable_to_non_nullable
              as List<CheckInEntity>,
      isTicketValidated: null == isTicketValidated
          ? _value.isTicketValidated
          : isTicketValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckInSuccessful: null == isCheckInSuccessful
          ? _value.isCheckInSuccessful
          : isCheckInSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckInFailed: null == isCheckInFailed
          ? _value.isCheckInFailed
          : isCheckInFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      areStatsLoaded: null == areStatsLoaded
          ? _value.areStatsLoaded
          : areStatsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TicketScannerStateImpl implements _TicketScannerState {
  const _$TicketScannerStateImpl(
      {this.isLoading = false,
      this.isScanning = false,
      this.isValidating = false,
      this.isCheckingIn = false,
      this.hasError = false,
      this.errorMessage = '',
      this.validationResult,
      this.checkInResult,
      this.stats,
      final List<CheckInEntity> recentCheckIns = const [],
      this.isTicketValidated = false,
      this.isCheckInSuccessful = false,
      this.isCheckInFailed = false,
      this.areStatsLoaded = false})
      : _recentCheckIns = recentCheckIns;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isScanning;
  @override
  @JsonKey()
  final bool isValidating;
  @override
  @JsonKey()
  final bool isCheckingIn;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final TicketValidationResult? validationResult;
  @override
  final CheckInEntity? checkInResult;
  @override
  final CheckInStats? stats;
  final List<CheckInEntity> _recentCheckIns;
  @override
  @JsonKey()
  List<CheckInEntity> get recentCheckIns {
    if (_recentCheckIns is EqualUnmodifiableListView) return _recentCheckIns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentCheckIns);
  }

  @override
  @JsonKey()
  final bool isTicketValidated;
  @override
  @JsonKey()
  final bool isCheckInSuccessful;
  @override
  @JsonKey()
  final bool isCheckInFailed;
  @override
  @JsonKey()
  final bool areStatsLoaded;

  @override
  String toString() {
    return 'TicketScannerState(isLoading: $isLoading, isScanning: $isScanning, isValidating: $isValidating, isCheckingIn: $isCheckingIn, hasError: $hasError, errorMessage: $errorMessage, validationResult: $validationResult, checkInResult: $checkInResult, stats: $stats, recentCheckIns: $recentCheckIns, isTicketValidated: $isTicketValidated, isCheckInSuccessful: $isCheckInSuccessful, isCheckInFailed: $isCheckInFailed, areStatsLoaded: $areStatsLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketScannerStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.isValidating, isValidating) ||
                other.isValidating == isValidating) &&
            (identical(other.isCheckingIn, isCheckingIn) ||
                other.isCheckingIn == isCheckingIn) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.validationResult, validationResult) ||
                other.validationResult == validationResult) &&
            (identical(other.checkInResult, checkInResult) ||
                other.checkInResult == checkInResult) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality()
                .equals(other._recentCheckIns, _recentCheckIns) &&
            (identical(other.isTicketValidated, isTicketValidated) ||
                other.isTicketValidated == isTicketValidated) &&
            (identical(other.isCheckInSuccessful, isCheckInSuccessful) ||
                other.isCheckInSuccessful == isCheckInSuccessful) &&
            (identical(other.isCheckInFailed, isCheckInFailed) ||
                other.isCheckInFailed == isCheckInFailed) &&
            (identical(other.areStatsLoaded, areStatsLoaded) ||
                other.areStatsLoaded == areStatsLoaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isScanning,
      isValidating,
      isCheckingIn,
      hasError,
      errorMessage,
      validationResult,
      checkInResult,
      stats,
      const DeepCollectionEquality().hash(_recentCheckIns),
      isTicketValidated,
      isCheckInSuccessful,
      isCheckInFailed,
      areStatsLoaded);

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketScannerStateImplCopyWith<_$TicketScannerStateImpl> get copyWith =>
      __$$TicketScannerStateImplCopyWithImpl<_$TicketScannerStateImpl>(
          this, _$identity);
}

abstract class _TicketScannerState implements TicketScannerState {
  const factory _TicketScannerState(
      {final bool isLoading,
      final bool isScanning,
      final bool isValidating,
      final bool isCheckingIn,
      final bool hasError,
      final String errorMessage,
      final TicketValidationResult? validationResult,
      final CheckInEntity? checkInResult,
      final CheckInStats? stats,
      final List<CheckInEntity> recentCheckIns,
      final bool isTicketValidated,
      final bool isCheckInSuccessful,
      final bool isCheckInFailed,
      final bool areStatsLoaded}) = _$TicketScannerStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isScanning;
  @override
  bool get isValidating;
  @override
  bool get isCheckingIn;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  TicketValidationResult? get validationResult;
  @override
  CheckInEntity? get checkInResult;
  @override
  CheckInStats? get stats;
  @override
  List<CheckInEntity> get recentCheckIns;
  @override
  bool get isTicketValidated;
  @override
  bool get isCheckInSuccessful;
  @override
  bool get isCheckInFailed;
  @override
  bool get areStatsLoaded;

  /// Create a copy of TicketScannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketScannerStateImplCopyWith<_$TicketScannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
