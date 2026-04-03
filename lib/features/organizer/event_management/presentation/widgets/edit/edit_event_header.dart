import 'package:flutter/material.dart';

class EditEventHeader extends StatelessWidget {
  final bool hasChanges;
  final VoidCallback onBack;
  final VoidCallback onSave;

  const EditEventHeader({
    super.key,
    required this.hasChanges,
    required this.onBack,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
      ),
      title: Text(
        'Edit Event',
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (hasChanges)
          TextButton(
            onPressed: onSave,
            child: Text(
              'Save',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
