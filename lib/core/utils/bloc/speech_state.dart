part of 'speech_bloc.dart';

@freezed
class SpeechState with _$SpeechState {
  const factory SpeechState({
    required bool isListening,
    required String recognizedText,
    required bool hasError,
    required String errorMessage,
    required bool isSpeaking,
  }) = _SpeechState;

  factory SpeechState.initial() => const SpeechState(
        isListening: false,
        recognizedText: '',
        hasError: false,
        errorMessage: '',
        isSpeaking: false,
      );
}
