import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/form_section.dart';

class EventLocationDateTimeSection extends StatelessWidget {
  final TextEditingController locationController;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;
  final String? dateTimeError;

  const EventLocationDateTimeSection({
    super.key,
    required this.locationController,
    required this.selectedDate,
    required this.selectedTime,
    required this.onSelectDate,
    required this.onSelectTime,
    this.dateTimeError,
  });

  static const _months = [
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
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormSection(
      title: 'When & where',
      subtitle: 'Date, time and venue',
      icon: Icons.place_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldLabel('Venue'),
          TextFormField(
            controller: locationController,
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Venue or address',
              prefixIcon: Icon(Icons.location_on_outlined, size: 20.sp),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Event location is required';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          const FieldLabel('Date & time'),
          Row(
            children: [
              Expanded(
                child: _PickerTile(
                  icon: Icons.calendar_today_rounded,
                  placeholder: 'Select date',
                  value: selectedDate == null
                      ? null
                      : '${_months[selectedDate!.month - 1]} ${selectedDate!.day}, ${selectedDate!.year}',
                  onTap: onSelectDate,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _PickerTile(
                  icon: Icons.schedule_rounded,
                  placeholder: 'Select time',
                  value: selectedTime?.format(context),
                  onTap: onSelectTime,
                ),
              ),
            ],
          ),
          if (dateTimeError != null) ...[
            SizedBox(height: 8.h),
            Text(
              dateTimeError!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PickerTile extends StatelessWidget {
  const _PickerTile({
    required this.icon,
    required this.placeholder,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String placeholder;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final filled = value != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: filled
              ? scheme.secondaryContainer
              : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 18.sp,
                color: filled ? scheme.primary : scheme.onSurfaceVariant),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                value ?? placeholder,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: filled ? scheme.onSurface : scheme.onSurfaceVariant,
                  fontWeight: filled ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
