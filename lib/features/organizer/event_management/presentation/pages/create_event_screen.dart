import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/home/staff_assignment_widget.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_basic_info_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_banner_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_location_date_time_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/ticket_types_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/event_capacity_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/create_event_header.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/ticket_type_data.dart';

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
        if (state.hasError && state.errorMessage.isNotEmpty) {
          AppHelpers.showErrorSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CreateEventHeader(),
        ),
        body: BlocBuilder<EventManagementBloc, EventManagementState>(
          builder: (context, state) {
            final isLoading = state.isCreating;

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
            EventBasicInfoSection(
              titleController: _titleController,
              descriptionController: _descriptionController,
              selectedCategory: _selectedCategory?.displayName,
              categories: EventCategory.values.map((e) => e.displayName).toList(),
              onCategoryChanged: (newValue) {
                setState(() {
                  _selectedCategory = EventCategory.values.firstWhere(
                    (e) => e.displayName == newValue,
                  );
                });
              },
            ),
            SizedBox(height: 24.h),

            EventBannerSection(
              selectedImagePath: _selectedImagePath,
              onImageSelected: (imagePath) {
                setState(() {
                  _selectedImagePath = imagePath;
                });
              },
            ),
            SizedBox(height: 24.h),

            EventLocationDateTimeSection(
              locationController: _locationController,
              selectedDate: _selectedDate,
              selectedTime: _selectedTime,
              onSelectDate: () => _selectDate(context),
              onSelectTime: () => _selectTime(context),
            ),
            SizedBox(height: 24.h),

            TicketTypesSection(
              ticketTypes: _ticketTypes,
              onAddTicketType: _addTicketType,
              onRemoveTicketType: _removeTicketType,
            ),
            SizedBox(height: 24.h),

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

            EventCapacitySection(
              capacityController: _capacityController,
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
    final currentUser = userService
        .getCurrentUser()!; // Safe to use ! since auth is checked at splash

    if (_selectedCategory == null) {
      AppHelpers.showErrorSnackBar(context, 'Please select an event category');
      return;
    }

    if (_selectedDate == null || _selectedTime == null) {
      AppHelpers.showErrorSnackBar(
          context, 'Please select event date and time');
      return;
    }

    // Validate ticket types
    for (int i = 0; i < _ticketTypes.length; i++) {
      final ticketType = _ticketTypes[i];
      if (ticketType.nameController.text.trim().isEmpty) {
        AppHelpers.showErrorSnackBar(
            context, 'Please fill in ticket type ${i + 1} name');
        return;
      }
    }

    // Validate staff assignments
    for (int i = 0; i < _staffAssignments.length; i++) {
      final assignment = _staffAssignments[i];
      if (assignment.staffId.trim().isEmpty) {
        AppHelpers.showErrorSnackBar(
            context, 'Please select a staff member for assignment ${i + 1}');
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
