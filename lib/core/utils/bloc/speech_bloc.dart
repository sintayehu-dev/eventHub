import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

part 'speech_event.dart';
part 'speech_state.dart';
part 'speech_bloc.freezed.dart';

class SpeechBloc extends Bloc<SpeechEvent, SpeechState> {
  SpeechBloc() : super(SpeechState.initial()) {
    on<_StartListening>(_onStartListening);
    on<_StopListening>(_onStopListening);
    on<_SpeechResult>(_onSpeechResult);
    on<_Reset>(_onReset);
    // TTS
    on<_Speak>(_onSpeak);
    on<_StopSpeaking>(_onStopSpeaking);
  }

  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();

  Timer? _maxTimer;
  Timer? _silenceTimer;

  Future<void> _onStartListening(
    _StartListening event,
    Emitter<SpeechState> emit,
  ) async {
    final available = await _speech.initialize();
    if (available) {
      _speech.listen(
        onResult: (result) {
          add(SpeechEvent.speechResult(result.recognizedWords));
        },
      );
      // Start 40s max timer
      _maxTimer?.cancel();
      _maxTimer = Timer(const Duration(seconds: 40), () {
        add(SpeechEvent.stopListening());
      });
      // Start 5s silence timer
      _silenceTimer?.cancel();
      _silenceTimer = Timer(const Duration(seconds: 5), () {
        add(SpeechEvent.stopListening());
      });
      emit(state.copyWith(isListening: true, hasError: false, errorMessage: ''));
    } else {
      emit(state.copyWith(
        isListening: false,
        hasError: true,
        errorMessage: 'Speech recognition not available',
      ));
    }
  }

  Future<void> _onStopListening(
    _StopListening event,
    Emitter<SpeechState> emit,
  ) async {
    await _speech.stop();
    _maxTimer?.cancel();
    _silenceTimer?.cancel();
    emit(state.copyWith(isListening: false));
  }

  void _onSpeechResult(
    _SpeechResult event,
    Emitter<SpeechState> emit,
  ) {
    // Reset silence timer on each new speech result
    _silenceTimer?.cancel();
    _silenceTimer = Timer(const Duration(seconds: 2), () {
      add(SpeechEvent.stopListening());
    });
    emit(state.copyWith(recognizedText: event.text));
  }

  void _onReset(
    _Reset event,
    Emitter<SpeechState> emit,
  ) {
    _maxTimer?.cancel();
    _silenceTimer?.cancel();
    emit(SpeechState.initial());
  }

  Future<void> _onSpeak(_Speak event, Emitter<SpeechState> emit) async {
    emit(state.copyWith(isSpeaking: true));
    await Future.delayed(const Duration(milliseconds: 100));
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.36);
    await _flutterTts.setPitch(0.95);
    await _flutterTts.speak(event.text);
    _flutterTts.setCompletionHandler(() {
      add(const SpeechEvent.stopSpeaking());
    });
  }

  Future<void> _onStopSpeaking(_StopSpeaking event, Emitter<SpeechState> emit) async {
    await _flutterTts.stop();
    emit(state.copyWith(isSpeaking: false));
  }
}
