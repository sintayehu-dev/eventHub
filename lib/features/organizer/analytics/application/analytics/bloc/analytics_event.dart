
part of 'analytics_bloc.dart';

@freezed
class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.loadAnalytics({
    required String organizerId,
    required AnalyticsPeriod period,
  }) = _LoadAnalytics;

  const factory AnalyticsEvent.changePeriod({
    required AnalyticsPeriod period,
  }) = _ChangePeriod;

  const factory AnalyticsEvent.refreshAnalytics() = _RefreshAnalytics;

  const factory AnalyticsEvent.clearError() = _ClearError;
}