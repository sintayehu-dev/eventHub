import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/services/image_picker_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EventManagementBloc>(),
      child: const CreateEventView(),
    );
  }
}

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  final _capacityController = TextEditingController();
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedTicketType = 'Paid';
  String? _selectedImagePath;

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
          eventCreated: (event) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Event created successfully!'),
                backgroundColor: const Color(0xFF4ADE80),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
            context.pop();
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
      child: Scaffold(
        backgroundColor: const Color(0xFF1A0B2E),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            'Create Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
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
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Title
            _buildSectionTitle('Event Title'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _titleController,
              hintText: 'Enter event title',
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

            // Ticket Type
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
                validator: (value) {
                  if (_selectedTicketType == 'Paid' &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Ticket price is required';
                  }
                  return null;
                },
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
            SizedBox(height: 40.h),

            // Create Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _createEvent(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Create Event',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Debug Test Button (remove in production)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _testFirebaseConnection(context),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey[600]!),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Test Firebase Connection',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[400],
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
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: const Color(0xFF2A1B3D),
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
      onTap: () => _selectImage(context),
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
                    child: Image.file(
                      File(_selectedImagePath!),
                      width: double.infinity,
                      height: 200.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedImagePath = null),
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
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.grey[400],
                    size: 48.sp,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Add Event Banner',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Tap to select an image',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _selectImage(BuildContext context) async {
    final imagePickerService = getIt<ImagePickerService>();
    final imagePath = await imagePickerService.showImageSourceSelectionDialog(
      context,
      currentImagePath: _selectedImagePath,
      maxWidth: 1200,
      maxHeight: 800,
      imageQuality: 90,
    );
    
    if (imagePath != null) {
      setState(() {
        _selectedImagePath = imagePath;
      });
    } else if (_selectedImagePath != null) {
      // User selected remove photo
      setState(() {
        _selectedImagePath = null;
      });
    }
  }

  Widget _buildDateSelector(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.grey[400],
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Select date',
                style: TextStyle(
                  color:
                      _selectedDate != null ? Colors.white : Colors.grey[400],
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
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              color: Colors.grey[400],
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                _selectedTime != null
                    ? _selectedTime!.format(context)
                    : 'Select time',
                style: TextStyle(
                  color:
                      _selectedTime != null ? Colors.white : Colors.grey[400],
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
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTicketType = 'Free'),
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
                        : Colors.grey[400],
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
              onTap: () => setState(() => _selectedTicketType = 'Paid'),
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
                        : Colors.grey[400],
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
      initialDate: DateTime.now().add(const Duration(days: 1)),
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
      setState(() => _selectedDate = date);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
      setState(() => _selectedTime = time);
    }
  }

  void _createEvent(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select event date'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
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

    final request = CreateEventRequest(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      bannerImagePath: _selectedImagePath, // Include the image path
      location: _locationController.text.trim(),
      dateTime: eventDateTime,
      maxCapacity: int.parse(_capacityController.text),
      ticketTypes: [
        CreateTicketTypeRequest(
          name: _selectedTicketType == 'Free'
              ? 'Free Ticket'
              : 'General Admission',
          description: 'Standard event ticket',
          price: ticketPrice,
          quantity: int.parse(_capacityController.text),
        ),
      ],
    );

    context.read<EventManagementBloc>().add(
          EventManagementEvent.createEvent(
            organizerId: 'current_organizer_id', // TODO: Get from auth
            request: request,
          ),
        );
  }

  Future<void> _testFirebaseConnection(BuildContext context) async {
    try {
      // Test basic Firebase connection
      final firestore = FirebaseFirestore.instance;

      // Try to write a simple test document
      await firestore.collection('test').doc('connection').set({
        'timestamp': FieldValue.serverTimestamp(),
        'test': true,
      });

      print('✅ Firebase connection successful');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Firebase connection successful!'),
          backgroundColor: const Color(0xFF4ADE80),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      );
      
    } catch (e) {
      print('❌ Firebase connection failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Firebase connection failed: $e'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      );
    }
  }
}