part of 'speech_bloc.dart';

@freezed
class SpeechEvent with _$SpeechEvent {
  const factory SpeechEvent.startListening() = _StartListening;
  const factory SpeechEvent.stopListening() = _StopListening;
  const factory SpeechEvent.speechResult(String text) = _SpeechResult;
  const factory SpeechEvent.reset() = _Reset;
  const factory SpeechEvent.speak(String text) = _Speak;
  const factory SpeechEvent.stopSpeaking() = _StopSpeaking;
}
