// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speech_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpeechEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechEventCopyWith<$Res> {
  factory $SpeechEventCopyWith(
          SpeechEvent value, $Res Function(SpeechEvent) then) =
      _$SpeechEventCopyWithImpl<$Res, SpeechEvent>;
}

/// @nodoc
class _$SpeechEventCopyWithImpl<$Res, $Val extends SpeechEvent>
    implements $SpeechEventCopyWith<$Res> {
  _$SpeechEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartListeningImplCopyWith<$Res> {
  factory _$$StartListeningImplCopyWith(_$StartListeningImpl value,
          $Res Function(_$StartListeningImpl) then) =
      __$$StartListeningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartListeningImplCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res, _$StartListeningImpl>
    implements _$$StartListeningImplCopyWith<$Res> {
  __$$StartListeningImplCopyWithImpl(
      _$StartListeningImpl _value, $Res Function(_$StartListeningImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartListeningImpl implements _StartListening {
  const _$StartListeningImpl();

  @override
  String toString() {
    return 'SpeechEvent.startListening()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartListeningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) {
    return startListening();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) {
    return startListening?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) {
    if (startListening != null) {
      return startListening();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) {
    return startListening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) {
    return startListening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) {
    if (startListening != null) {
      return startListening(this);
    }
    return orElse();
  }
}

abstract class _StartListening implements SpeechEvent {
  const factory _StartListening() = _$StartListeningImpl;
}

/// @nodoc
abstract class _$$StopListeningImplCopyWith<$Res> {
  factory _$$StopListeningImplCopyWith(
          _$StopListeningImpl value, $Res Function(_$StopListeningImpl) then) =
      __$$StopListeningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopListeningImplCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res, _$StopListeningImpl>
    implements _$$StopListeningImplCopyWith<$Res> {
  __$$StopListeningImplCopyWithImpl(
      _$StopListeningImpl _value, $Res Function(_$StopListeningImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopListeningImpl implements _StopListening {
  const _$StopListeningImpl();

  @override
  String toString() {
    return 'SpeechEvent.stopListening()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopListeningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) {
    return stopListening();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) {
    return stopListening?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) {
    if (stopListening != null) {
      return stopListening();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) {
    return stopListening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) {
    return stopListening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) {
    if (stopListening != null) {
      return stopListening(this);
    }
    return orElse();
  }
}

abstract class _StopListening implements SpeechEvent {
  const factory _StopListening() = _$StopListeningImpl;
}

/// @nodoc
abstract class _$$SpeechResultImplCopyWith<$Res> {
  factory _$$SpeechResultImplCopyWith(
          _$SpeechResultImpl value, $Res Function(_$SpeechResultImpl) then) =
      __$$SpeechResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SpeechResultImplCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res, _$SpeechResultImpl>
    implements _$$SpeechResultImplCopyWith<$Res> {
  __$$SpeechResultImplCopyWithImpl(
      _$SpeechResultImpl _value, $Res Function(_$SpeechResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SpeechResultImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeechResultImpl implements _SpeechResult {
  const _$SpeechResultImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SpeechEvent.speechResult(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechResultImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechResultImplCopyWith<_$SpeechResultImpl> get copyWith =>
      __$$SpeechResultImplCopyWithImpl<_$SpeechResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) {
    return speechResult(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) {
    return speechResult?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) {
    if (speechResult != null) {
      return speechResult(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) {
    return speechResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) {
    return speechResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) {
    if (speechResult != null) {
      return speechResult(this);
    }
    return orElse();
  }
}

abstract class _SpeechResult implements SpeechEvent {
  const factory _SpeechResult(final String text) = _$SpeechResultImpl;

  String get text;

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechResultImplCopyWith<_$SpeechResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'SpeechEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements SpeechEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$SpeakImplCopyWith<$Res> {
  factory _$$SpeakImplCopyWith(
          _$SpeakImpl value, $Res Function(_$SpeakImpl) then) =
      __$$SpeakImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SpeakImplCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res, _$SpeakImpl>
    implements _$$SpeakImplCopyWith<$Res> {
  __$$SpeakImplCopyWithImpl(
      _$SpeakImpl _value, $Res Function(_$SpeakImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SpeakImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeakImpl implements _Speak {
  const _$SpeakImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SpeechEvent.speak(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeakImplCopyWith<_$SpeakImpl> get copyWith =>
      __$$SpeakImplCopyWithImpl<_$SpeakImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) {
    return speak(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) {
    return speak?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) {
    if (speak != null) {
      return speak(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) {
    return speak(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) {
    return speak?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) {
    if (speak != null) {
      return speak(this);
    }
    return orElse();
  }
}

abstract class _Speak implements SpeechEvent {
  const factory _Speak(final String text) = _$SpeakImpl;

  String get text;

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeakImplCopyWith<_$SpeakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopSpeakingImplCopyWith<$Res> {
  factory _$$StopSpeakingImplCopyWith(
          _$StopSpeakingImpl value, $Res Function(_$StopSpeakingImpl) then) =
      __$$StopSpeakingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopSpeakingImplCopyWithImpl<$Res>
    extends _$SpeechEventCopyWithImpl<$Res, _$StopSpeakingImpl>
    implements _$$StopSpeakingImplCopyWith<$Res> {
  __$$StopSpeakingImplCopyWithImpl(
      _$StopSpeakingImpl _value, $Res Function(_$StopSpeakingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopSpeakingImpl implements _StopSpeaking {
  const _$StopSpeakingImpl();

  @override
  String toString() {
    return 'SpeechEvent.stopSpeaking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopSpeakingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function() stopListening,
    required TResult Function(String text) speechResult,
    required TResult Function() reset,
    required TResult Function(String text) speak,
    required TResult Function() stopSpeaking,
  }) {
    return stopSpeaking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function()? stopListening,
    TResult? Function(String text)? speechResult,
    TResult? Function()? reset,
    TResult? Function(String text)? speak,
    TResult? Function()? stopSpeaking,
  }) {
    return stopSpeaking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function()? stopListening,
    TResult Function(String text)? speechResult,
    TResult Function()? reset,
    TResult Function(String text)? speak,
    TResult Function()? stopSpeaking,
    required TResult orElse(),
  }) {
    if (stopSpeaking != null) {
      return stopSpeaking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_StopListening value) stopListening,
    required TResult Function(_SpeechResult value) speechResult,
    required TResult Function(_Reset value) reset,
    required TResult Function(_Speak value) speak,
    required TResult Function(_StopSpeaking value) stopSpeaking,
  }) {
    return stopSpeaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_StopListening value)? stopListening,
    TResult? Function(_SpeechResult value)? speechResult,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_Speak value)? speak,
    TResult? Function(_StopSpeaking value)? stopSpeaking,
  }) {
    return stopSpeaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_StopListening value)? stopListening,
    TResult Function(_SpeechResult value)? speechResult,
    TResult Function(_Reset value)? reset,
    TResult Function(_Speak value)? speak,
    TResult Function(_StopSpeaking value)? stopSpeaking,
    required TResult orElse(),
  }) {
    if (stopSpeaking != null) {
      return stopSpeaking(this);
    }
    return orElse();
  }
}

abstract class _StopSpeaking implements SpeechEvent {
  const factory _StopSpeaking() = _$StopSpeakingImpl;
}

/// @nodoc
mixin _$SpeechState {
  bool get isListening => throw _privateConstructorUsedError;
  String get recognizedText => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isSpeaking => throw _privateConstructorUsedError;

  /// Create a copy of SpeechState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeechStateCopyWith<SpeechState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechStateCopyWith<$Res> {
  factory $SpeechStateCopyWith(
          SpeechState value, $Res Function(SpeechState) then) =
      _$SpeechStateCopyWithImpl<$Res, SpeechState>;
  @useResult
  $Res call(
      {bool isListening,
      String recognizedText,
      bool hasError,
      String errorMessage,
      bool isSpeaking});
}

/// @nodoc
class _$SpeechStateCopyWithImpl<$Res, $Val extends SpeechState>
    implements $SpeechStateCopyWith<$Res> {
  _$SpeechStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeechState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isListening = null,
    Object? recognizedText = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? isSpeaking = null,
  }) {
    return _then(_value.copyWith(
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isSpeaking: null == isSpeaking
          ? _value.isSpeaking
          : isSpeaking // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeechStateImplCopyWith<$Res>
    implements $SpeechStateCopyWith<$Res> {
  factory _$$SpeechStateImplCopyWith(
          _$SpeechStateImpl value, $Res Function(_$SpeechStateImpl) then) =
      __$$SpeechStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isListening,
      String recognizedText,
      bool hasError,
      String errorMessage,
      bool isSpeaking});
}

/// @nodoc
class __$$SpeechStateImplCopyWithImpl<$Res>
    extends _$SpeechStateCopyWithImpl<$Res, _$SpeechStateImpl>
    implements _$$SpeechStateImplCopyWith<$Res> {
  __$$SpeechStateImplCopyWithImpl(
      _$SpeechStateImpl _value, $Res Function(_$SpeechStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isListening = null,
    Object? recognizedText = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? isSpeaking = null,
  }) {
    return _then(_$SpeechStateImpl(
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
      recognizedText: null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isSpeaking: null == isSpeaking
          ? _value.isSpeaking
          : isSpeaking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SpeechStateImpl implements _SpeechState {
  const _$SpeechStateImpl(
      {required this.isListening,
      required this.recognizedText,
      required this.hasError,
      required this.errorMessage,
      required this.isSpeaking});

  @override
  final bool isListening;
  @override
  final String recognizedText;
  @override
  final bool hasError;
  @override
  final String errorMessage;
  @override
  final bool isSpeaking;

  @override
  String toString() {
    return 'SpeechState(isListening: $isListening, recognizedText: $recognizedText, hasError: $hasError, errorMessage: $errorMessage, isSpeaking: $isSpeaking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechStateImpl &&
            (identical(other.isListening, isListening) ||
                other.isListening == isListening) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSpeaking, isSpeaking) ||
                other.isSpeaking == isSpeaking));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isListening, recognizedText,
      hasError, errorMessage, isSpeaking);

  /// Create a copy of SpeechState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechStateImplCopyWith<_$SpeechStateImpl> get copyWith =>
      __$$SpeechStateImplCopyWithImpl<_$SpeechStateImpl>(this, _$identity);
}

abstract class _SpeechState implements SpeechState {
  const factory _SpeechState(
      {required final bool isListening,
      required final String recognizedText,
      required final bool hasError,
      required final String errorMessage,
      required final bool isSpeaking}) = _$SpeechStateImpl;

  @override
  bool get isListening;
  @override
  String get recognizedText;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  bool get isSpeaking;

  /// Create a copy of SpeechState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechStateImplCopyWith<_$SpeechStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
