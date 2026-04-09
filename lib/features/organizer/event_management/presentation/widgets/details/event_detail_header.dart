import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/widgets/shimmer_widget.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventDetailHeader extends StatelessWidget {
  final EventEntity event;
  final VoidCallback onEdit;
  final VoidCallback onMore;

  const EventDetailHeader({
    super.key,
    required this.event,
    required this.onEdit,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverAppBar(
      expandedHeight: 280.h,
      pinned: true,
      backgroundColor: colorScheme.surface,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
      ),
      title: Text(
        'Event Details',
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        if (event.status.isEditable)
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit_outlined, color: colorScheme.onSurface),
          ),
        IconButton(
          onPressed: onMore,
          icon: Icon(Icons.more_vert, color: colorScheme.onSurface),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Event Banner Image or Placeholder
            event.bannerUrl != null && event.bannerUrl!.isNotEmpty
                ? Image.network(
                    event.bannerUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: colorScheme.surface,
                        child: ShimmerWidget(
                          child: Container(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return _buildEventBannerPlaceholder(context);
                    },
                  )
                : _buildEventBannerPlaceholder(context),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    colorScheme.shadow.withValues(alpha: 0.3),
                    colorScheme.shadow.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),

            // Content overlay
            Positioned(
              bottom: 80.h,
              left: 20.w,
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: _getStatusColor(colorScheme, event.status),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      event.status.displayName.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    event.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: colorScheme.onSurfaceVariant,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          event.location,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventBannerPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surface,
            colorScheme.surfaceContainerHighest,
            colorScheme.primary.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.1),
                    colorScheme.tertiary.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: CustomPaint(
                painter: _EventBackgroundPainter(),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  size: 64.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  'No Banner Image',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ColorScheme colorScheme, EventStatus status) {
    switch (status) {
      case EventStatus.active:
        return colorScheme.tertiary;
      case EventStatus.draft:
        return colorScheme.secondary;
      case EventStatus.completed:
        return colorScheme.primary;
      case EventStatus.cancelled:
        return colorScheme.error;
    }
  }
}

class _EventBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
