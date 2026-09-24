import 'package:flutter/material.dart';
import 'package:eventhub/core/presentation/widgets/form_section.dart';

class EventCapacitySection extends StatelessWidget {
  final TextEditingController capacityController;

  const EventCapacitySection({
    super.key,
    required this.capacityController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormSection(
      title: 'Capacity',
      subtitle: 'The venue limit across all ticket types',
      icon: Icons.people_alt_rounded,
      child: TextFormField(
        controller: capacityController,
        style: theme.textTheme.bodyLarge,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Maximum number of attendees',
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Event capacity is required';
          }
          final capacity = int.tryParse(value);
          if (capacity == null || capacity <= 0) {
            return 'Please enter a valid capacity';
          }
          return null;
        },
      ),
    );
  }
}
