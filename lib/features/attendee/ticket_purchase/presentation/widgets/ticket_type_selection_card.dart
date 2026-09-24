import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';

class TicketTypeSelectionCard extends StatelessWidget {
  final TicketTypeInfo ticketType;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const TicketTypeSelectionCard({
    super.key,
    required this.ticketType,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isAvailable = ticketType.isAvailable;
    final selected = quantity > 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: selected ? scheme.secondary : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ticketType.name, style: theme.textTheme.titleMedium),
                    if (ticketType.description.isNotEmpty) ...[
                      SizedBox(height: 4.h),
                      Text(ticketType.description,
                          style: theme.textTheme.bodySmall),
                    ],
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                ticketType.price == 0
                    ? 'Free'
                    : '${ticketType.price.toStringAsFixed(0)} Birr',
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: scheme.primary),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isAvailable ? AppColors.mint : const Color(0xFFFCE4E4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  isAvailable
                      ? '${ticketType.availableQuantity} available'
                      : 'Sold out',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isAvailable ? AppColors.success : scheme.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (isAvailable) _buildQuantitySelector(scheme, theme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(ColorScheme scheme, ThemeData theme) {
    final canAdd = quantity < ticketType.availableQuantity;
    final canRemove = quantity > 0;

    Widget stepper(IconData icon, bool enabled, VoidCallback onTap,
        {required bool filled}) {
      return GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled && enabled
                ? scheme.secondary
                : scheme.surfaceContainerHighest,
          ),
          child: Icon(
            icon,
            size: 18.sp,
            color: enabled
                ? (filled ? scheme.onSecondary : scheme.onSurface)
                : scheme.onSurface.withValues(alpha: 0.3),
          ),
        ),
      );
    }

    return Row(
      children: [
        stepper(Icons.remove_rounded, canRemove,
            () => onQuantityChanged(quantity - 1),
            filled: false),
        SizedBox(
          width: 40.w,
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
        stepper(
            Icons.add_rounded, canAdd, () => onQuantityChanged(quantity + 1),
            filled: true),
      ],
    );
  }
}
