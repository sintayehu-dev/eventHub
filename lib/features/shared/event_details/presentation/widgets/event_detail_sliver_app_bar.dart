import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

class EventDetailSliverAppBar extends StatelessWidget {
  final EventDiscoveryEntity event;

  const EventDetailSliverAppBar({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      expandedHeight: 320.h,
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
        _RoundAction(icon: Icons.share_outlined, onTap: () {}),
        SizedBox(width: 10.w),
        _RoundAction(
          icon: event.isFavorite == true
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          iconColor: event.isFavorite == true ? scheme.error : null,
          onTap: () {},
        ),
        SizedBox(width: 20.w),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            event.bannerUrl != null
                ? Image.network(
                    event.bannerUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildImagePlaceholder(),
                  )
                : _buildImagePlaceholder(),
            // Darken the top so the round buttons stay legible on any image.
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      child: Center(
        child: Icon(
          Icons.celebration_rounded,
          size: 72.sp,
          color: AppColors.white.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

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
          child: Icon(
            icon,
            size: 18.sp,
            color: iconColor ?? scheme.onSurface,
          ),
        ),
      ),
    );
  }
}
