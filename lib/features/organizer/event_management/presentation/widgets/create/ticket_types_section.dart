import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/form_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/ticket_type_data.dart';

class TicketTypesSection extends StatelessWidget {
  final List<TicketTypeData> ticketTypes;
  final VoidCallback onAddTicketType;
  final Function(int) onRemoveTicketType;

  const TicketTypesSection({
    super.key,
    required this.ticketTypes,
    required this.onAddTicketType,
    required this.onRemoveTicketType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return FormSection(
      title: 'Tickets',
      subtitle: 'Set a price of 0 for a free ticket',
      icon: Icons.confirmation_number_rounded,
      trailing: GestureDetector(
        onTap: onAddTicketType,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: scheme.secondary,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_rounded, size: 16.sp, color: scheme.onSecondary),
              SizedBox(width: 4.w),
              Text(
                'Add',
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: scheme.onSecondary),
              ),
            ],
          ),
        ),
      ),
      child: Column(
        children: [
          for (final entry in ticketTypes.asMap().entries)
            _buildTicketTypeCard(context, entry.key, entry.value),
        ],
      ),
    );
  }

  Widget _buildTicketTypeCard(
      BuildContext context, int index, TicketTypeData ticketType) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      margin:
          EdgeInsets.only(bottom: index == ticketTypes.length - 1 ? 0 : 14.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Ticket ${index + 1}',
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: scheme.primary),
                ),
              ),
              if (ticketTypes.length > 1)
                GestureDetector(
                  onTap: () => onRemoveTicketType(index),
                  child: Icon(Icons.delete_outline_rounded,
                      color: scheme.error, size: 22.sp),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          _field(
            context,
            controller: ticketType.nameController,
            hintText: 'e.g. Early Bird, VIP',
            label: 'Name',
          ),
          SizedBox(height: 12.h),
          _field(
            context,
            controller: ticketType.descriptionController,
            hintText: "What's included?",
            label: 'Description',
            maxLines: 2,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _field(
                  context,
                  controller: ticketType.priceController,
                  hintText: '0',
                  label: 'Price (Birr)',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _field(
                  context,
                  controller: ticketType.quantityController,
                  hintText: '100',
                  label: 'Quantity',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _field(
    BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    required String label,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.labelMedium),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          style: theme.textTheme.bodyMedium,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            // White field on the grey ticket card.
            fillColor: theme.colorScheme.surface,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          ),
        ),
      ],
    );
  }
}
