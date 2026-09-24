import 'package:flutter/material.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTicketSection extends StatelessWidget {
  final String selectedTicketType;
  final TextEditingController priceController;
  final bool canEditType;
  final bool canEditPrice;
  final Function(String) onTypeChanged;

  const EditTicketSection({
    super.key,
    required this.selectedTicketType,
    required this.priceController,
    required this.canEditType,
    required this.canEditPrice,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Ticket Type'),
        SizedBox(height: 8.h),
        _buildTicketTypeSelector(context),
        SizedBox(height: 16.h),
        if (selectedTicketType == 'Paid') ...[
          _buildTextField(context, 
            controller: priceController,
            hintText: 'Ticket price (Birr)',
            keyboardType: TextInputType.number,
            enabled: canEditPrice,
            validator: (value) {
              if (selectedTicketType == 'Paid' &&
                  (value == null || value.trim().isEmpty)) {
                return 'Ticket price is required';
              }
              return null;
            },
          ),
          if (!canEditPrice)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                'Price cannot be changed after tickets are sold',
                style: TextStyle(
                  color: AppColors.accentDark,
                  fontSize: 11.sp,
                ),
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTicketTypeSelector(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: canEditType ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: canEditType ? Theme.of(context).colorScheme.outlineVariant : Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeOption(context, 'Free'),
          ),
          Expanded(
            child: _buildTypeOption(context, 'Paid'),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption(BuildContext context, String type) {
    final isSelected = selectedTicketType == type;
    return GestureDetector(
      onTap: canEditType ? () => onTypeChanged(type) : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.onSurface
                : (canEditType ? Theme.of(context).colorScheme.onSurfaceVariant : Theme.of(context).colorScheme.outlineVariant),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    bool enabled = true,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      style: TextStyle(
        color: enabled ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        filled: true,
        fillColor: enabled ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }
}
