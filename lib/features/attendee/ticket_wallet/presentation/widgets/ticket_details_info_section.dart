import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketDetailsInfoSection extends StatelessWidget {
  final String title;
  final List<TicketDetailRowData> details;
  final Widget? topWidget;

  const TicketDetailsInfoSection({
    super.key,
    required this.title,
    required this.details,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          if (topWidget != null) ...[
            SizedBox(height: 16.h),
            topWidget!,
          ],
          SizedBox(height: 12.h),
          ...details.map((detail) => _buildDetailRow(context, detail)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, TicketDetailRowData detail) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              detail.label,
              style: theme.textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: Text(
              detail.value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketDetailRowData {
  final String label;
  final String value;

  TicketDetailRowData(this.label, this.value);
}
