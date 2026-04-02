import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/organizer/analytics/domain/repositories/analytics_repository.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

@injectable
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository _analyticsRepository;

  AnalyticsBloc(this._analyticsRepository) : super(AnalyticsState.initial()) {
    on<_LoadAnalytics>(_onLoadAnalytics);
    on<_ChangePeriod>(_onChangePeriod);
    on<_RefreshAnalytics>(_onRefreshAnalytics);
    on<_ClearError>(_onClearError);
  }

  Future<void> _onLoadAnalytics(
    _LoadAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      selectedPeriod: event.period,
      organizerId: event.organizerId,
    ));

    final result = await _analyticsRepository.getOrganizerAnalytics(
      organizerId: event.organizerId,
      period: event.period,
    );

    await result.fold(
      (failure) async {
        emit(state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: NetworkExceptions.getRawErrorMessage(failure),
        ));
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
            (failure) => emit(state.copyWith(
              isLoading: false,
              hasError: false,
              errorMessage: '',
              analytics: analytics,
            )),
            (comparison) => emit(state.copyWith(
              isLoading: false,
              hasError: false,
              errorMessage: '',
              analytics: analytics,
              comparison: comparison,
            )),
          );
        } else {
          emit(state.copyWith(
            isLoading: false,
            hasError: false,
            errorMessage: '',
            analytics: analytics,
          ));
        }
      },
    );
  }

  Future<void> _onChangePeriod(
    _ChangePeriod event,
    Emitter<AnalyticsState> emit,
  ) async {
    if (state.organizerId != null) {
      add(AnalyticsEvent.loadAnalytics(
        organizerId: state.organizerId!,
        period: event.period,
      ));
    }
  }

  Future<void> _onRefreshAnalytics(
    _RefreshAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    if (state.organizerId != null) {
      add(AnalyticsEvent.loadAnalytics(
        organizerId: state.organizerId!,
        period: state.selectedPeriod,
      ));
    }
  }

  void _onClearError(
    _ClearError event,
    Emitter<AnalyticsState> emit,
  ) {
    emit(state.copyWith(hasError: false, errorMessage: ''));
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