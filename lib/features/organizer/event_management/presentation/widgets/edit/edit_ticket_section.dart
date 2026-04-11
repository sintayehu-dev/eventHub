import 'package:flutter/material.dart';
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
        _buildSectionTitle('Ticket Type'),
        SizedBox(height: 8.h),
        _buildTicketTypeSelector(),
        SizedBox(height: 16.h),
        if (selectedTicketType == 'Paid') ...[
          _buildTextField(
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
                  color: Colors.orange[400],
                  fontSize: 11.sp,
                ),
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTicketTypeSelector() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: canEditType ? const Color(0xFF2A1B3D) : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: canEditType ? Colors.grey[700]! : Colors.grey[800]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeOption('Free'),
          ),
          Expanded(
            child: _buildTypeOption('Paid'),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption(String type) {
    final isSelected = selectedTicketType == type;
    return GestureDetector(
      onTap: canEditType ? () => onTypeChanged(type) : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : (canEditType ? Colors.grey[400] : Colors.grey[600]),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTextField({
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
        color: enabled ? Colors.white : Colors.grey[500],
      ),
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: enabled ? const Color(0xFF2A1B3D) : const Color(0xFF1A1A1A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey[700]!, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFF8B5CF6), width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
    );
  }
}
