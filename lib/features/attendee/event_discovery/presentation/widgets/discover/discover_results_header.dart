import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';

class DiscoverResultsHeader extends StatelessWidget {
  const DiscoverResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        
        final eventCount = state.maybeWhen(
          loaded: (events, _, __, ___) => events.length,
          orElse: () => 0,
        );
        
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Row(
            children: [
              Text(
                '$eventCount Results Found',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                   _FilterIconButton(icon: Icons.calendar_today_rounded),
                   SizedBox(width: 12.w),
                   _FilterIconButton(icon: Icons.location_on_rounded),
                   SizedBox(width: 12.w),
                   _FilterIconButton(icon: Icons.tune_rounded),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterIconButton extends StatelessWidget {
  final IconData icon;

  const _FilterIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        color: colorScheme.primary,
        size: 18.sp,
      ),
    );
  }
}
