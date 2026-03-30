import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/services/image_picker_service.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/staff_assignment_widget.dart';
import 'package:eventhub/features/staff/event_assignment/domain/services/staff_assignment_service.dart';

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
  final _capacityController = TextEditingController();
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  EventCategory? _selectedCategory;
  String? _selectedImagePath;
  
  // Ticket Types Management
  final List<TicketTypeData> _ticketTypes = [];
  
  // Staff Assignment Management
  final List<StaffAssignmentData> _staffAssignments = [];

  @override
  void initState() {
    super.initState();
    // Add a default ticket type
    _addDefaultTicketType();
  }

  void _addDefaultTicketType() {
    _ticketTypes.add(TicketTypeData(
      name: 'General Admission',
      description: 'Standard event ticket',
      price: 0.0,
      quantity: 100,
      isActive: true,
    ));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _capacityController.dispose();
    for (final ticketType in _ticketTypes) {
      ticketType.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return BlocListener<EventManagementBloc, EventManagementState>(
      listener: (context, state) {
        state.whenOrNull(
          eventCreated: (event) async {
            // Create staff assignments after event is created
            if (_staffAssignments.isNotEmpty) {
              try {
                final staffAssignmentService = getIt<StaffAssignmentService>();
                final userService = getIt<UserService>();
                final currentUser = userService.getCurrentUser();

                if (currentUser != null) {
                  await staffAssignmentService.createStaffAssignments(
                    eventId: event.id,
                    organizerId: currentUser.uid,
                    assignments: _staffAssignments,
                  );
                }
              } catch (e) {
                // Show warning but don't prevent success message
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Event created but staff assignment failed: $e'),
                      backgroundColor: colorScheme.secondary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                  );
                }
              }
            }
            
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Event created successfully!'),
                  backgroundColor: colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              );
              context.pop();
            }
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: colorScheme.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          ),
          title: Text(
            'Create Event',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
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
                    color: colorScheme.surface.withValues(alpha: 0.8),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();
    
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 100.h),
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

            // Event Category
            _buildSectionTitle('Event Category'),
            SizedBox(height: 8.h),
            _buildCategorySelector(),
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

            // Ticket Types Section
            _buildTicketTypesSection(),
            SizedBox(height: 24.h),

            // Staff Assignment Section
            StaffAssignmentWidget(
              initialAssignments: _staffAssignments,
              organizerId: currentUser?.uid ?? '',
              onAssignmentsChanged: (assignments) {
                setState(() {
                  _staffAssignments.clear();
                  _staffAssignments.addAll(assignments);
                });
              },
            ),
            SizedBox(height: 24.h),

            // Event Capacity
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
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Create Event',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimary,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium
            ?.copyWith(color: colorScheme.onSurfaceVariant),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  Widget _buildCategorySelector() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.outline, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<EventCategory>(
          value: _selectedCategory,
          hint: Text(
            'Select event category',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          isExpanded: true,
          dropdownColor: colorScheme.surfaceContainerHighest,
          icon: Icon(Icons.keyboard_arrow_down,
              color: colorScheme.onSurfaceVariant),
          items: EventCategory.values.map((category) {
            return DropdownMenuItem<EventCategory>(
              value: category,
              child: Row(
                children: [
                  Text(
                    category.icon,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      category.displayName,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (EventCategory? newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorScheme.outline, width: 1),
        ),
        child: _selectedImagePath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  File(_selectedImagePath!),
                  fit: BoxFit.cover,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    color: colorScheme.onSurfaceVariant,
                    size: 48.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Add Event Banner',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Tap to select image',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorScheme.outline, width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today,
                color: colorScheme.onSurfaceVariant, size: 20.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Select Date',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _selectedDate != null
                      ? colorScheme.onSurface
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorScheme.outline, width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.access_time,
                color: colorScheme.onSurfaceVariant, size: 20.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                _selectedTime != null
                    ? _selectedTime!.format(context)
                    : 'Select Time',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _selectedTime != null
                      ? colorScheme.onSurface
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketTypesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Ticket Types'),
            TextButton.icon(
              onPressed: _addTicketType,
              icon:
                  Icon(Icons.add, color: const Color(0xFF8B5CF6), size: 18.sp),
              label: Text(
                'Add Type',
                style: TextStyle(
                  color: const Color(0xFF8B5CF6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        ..._ticketTypes.asMap().entries.map((entry) {
          final index = entry.key;
          final ticketType = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: _buildTicketTypeCard(ticketType, index),
          );
        }),
      ],
    );
  }

  Widget _buildTicketTypeCard(TicketTypeData ticketType, int index) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with delete button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket Type ${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (_ticketTypes.length > 1)
                IconButton(
                  onPressed: () => _removeTicketType(index),
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red[400],
                    size: 20.sp,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          SizedBox(height: 12.h),

          // Ticket Name
          TextFormField(
            controller: ticketType.nameController,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
            decoration: InputDecoration(
              labelText: 'Ticket Name',
              labelStyle: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
              filled: true,
              fillColor: const Color(0xFF1A0B2E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ticket name is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),

          // Description
          TextFormField(
            controller: ticketType.descriptionController,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
            decoration: InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
              filled: true,
              fillColor: const Color(0xFF1A0B2E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            ),
            maxLines: 2,
          ),
          SizedBox(height: 12.h),

          // Price and Quantity Row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: ticketType.priceController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    labelText: 'Price (\$)',
                    labelStyle:
                        TextStyle(color: Colors.grey[400], fontSize: 12.sp),
                    filled: true,
                    fillColor: const Color(0xFF1A0B2E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Price is required';
                    }
                    final price = double.tryParse(value);
                    if (price == null || price < 0) {
                      return 'Invalid price';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextFormField(
                  controller: ticketType.quantityController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    labelStyle:
                        TextStyle(color: Colors.grey[400], fontSize: 12.sp),
                    filled: true,
                    fillColor: const Color(0xFF1A0B2E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Quantity is required';
                    }
                    final quantity = int.tryParse(value);
                    if (quantity == null || quantity <= 0) {
                      return 'Invalid quantity';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final imagePath =
          await getIt<ImagePickerService>().showImageSourceSelectionDialog(
        context,
        currentImagePath: _selectedImagePath,
      );

      if (imagePath != null) {
        setState(() {
          _selectedImagePath = imagePath;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error selecting image: $e'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
              onPrimary: Colors.white,
              surface: Color(0xFF2A1B3D),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
              onPrimary: Colors.white,
              surface: Color(0xFF2A1B3D),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _addTicketType() {
    setState(() {
      _ticketTypes.add(TicketTypeData(
        name: 'Ticket Type ${_ticketTypes.length + 1}',
        description: '',
        price: 0.0,
        quantity: 50,
        isActive: true,
      ));
    });
  }

  void _removeTicketType(int index) {
    if (_ticketTypes.length > 1) {
      setState(() {
        _ticketTypes[index].dispose();
        _ticketTypes.removeAt(index);
      });
    }
  }

  void _createEvent(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser();

    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to create events'),
          backgroundColor: Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an event category'),
          backgroundColor: Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select event date and time'),
          backgroundColor: Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Validate ticket types
    for (int i = 0; i < _ticketTypes.length; i++) {
      final ticketType = _ticketTypes[i];
      if (ticketType.nameController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill in ticket type ${i + 1} name'),
            backgroundColor: const Color(0xFFEF4444),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
    }

    // Validate staff assignments
    for (int i = 0; i < _staffAssignments.length; i++) {
      final assignment = _staffAssignments[i];
      if (assignment.staffId.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Please select a staff member for assignment ${i + 1}'),
            backgroundColor: const Color(0xFFEF4444),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
    }

    final eventDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final ticketTypeRequests = _ticketTypes.map((ticketType) {
      return CreateTicketTypeRequest(
        name: ticketType.nameController.text.trim(),
        description: ticketType.descriptionController.text.trim(),
        price: double.tryParse(ticketType.priceController.text) ?? 0.0,
        quantity: int.tryParse(ticketType.quantityController.text) ?? 0,
      );
    }).toList();

    final request = CreateEventRequest(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      bannerImagePath: _selectedImagePath,
      location: _locationController.text.trim(),
      dateTime: eventDateTime,
      category: _selectedCategory!,
      ticketTypes: ticketTypeRequests,
      maxCapacity: int.tryParse(_capacityController.text) ?? 0,
    );

    // Create the event first
    context.read<EventManagementBloc>().add(
          EventManagementEvent.createEvent(
            organizerId: currentUser.uid,
            request: request,
          ),
        );
  }
}

// Helper class for managing ticket type data
class TicketTypeData {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  bool isActive;

  TicketTypeData({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required this.isActive,
  })  : nameController = TextEditingController(text: name),
        descriptionController = TextEditingController(text: description),
        priceController = TextEditingController(text: price.toString()),
        quantityController = TextEditingController(text: quantity.toString());

  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }
}