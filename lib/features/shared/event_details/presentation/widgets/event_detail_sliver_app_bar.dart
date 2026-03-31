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
    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      backgroundColor: const Color(0xFF1A0B2E),
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
      actions: [
        _buildActionButton(Icons.share, () {}),
        _buildActionButton(
          event.isFavorite == true ? Icons.favorite : Icons.favorite_border,
          () {},
          iconColor: event.isFavorite == true ? Colors.red : Colors.white,
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
                        _buildImagePlaceholder(),
                  )
                : _buildImagePlaceholder(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap, {Color iconColor = Colors.white}) {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: iconColor, size: 20.sp),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF334155)],
        ),
      ),
    );
  }
}
