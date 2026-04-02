import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_event_status_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_event_basic_info_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_event_banner_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_event_location_date_time_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_ticket_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_event_capacity_section.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/edit/edit_event_header.dart';

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
    return MultiBlocListener(
      listeners: [
        BlocListener<EventManagementBloc, EventManagementState>(
          listener: (context, state) {
            if (state.hasError && state.errorMessage.isNotEmpty) {
              AppHelpers.showErrorSnackBar(context, state.errorMessage);
            }
          },
        ),
        BlocListener<EventManagementBloc, EventManagementState>(
          listenWhen: (previous, current) =>
              previous.isUpdating && !current.isUpdating && !current.hasError,
          listener: (context, state) {
            AppHelpers.showSuccessSnackBar(
                context, 'Event updated successfully!');
            context.pop(state.selectedEvent); // Return updated event
          },
        ),
      ],
      child: PopScope(
        canPop: !_hasChanges,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          final shouldPop = await _showDiscardChangesDialog(context);
          if (shouldPop && context.mounted) {
            context.pop();
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF1A0B2E),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: EditEventHeader(
              hasChanges: _hasChanges,
              onBack: () async {
                if (_hasChanges) {
                  final shouldPop = await _showDiscardChangesDialog(context);
                  if (shouldPop) {
                    context.pop();
                  }
                } else {
                  context.pop();
                }
              },
              onSave: () => _updateEvent(context),
            ),
          ),
          body: BlocBuilder<EventManagementBloc, EventManagementState>(
            builder: (context, state) {
              final isLoading = state.isUpdating;
              
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
            EditEventStatusSection(status: widget.event.status),
            SizedBox(height: 24.h),

            EditEventBasicInfoSection(
              titleController: _titleController,
              descriptionController: _descriptionController,
              enabled: widget.event.status.isEditable,
            ),
            SizedBox(height: 24.h),

            EditEventBannerSection(
              selectedImagePath: _selectedImagePath,
              editable: widget.event.status.isEditable,
              onImageSelected: (imagePath) {
                setState(() {
                  _selectedImagePath = imagePath;
                  _hasChanges = true;
                });
              },
            ),
            SizedBox(height: 24.h),

            EditEventLocationDateTimeSection(
              locationController: _locationController,
              selectedDate: _selectedDate,
              selectedTime: _selectedTime,
              enabled: widget.event.status.isEditable,
              onSelectDate: () => _selectDate(context),
              onSelectTime: () => _selectTime(context),
            ),
            SizedBox(height: 24.h),

            EditTicketSection(
              selectedTicketType: _selectedTicketType,
              priceController: _priceController,
              canEditType: _canEditTicketType(),
              canEditPrice: _canEditTicketPrice(),
              onTypeChanged: (type) {
                setState(() {
                  _selectedTicketType = type;
                  _hasChanges = true;
                });
              },
            ),
            SizedBox(height: 24.h),

            EditEventCapacitySection(
              capacityController: _capacityController,
              enabled: _canEditCapacity(),
              soldTickets: _getSoldTicketsCount(),
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
      AppHelpers.showErrorSnackBar(context, 'Please select event date');
      return;
    }

    if (_selectedTime == null) {
      AppHelpers.showErrorSnackBar(context, 'Please select event time');
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
      ticketTypes: _canEditTicketType()
          ? [
              UpdateTicketTypeRequest(
                id: widget.event.ticketTypes.first.id,
                name: _selectedTicketType == 'Free'
                    ? 'Free Ticket'
                    : 'General Admission',
                description: 'Standard event ticket',
                price: ticketPrice,
                quantity: int.parse(_capacityController.text),
              ),
            ]
          : null,
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
}
