import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/widgets/spinkit_loading_widget.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/create/staff_creation_widget.dart';
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

  // Staff Creation Management
  final List<StaffCreationData> _staffMembers = [];

  // Validation state
  bool _showValidationErrors = false;
  String? _categoryError;
  String? _dateTimeError;
  final Map<int, String> _ticketTypeErrors = {};
  final Map<int, String> _staffMemberErrors = {};

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
      listenWhen: (previous, current) {
        // Listen for error states
        if (current.hasError && current.errorMessage.isNotEmpty) {
          return true;
        }
        // Listen for successful event creation
        if (previous.isCreating &&
            !current.isCreating &&
            !current.hasError &&
            current.selectedEvent != null) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state.hasError && state.errorMessage.isNotEmpty) {
          AppHelpers.showErrorSnackBar(context, state.errorMessage);
        } else if (!state.isCreating &&
            state.selectedEvent != null &&
            !state.hasError) {
          // Event created successfully, navigate back and show success message
          AppHelpers.showSuccessSnackBar(
              context, 'Event created successfully!');
          Navigator.of(context).pop();
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
                    child: const Center(
                      child: SpinKitLoadingWidget(),
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

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 90.h),
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
                  _categoryError =
                      null; // Clear error when category is selected
                });
              },
              categoryError: _showValidationErrors ? _categoryError : null,
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
              dateTimeError: _showValidationErrors ? _dateTimeError : null,
            ),
            SizedBox(height: 24.h),

            TicketTypesSection(
              ticketTypes: _ticketTypes,
              onAddTicketType: _addTicketType,
              onRemoveTicketType: _removeTicketType,
            ),
            SizedBox(height: 24.h),

            StaffCreationWidget(
              initialStaffMembers: _staffMembers,
              onStaffMembersChanged: (staffMembers) {
                setState(() {
                  _staffMembers.clear();
                  _staffMembers.addAll(staffMembers);
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: colorScheme.copyWith(
              primary: colorScheme.primary,
              onPrimary: colorScheme.onPrimary,
              surface: colorScheme.surface,
              onSurface: colorScheme.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateTimeError = null; // Clear error when date is selected
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: colorScheme.copyWith(
              primary: colorScheme.primary,
              onPrimary: colorScheme.onPrimary,
              surface: colorScheme.surface,
              onSurface: colorScheme.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _dateTimeError = null; // Clear error when time is selected
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
    // Clear previous validation errors
    setState(() {
      _showValidationErrors = true;
      _categoryError = null;
      _dateTimeError = null;
      _ticketTypeErrors.clear();
      _staffMemberErrors.clear();
    });

    // Validate form fields
    if (!_formKey.currentState!.validate()) {
      _scrollToFirstError();
      return;
    }

    // Validate category
    if (_selectedCategory == null) {
      setState(() {
        _categoryError = 'Please select an event category';
      });
      AppHelpers.showErrorSnackBar(context, 'Please select an event category');
      _scrollToFirstError();
      return;
    }

    // Validate date and time
    if (_selectedDate == null || _selectedTime == null) {
      setState(() {
        _dateTimeError = 'Please select event date and time';
      });
      AppHelpers.showErrorSnackBar(
          context, 'Please select event date and time');
      _scrollToFirstError();
      return;
    }

    // Validate ticket types
    bool hasTicketError = false;
    for (int i = 0; i < _ticketTypes.length; i++) {
      final ticketType = _ticketTypes[i];
      if (ticketType.nameController.text.trim().isEmpty) {
        setState(() {
          _ticketTypeErrors[i] = 'Ticket name is required';
        });
        hasTicketError = true;
      }
      if (ticketType.priceController.text.trim().isEmpty ||
          double.tryParse(ticketType.priceController.text) == null) {
        setState(() {
          _ticketTypeErrors[i] = 'Valid price is required';
        });
        hasTicketError = true;
      }
      if (ticketType.quantityController.text.trim().isEmpty ||
          int.tryParse(ticketType.quantityController.text) == null ||
          int.parse(ticketType.quantityController.text) <= 0) {
        setState(() {
          _ticketTypeErrors[i] = 'Valid quantity is required';
        });
        hasTicketError = true;
      }
    }

    if (hasTicketError) {
      AppHelpers.showErrorSnackBar(
          context, 'Please fix ticket type errors');
      _scrollToFirstError();
      return;
    }

    // Validate staff members
    bool hasStaffError = false;
    for (int i = 0; i < _staffMembers.length; i++) {
      final staffMember = _staffMembers[i];
      if (staffMember.name.trim().isEmpty) {
        setState(() {
          _staffMemberErrors[i] = 'Staff name is required';
        });
        hasStaffError = true;
      }
      if (staffMember.email.trim().isEmpty) {
        setState(() {
          _staffMemberErrors[i] = 'Staff email is required';
        });
        hasStaffError = true;
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
          .hasMatch(staffMember.email.trim())) {
        setState(() {
          _staffMemberErrors[i] = 'Valid email is required';
        });
        hasStaffError = true;
      }
    }

    if (hasStaffError) {
      AppHelpers.showErrorSnackBar(
          context, 'Please fix staff member errors');
      _scrollToFirstError();
      return;
    }

    // Validate capacity
    final capacity = int.tryParse(_capacityController.text);
    if (capacity == null || capacity <= 0) {
      AppHelpers.showErrorSnackBar(
          context, 'Please enter a valid event capacity');
      _scrollToFirstError();
      return;
    }

    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser()!;

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

    final staffMemberRequests = _staffMembers.map((staffMember) {
      return CreateStaffMemberRequest(
        name: staffMember.name.trim(),
        email: staffMember.email.trim(),
        password: staffMember.password,
        role: staffMember.role.name,
        permissions: staffMember.permissions.map((p) => p.name).toList(),
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
      maxCapacity: capacity,
      staffMembers: staffMemberRequests,
    );

    // Create the event
    context.read<EventManagementBloc>().add(
          EventManagementEvent.createEvent(
            organizerId: currentUser.uid,
            request: request,
          ),
        );
  }

  void _scrollToFirstError() {
    // Scroll to the first error field
    // This is a simple implementation - you can enhance it
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
