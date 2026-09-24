import 'package:flutter/material.dart';

class TicketWalletHeader extends StatelessWidget {
  final String title;
  final Widget? action;

  const TicketWalletHeader({
    super.key,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(title, style: theme.textTheme.titleMedium),
        ),
        if (action != null) action!,
      ],
    );
  }
}
