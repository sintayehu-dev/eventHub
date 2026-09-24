import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart';

class DiscoverResultsHeader extends StatelessWidget {
  const DiscoverResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDiscoveryBloc, EventDiscoveryState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final count = state.events.length;
        final loading = state.isLoading || state.isLoadingDetails;

        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 14.h),
          child: Row(
            children: [
              if (loading)
                ShimmerText(width: 90.w, height: 22.h)
              else
                Text(
                  count == 1 ? '1 event' : '$count events',
                  style: theme.textTheme.titleLarge,
                ),
            ],
          ),
        );
      },
    );
  }
}
