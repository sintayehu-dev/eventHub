import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/services/image_picker_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class EditEventScreen extends StatelessWidget {
  final EventEntity event;
  
  const EditEventScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventManagementBloc>(),
      child: EditEventView(event: event),
    );
  }
}

class EditEventView extends StatefulWidget {
  final EventEntity event;
  
  const EditEventView({
    super.key,
    required this.event,
  });

  @override
  State<EditEventView> createState() => _EditEventViewState();
}

class _EditEventViewState extends State<EditEventView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _locationController;
  late final TextEditingController _priceController;
  late final TextEditingController _capacityController;
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedTicketType = 'Paid';
  String? _selectedImagePath;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // Pre-fill form with existing event data
    _titleController = TextEditingController(text: widget.event.title);
    _descriptionController = TextEditingController(text: widget.event.description);
    _locationController = TextEditingController(text: widget.event.location);
    _capacityController = TextEditingController(text: widget.event.maxCapacity.toString());
    
    // Set date and time from existing event
    _selectedDate = DateTime(
      widget.event.dateTime.year,
      widget.event.dateTime.month,
      widget.event.dateTime.day,
    );
    _selectedTime = TimeOfDay(
      hour: widget.event.dateTime.hour,
      minute: widget.event.dateTime.minute,
    );
    
    // Set ticket type and price from first ticket type
    if (widget.event.ticketTypes.isNotEmpty) {
      final firstTicket = widget.event.ticketTypes.first;
      _selectedTicketType = firstTicket.price > 0 ? 'Paid' : 'Free';
      _priceController = TextEditingController(
        text: firstTicket.price > 0 ? firstTicket.price.toString() : '',
      );
    } else {
      _priceController = TextEditingController();
    }
    
    // Set existing banner URL (we'll handle this differently since it's a URL, not a local path)
    _selectedImagePath = widget.event.bannerUrl;
    
    // Add listeners to detect changes
    _titleController.addListener(_onFieldChanged);
    _descriptionController.addListener(_onFieldChanged);
    _locationController.addListener(_onFieldChanged);
    _priceController.addListener(_onFieldChanged);
    _capacityController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    if (!_hasChanges) {
      setState(() {
        _hasChanges = true;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventManagementBloc, EventManagementState>(
      listener: (context, state) {
        state.whenOrNull(
          eventUpdated: (event) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Event updated successfully!'),
                backgroundColor: const Color(0xFF4ADE80),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
            context.pop(event); // Return updated event
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: const Color(0xFFEF4444),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
          },
        );
      },
      child: WillPopScope(
        onWillPop: () async {
          if (_hasChanges) {
            return await _showDiscardChangesDialog(context);
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF1A0B2E),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () async {
                if (_hasChanges) {
                  final shouldPop = await _showDiscardChangesDialog(context);
                  if (shouldPop) {
                    context.pop();
                  }
                } else {
                  context.pop();
                }
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text(
              'Edit Event',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              if (_hasChanges)
                TextButton(
                  onPressed: () => _updateEvent(context),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          body: BlocBuilder<EventManagementBloc, EventManagementState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              
              return Stack(
                children: [
                  _buildForm(context),
                  if (isLoading)
                    Container(
                      color: Colors.black54,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _showDiscardChangesDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B3D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Discard Changes?',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        content: Text(
          'You have unsaved changes. Are you sure you want to discard them?',
          style: TextStyle(color: Colors.grey[300], fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Keep Editing',
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Discard',
              style: TextStyle(color: Colors.red[400], fontSize: 14.sp),
            ),
          ),
        ],
      ),
    ) ?? false;
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Status Info
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1B3D),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: _getStatusColor(widget.event.status).withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: _getStatusColor(widget.event.status).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      widget.event.status.displayName.toUpperCase(),
                      style: TextStyle(
                        color: _getStatusColor(widget.event.status),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      widget.event.status.isEditable 
                          ? 'This event can be edited'
                          : 'Limited editing available for this status',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Event Title
            _buildSectionTitle('Event Title'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _titleController,
              hintText: 'Enter event title',
              enabled: widget.event.status.isEditable,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Event title is required';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),

            // Event Description
            _buildSectionTitle('Description'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _descriptionController,
              hintText: 'Describe your event',
              maxLines: 4,
              enabled: widget.event.status.isEditable,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Event description is required';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),

            // Event Banner Image
            _buildSectionTitle('Event Banner'),
            SizedBox(height: 8.h),
            _buildImagePicker(),
            SizedBox(height: 24.h),

            // Location
            _buildSectionTitle('Location'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _locationController,
              hintText: 'Event venue or address',
              enabled: widget.event.status.isEditable,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Event location is required';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),

            // Date & Time
            _buildSectionTitle('Date & Time'),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: _buildDateSelector(context),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildTimeSelector(context),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Ticket Type (limited editing if tickets are sold)
            _buildSectionTitle('Ticket Type'),
            SizedBox(height: 8.h),
            _buildTicketTypeSelector(),
            SizedBox(height: 16.h),

            // Price (if paid)
            if (_selectedTicketType == 'Paid') ...[
              _buildTextField(
                controller: _priceController,
                hintText: 'Ticket price (\$)',
                keyboardType: TextInputType.number,
                enabled: _canEditTicketPrice(),
                validator: (value) {
                  if (_selectedTicketType == 'Paid' &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Ticket price is required';
                  }
                  return null;
                },
              ),
              if (!_canEditTicketPrice())
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
              SizedBox(height: 24.h),
            ],

            // Capacity
            _buildSectionTitle('Event Capacity'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _capacityController,
              hintText: 'Maximum number of attendees',
              keyboardType: TextInputType.number,
              enabled: _canEditCapacity(),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Event capacity is required';
                }
                final capacity = int.tryParse(value);
                if (capacity == null || capacity <= 0) {
                  return 'Please enter a valid capacity';
                }
                final soldTickets = _getSoldTicketsCount();
                if (capacity < soldTickets) {
                  return 'Capacity cannot be less than sold tickets ($soldTickets)';
                }
                return null;
              },
            ),
            if (!_canEditCapacity())
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  'Capacity can only be increased after tickets are sold',
                  style: TextStyle(
                    color: Colors.orange[400],
                    fontSize: 11.sp,
                  ),
                ),
              ),
            SizedBox(height: 40.h),

            // Update Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _hasChanges ? () => _updateEvent(context) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hasChanges 
                      ? const Color(0xFF8B5CF6) 
                      : Colors.grey[600],
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  _hasChanges ? 'Update Event' : 'No Changes',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool enabled = true,
  }) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: enabled ? Colors.white : Colors.grey[500],
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
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

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: widget.event.status.isEditable ? () => _selectImage(context) : null,
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: _selectedImagePath != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: _selectedImagePath!.startsWith('http')
                        ? Image.network(
                            _selectedImagePath!,
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildImagePlaceholder();
                            },
                          )
                        : Image.file(
                            File(_selectedImagePath!),
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildImagePlaceholder();
                            },
                          ),
                  ),
                  if (widget.event.status.isEditable)
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImagePath = null;
                            _hasChanges = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              )
            : _buildImagePlaceholder(),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widget.event.status.isEditable 
              ? Icons.add_photo_alternate_outlined
              : Icons.image_outlined,
          color: Colors.grey[400],
          size: 48.sp,
        ),
        SizedBox(height: 12.h),
        Text(
          widget.event.status.isEditable 
              ? 'Add Event Banner'
              : 'No Banner Image',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (widget.event.status.isEditable) ...[
          SizedBox(height: 4.h),
          Text(
            'Tap to select an image',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12.sp,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _selectImage(BuildContext context) async {
    final imagePickerService = getIt<ImagePickerService>();
    final imagePath = await imagePickerService.showImageSourceSelectionDialog(
      context,
      currentImagePath: _selectedImagePath?.startsWith('http') == true ? null : _selectedImagePath,
      maxWidth: 1200,
      maxHeight: 800,
      imageQuality: 90,
    );
    
    if (imagePath != null) {
      setState(() {
        _selectedImagePath = imagePath;
        _hasChanges = true;
      });
    } else if (_selectedImagePath != null) {
      // User selected remove photo
      setState(() {
        _selectedImagePath = null;
        _hasChanges = true;
      });
    }
  }

  Widget _buildDateSelector(BuildContext context) {
    final canEdit = widget.event.status.isEditable;
    
    return GestureDetector(
      onTap: canEdit ? () => _selectDate(context) : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: canEdit ? const Color(0xFF2A1B3D) : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: canEdit ? Colors.grey[700]! : Colors.grey[800]!, 
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: canEdit ? Colors.grey[400] : Colors.grey[600],
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Select date',
                style: TextStyle(
                  color: _selectedDate != null 
                      ? (canEdit ? Colors.white : Colors.grey[500])
                      : Colors.grey[400],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector(BuildContext context) {
    final canEdit = widget.event.status.isEditable;
    
    return GestureDetector(
      onTap: canEdit ? () => _selectTime(context) : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: canEdit ? const Color(0xFF2A1B3D) : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: canEdit ? Colors.grey[700]! : Colors.grey[800]!, 
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              color: canEdit ? Colors.grey[400] : Colors.grey[600],
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                _selectedTime != null
                    ? _selectedTime!.format(context)
                    : 'Select time',
                style: TextStyle(
                  color: _selectedTime != null 
                      ? (canEdit ? Colors.white : Colors.grey[500])
                      : Colors.grey[400],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketTypeSelector() {
    final canEdit = _canEditTicketType();
    
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: canEdit ? const Color(0xFF2A1B3D) : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: canEdit ? Colors.grey[700]! : Colors.grey[800]!, 
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: canEdit ? () {
                setState(() {
                  _selectedTicketType = 'Free';
                  _hasChanges = true;
                });
              } : null,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: _selectedTicketType == 'Free' 
                      ? const Color(0xFF8B5CF6) 
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Free',
                  style: TextStyle(
                    color: _selectedTicketType == 'Free' 
                        ? Colors.white
                        : (canEdit ? Colors.grey[400] : Colors.grey[600]),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: canEdit ? () {
                setState(() {
                  _selectedTicketType = 'Paid';
                  _hasChanges = true;
                });
              } : null,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: _selectedTicketType == 'Paid' 
                      ? const Color(0xFF8B5CF6) 
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Paid',
                  style: TextStyle(
                    color: _selectedTicketType == 'Paid' 
                        ? Colors.white
                        : (canEdit ? Colors.grey[400] : Colors.grey[600]),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
              surface: Color(0xFF2A1B3D),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (date != null) {
      setState(() {
        _selectedDate = date;
        _hasChanges = true;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
              surface: Color(0xFF2A1B3D),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (time != null) {
      setState(() {
        _selectedTime = time;
        _hasChanges = true;
      });
    }
  }

  void _updateEvent(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select event date'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      );
      return;
    }

    if (_selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select event time'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      );
      return;
    }

    final eventDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final ticketPrice = _selectedTicketType == 'Paid'
        ? double.tryParse(_priceController.text) ?? 0.0
        : 0.0;

    // Only include image path if it's a local file (new image)
    final bannerImagePath = _selectedImagePath?.startsWith('http') == false 
        ? _selectedImagePath 
        : null;

    final request = UpdateEventRequest(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      bannerImagePath: bannerImagePath,
      location: _locationController.text.trim(),
      dateTime: eventDateTime,
      maxCapacity: int.parse(_capacityController.text),
      // Only update ticket types if we can edit them
      ticketTypes: _canEditTicketType() ? [
        UpdateTicketTypeRequest(
          id: widget.event.ticketTypes.first.id,
          name: _selectedTicketType == 'Free'
              ? 'Free Ticket'
              : 'General Admission',
          description: 'Standard event ticket',
          price: ticketPrice,
          quantity: int.parse(_capacityController.text),
        ),
      ] : null,
    );

    context.read<EventManagementBloc>().add(
      EventManagementEvent.updateEvent(
        eventId: widget.event.id,
        organizerId: widget.event.organizerId,
        request: request,
      ),
    );
  }

  // Helper methods for business logic
  bool _canEditTicketType() {
    return widget.event.status.isEditable && _getSoldTicketsCount() == 0;
  }

  bool _canEditTicketPrice() {
    return widget.event.status.isEditable && _getSoldTicketsCount() == 0;
  }

  bool _canEditCapacity() {
    return widget.event.status.isEditable;
  }

  int _getSoldTicketsCount() {
    return widget.event.ticketTypes.fold<int>(
      0,
      (sum, ticket) => sum + (ticket.quantity - ticket.availableQuantity),
    );
  }

  Color _getStatusColor(EventStatus status) {
    switch (status) {
      case EventStatus.active:
        return const Color(0xFF4ADE80);
      case EventStatus.draft:
        return const Color(0xFFF59E0B);
      case EventStatus.completed:
        return const Color(0xFF06B6D4);
      case EventStatus.cancelled:
        return const Color(0xFFEF4444);
    }
  }
}