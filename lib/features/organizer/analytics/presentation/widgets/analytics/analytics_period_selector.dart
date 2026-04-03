import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/organizer_analytics_entity.dart';

class AnalyticsPeriodSelector extends StatelessWidget {
  const AnalyticsPeriodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) {
        final selectedPeriod = state.selectedPeriod;

        return Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: AnalyticsPeriod.values.take(3).map((period) {
              final isSelected = selectedPeriod == period;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<AnalyticsBloc>().add(
                          AnalyticsEvent.changePeriod(period: period),
                        );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? colorScheme.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      period.displayName,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: isSelected
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
