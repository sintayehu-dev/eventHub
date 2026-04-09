import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

class EventDetailSliverAppBar extends StatelessWidget {
  final EventDiscoveryEntity event;

  const EventDetailSliverAppBar({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      backgroundColor: colorScheme.surface,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.arrow_back,
            color: colorScheme.onSurface,
            size: 20.sp,
          ),
        ),
      ),
      actions: [
        _buildActionButton(context, Icons.share, () {}),
        _buildActionButton(
          context,
          event.isFavorite == true ? Icons.favorite : Icons.favorite_border,
          () {},
          iconColor: event.isFavorite == true
              ? colorScheme.error
              : colorScheme.onSurface,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            event.bannerUrl != null
                ? Image.network(
                    event.bannerUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildImagePlaceholder(context),
                  )
                : _buildImagePlaceholder(context),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    colorScheme.surface.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, IconData icon, VoidCallback onTap,
      {Color? iconColor}) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: iconColor ?? colorScheme.onSurface,
          size: 20.sp,
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surfaceContainerLowest,
            colorScheme.surfaceContainer,
            colorScheme.surfaceContainerHigh,
          ],
        ),
      ),
    );
  }
}
