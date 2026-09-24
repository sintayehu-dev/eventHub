import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/motion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

/// Ticket-stub card: event summary on top, a perforated tear line, then the
/// ticket type, price and the QR action.
class AttendeeTicketCard extends StatelessWidget {
  final TicketEntity ticket;
  final VoidCallback onTap;
  final VoidCallback onShowQR;

  const AttendeeTicketCard({
    super.key,
    required this.ticket,
    required this.onTap,
    required this.onShowQR,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final canShowQr = ticket.isActive && ticket.isUpcoming;
    final notch = 11.w;

    return Pressable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: scheme.shadow.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.r),
                    child: SizedBox(
                      width: 84.w,
                      height: 84.w,
                      child: _banner(scheme),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StatusPill(status: ticket.status),
                        SizedBox(height: 8.h),
                        Text(
                          ticket.eventTitle,
                          style: theme.textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6.h),
                        _InfoRow(
                          icon: Icons.schedule_rounded,
                          text: _formatDateTime(ticket.eventDateTime),
                        ),
                        SizedBox(height: 2.h),
                        _InfoRow(
                          icon: Icons.location_on_rounded,
                          text: ticket.eventLocation,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Tear line with side notches that cut into the canvas colour.
            SizedBox(
              height: notch * 2,
              child: Row(
                children: [
                  _Notch(size: notch, left: false),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, box) {
                        final count = (box.maxWidth / 10).floor();
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            count,
                            (_) => Container(
                              width: 5,
                              height: 1.5,
                              color: scheme.outlineVariant,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _Notch(size: notch, left: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 18.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ticket.ticketTypeName,
                            style: theme.textTheme.titleSmall),
                        SizedBox(height: 2.h),
                        Text(
                          ticket.ticketPrice == 0
                              ? 'Free'
                              : '${ticket.ticketPrice.toStringAsFixed(2)} Birr',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (canShowQr)
                    GestureDetector(
                      onTap: onShowQR,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: scheme.secondary,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.qr_code_2_rounded,
                                size: 18.sp, color: scheme.onSecondary),
                            SizedBox(width: 8.w),
                            Text(
                              'Show QR',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: scheme.onSecondary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _banner(ColorScheme scheme) {
    final url = ticket.eventBannerUrl;
    if (url != null && url.isNotEmpty) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _fallback(scheme),
        loadingBuilder: (_, child, progress) =>
            progress == null ? child : _fallback(scheme),
      );
    }
    return _fallback(scheme);
  }

  Widget _fallback(ColorScheme scheme) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.heroGradient),
      child: Icon(Icons.celebration_rounded,
          size: 30.sp, color: AppColors.white.withValues(alpha: 0.8)),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final time =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    return '${months[dateTime.month - 1]} ${dateTime.day} • $time';
  }
}

class _Notch extends StatelessWidget {
  const _Notch({required this.size, required this.left});

  final double size;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 2,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.horizontal(
          left: left ? Radius.circular(size) : Radius.zero,
          right: left ? Radius.zero : Radius.circular(size),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: theme.colorScheme.onSurfaceVariant),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final TicketStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (bg, fg) = switch (status) {
      TicketStatus.confirmed => (AppColors.mint, AppColors.success),
      TicketStatus.pending => (AppColors.peach, AppColors.accentDark),
      TicketStatus.used => (AppColors.sky, AppColors.primary),
      TicketStatus.cancelled || TicketStatus.refunded => (
          const Color(0xFFFCE4E4),
          AppColors.error
        ),
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        status.displayName,
        style: theme.textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
