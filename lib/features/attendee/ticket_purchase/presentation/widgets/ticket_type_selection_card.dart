import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final colorScheme = theme.colorScheme;
    final isAvailable = ticketType.isAvailable;
    
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      color: colorScheme.primaryContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticketType.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (ticketType.description.isNotEmpty) ...[
                        SizedBox(height: 4.h),
                        Text(
                          ticketType.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Text(
                  ticketType.price == 0
                      ? 'Free'
                      : '\$${ticketType.price.toStringAsFixed(0)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isAvailable
                      ? '${ticketType.availableQuantity} available'
                      : 'Sold out',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isAvailable ? Colors.green : colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isAvailable)
                  _buildQuantitySelector(colorScheme, theme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(ColorScheme colorScheme, ThemeData theme) {
    return Row(
      children: [
        IconButton(
          onPressed: quantity > 0
              ? () => onQuantityChanged(quantity - 1)
              : null,
          icon: Icon(
            Icons.remove_circle,
            color: quantity > 0
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.3),
            size: 28.sp,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Container(
          width: 40.w,
          alignment: Alignment.center,
          child: Text(
            quantity.toString(),
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: quantity < ticketType.availableQuantity
              ? () => onQuantityChanged(quantity + 1)
              : null,
          icon: Icon(
            Icons.add_circle,
            color: quantity < ticketType.availableQuantity
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.3),
            size: 28.sp,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
