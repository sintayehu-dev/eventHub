
part of 'analytics_bloc.dart';

@freezed
class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    OrganizerAnalyticsEntity? analytics,
    AnalyticsComparison? comparison,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(AnalyticsPeriod.thisMonth) AnalyticsPeriod selectedPeriod,
    String? organizerId,
  }) = _AnalyticsState;

  factory AnalyticsState.initial() => const AnalyticsState();
}