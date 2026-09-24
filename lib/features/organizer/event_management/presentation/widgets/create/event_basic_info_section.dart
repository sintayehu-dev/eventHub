import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/form_section.dart';

class EventBasicInfoSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String? selectedCategory;
  final List<String> categories;
  final Function(String?) onCategoryChanged;
  final String? categoryError;

  const EventBasicInfoSection({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
    this.categoryError,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return FormSection(
      title: 'Event basics',
      subtitle: 'What is your event about?',
      icon: Icons.edit_note_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldLabel('Event title'),
          TextFormField(
            controller: titleController,
            style: theme.textTheme.bodyLarge,
            textCapitalization: TextCapitalization.sentences,
            decoration:
                const InputDecoration(hintText: 'e.g. Addis Jazz Night'),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Event title is required';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          const FieldLabel('Category'),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              for (final category in categories)
                _CategoryChip(
                  label: category,
                  selected: category == selectedCategory,
                  onTap: () => onCategoryChanged(category),
                ),
            ],
          ),
          if (categoryError != null) ...[
            SizedBox(height: 8.h),
            Text(
              categoryError!,
              style: theme.textTheme.bodySmall?.copyWith(color: scheme.error),
            ),
          ],
          SizedBox(height: 20.h),
          const FieldLabel('Description'),
          TextFormField(
            controller: descriptionController,
            style: theme.textTheme.bodyLarge,
            maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: 'Tell people what to expect',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Event description is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: selected ? scheme.primary : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: selected ? scheme.onPrimary : scheme.onSurface,
          ),
        ),
      ),
    );
  }
}
