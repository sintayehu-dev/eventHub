import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EventDetailHeader extends StatelessWidget {
  static double get expandedHeight => 300.h;

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
    final scheme = theme.colorScheme;

    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      backgroundColor: AppColors.primaryDark,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 64.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: _RoundAction(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => context.pop(),
        ),
      ),
      actions: [
        if (event.status.isEditable) ...[
          _RoundAction(icon: Icons.edit_outlined, onTap: onEdit),
          SizedBox(width: 10.w),
        ],
        _RoundAction(icon: Icons.more_horiz_rounded, onTap: onMore),
        SizedBox(width: 20.w),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            event.bannerUrl != null && event.bannerUrl!.isNotEmpty
                ? Image.network(
                    event.bannerUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholder(),
                  )
                : _placeholder(),
            // Darken top and bottom so buttons and the title stay legible.
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.65),
                  ],
                  stops: const [0, 0.4, 1],
                ),
              ),
            ),
            Positioned(
              bottom: 44.h,
              left: 20.w,
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: _statusColor(scheme, event.status),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      event.status.displayName.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      child: Center(
        child: Icon(
          Icons.celebration_rounded,
          size: 72.sp,
          color: AppColors.white.withValues(alpha: 0.3),
        ),
      ),
    );
  }

  Color _statusColor(ColorScheme scheme, EventStatus status) {
    switch (status) {
      case EventStatus.active:
        return AppColors.success;
      case EventStatus.draft:
        return AppColors.accentDark;
      case EventStatus.completed:
        return scheme.primary;
      case EventStatus.cancelled:
        return scheme.error;
    }
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: scheme.surface,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18.sp, color: scheme.onSurface),
        ),
      ),
    );
  }
}
