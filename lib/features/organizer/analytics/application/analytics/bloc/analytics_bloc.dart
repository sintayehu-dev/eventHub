import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/features/organizer/analytics/domain/repositories/analytics_repository.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

@injectable
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository _analyticsRepository;
  
  String? _currentOrganizerId;
  AnalyticsPeriod _currentPeriod = AnalyticsPeriod.thisMonth;

  AnalyticsBloc(this._analyticsRepository) : super(const AnalyticsState.initial()) {
    on<_LoadAnalytics>(_onLoadAnalytics);
    on<_ChangePeriod>(_onChangePeriod);
    on<_RefreshAnalytics>(_onRefreshAnalytics);
  }

  Future<void> _onLoadAnalytics(
    _LoadAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    emit(const AnalyticsState.loading());
    
    _currentOrganizerId = event.organizerId;
    _currentPeriod = event.period;

    final result = await _analyticsRepository.getOrganizerAnalytics(
      organizerId: event.organizerId,
      period: event.period,
    );

    await result.fold(
      (failure) async {
        emit(AnalyticsState.error(message: failure.toString()));
      },
      (analytics) async {
        // Try to get comparison with previous period
        final previousPeriod = _getPreviousPeriod(event.period);
        if (previousPeriod != null) {
          final comparisonResult = await _analyticsRepository.getAnalyticsComparison(
            organizerId: event.organizerId,
            currentPeriod: event.period,
            previousPeriod: previousPeriod,
          );
          
          comparisonResult.fold(
            (failure) => emit(AnalyticsState.loaded(analytics: analytics)),
            (comparison) => emit(AnalyticsState.loaded(
              analytics: analytics,
              comparison: comparison,
            )),
          );
        } else {
          emit(AnalyticsState.loaded(analytics: analytics));
        }
      },
    );
  }

  Future<void> _onChangePeriod(
    _ChangePeriod event,
    Emitter<AnalyticsState> emit,
  ) async {
    if (_currentOrganizerId != null) {
      add(AnalyticsEvent.loadAnalytics(
        organizerId: _currentOrganizerId!,
        period: event.period,
      ));
    }
  }

  Future<void> _onRefreshAnalytics(
    _RefreshAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    if (_currentOrganizerId != null) {
      add(AnalyticsEvent.loadAnalytics(
        organizerId: _currentOrganizerId!,
        period: _currentPeriod,
      ));
    }
  }

  AnalyticsPeriod? _getPreviousPeriod(AnalyticsPeriod current) {
    switch (current) {
      case AnalyticsPeriod.thisMonth:
        return AnalyticsPeriod.lastMonth;
      case AnalyticsPeriod.lastMonth:
        return null; // Could implement "2 months ago" if needed
      case AnalyticsPeriod.last3Months:
        return null; // Could implement "previous 3 months" if needed
      case AnalyticsPeriod.last6Months:
        return null;
      case AnalyticsPeriod.thisYear:
        return null; // Could implement "last year" if needed
    }
  }
}