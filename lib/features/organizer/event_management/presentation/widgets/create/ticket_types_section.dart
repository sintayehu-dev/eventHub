import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Ticket Types'),
            TextButton.icon(
              onPressed: onAddTicketType,
              icon: Icon(Icons.add, size: 18.sp, color: const Color(0xFF8B5CF6)),
              label: Text(
                'Add Type',
                style: TextStyle(
                  color: const Color(0xFF8B5CF6),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        ...ticketTypes.asMap().entries.map((entry) {
          final index = entry.key;
          final ticketType = entry.value;
          return _buildTicketTypeCard(context, index, ticketType);
        }),
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

  Widget _buildTicketTypeCard(
      BuildContext context, int index, TicketTypeData ticketType) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket Type ${index + 1}',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (ticketTypes.length > 1)
                IconButton(
                  onPressed: () => onRemoveTicketType(index),
                  icon: Icon(Icons.delete_outline,
                      color: Colors.red[400], size: 20.sp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildTextField(
            controller: ticketType.nameController,
            hintText: 'Ticket name (e.g. Early Bird, VIP)',
            label: 'Name',
          ),
          SizedBox(height: 12.h),
          _buildTextField(
            controller: ticketType.descriptionController,
            hintText: 'What\'s included in this ticket?',
            label: 'Description',
            maxLines: 2,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: ticketType.priceController,
                  hintText: '0.00',
                  label: 'Price (\$)',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildTextField(
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
            filled: true,
            fillColor: const Color(0xFF1A0B2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
        ),
      ],
    );
  }
}
