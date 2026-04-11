import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';
import 'package:eventhub/features/staff/management/domain/entities/staff_entity.dart';
import 'package:eventhub/features/staff/management/domain/repositories/staff_management_repository.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';

class StaffAssignmentWidget extends StatefulWidget {
  final List<StaffAssignmentData> initialAssignments;
  final Function(List<StaffAssignmentData>) onAssignmentsChanged;
  final String organizerId;

  const StaffAssignmentWidget({
    super.key,
    required this.initialAssignments,
    required this.onAssignmentsChanged,
    required this.organizerId,
  });

  @override
  State<StaffAssignmentWidget> createState() => _StaffAssignmentWidgetState();
}

class _StaffAssignmentWidgetState extends State<StaffAssignmentWidget> {
  List<StaffEntity> _availableStaff = [];
  List<String> _selectedStaffIds = [];
  Map<String, StaffRole> _staffRoles = {};
  bool _isLoadingStaff = false;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _initializeFromExistingAssignments();
    _loadAvailableStaff();
  }

  void _initializeFromExistingAssignments() {
    for (final assignment in widget.initialAssignments) {
      _selectedStaffIds.add(assignment.staffId);
      _staffRoles[assignment.staffId] = assignment.role;
    }
  }

  Future<void> _loadAvailableStaff() async {
    setState(() {
      _isLoadingStaff = true;
    });

    try {
      final staffRepository = getIt<StaffManagementRepository>();
      final staff = await staffRepository.getOrganizerStaff(
        organizerId: widget.organizerId,
      );
      
      setState(() {
        _availableStaff = staff;
        _isLoadingStaff = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingStaff = false;
      });
    }
  }

  void _toggleStaffSelection(String staffId) {
    setState(() {
      if (_selectedStaffIds.contains(staffId)) {
        _selectedStaffIds.remove(staffId);
        _staffRoles.remove(staffId);
      } else {
        _selectedStaffIds.add(staffId);
        _staffRoles[staffId] = StaffRole.staff; // Default role
      }
    });
    _updateAssignments();
  }

  void _updateStaffRole(String staffId, StaffRole role) {
    setState(() {
      _staffRoles[staffId] = role;
    });
    _updateAssignments();
  }

  void _updateAssignments() {
    final assignments = _selectedStaffIds.map((staffId) {
      final staff = _availableStaff.firstWhere((s) => s.id == staffId);
      final role = _staffRoles[staffId] ?? StaffRole.staff;

      return StaffAssignmentData(
        staffId: staffId,
        staffEmail: staff.email,
        staffName: staff.name,
        role: role,
        permissions: role.defaultPermissions,
      );
    }).toList();

    widget.onAssignmentsChanged(assignments);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Staff Assignments',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${_selectedStaffIds.length} selected',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Staff Selection Dropdown
        _buildStaffSelectionDropdown(),
        SizedBox(height: 16.h),

        // Selected Staff List
        if (_selectedStaffIds.isNotEmpty) ...[
          Text(
            'Selected Staff Members',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          ..._selectedStaffIds.map((staffId) {
            final staff = _availableStaff.firstWhere((s) => s.id == staffId);
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: _buildSelectedStaffCard(staff),
            );
          }),
        ],
      ],
    );
  }

  Widget _buildStaffSelectionDropdown() {
    if (_isLoadingStaff) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                color: const Color(0xFF8B5CF6),
                strokeWidth: 2,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Loading staff members...',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      );
    }

    if (_availableStaff.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1B3D),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: Column(
          children: [
            Icon(
              Icons.people_outline,
              size: 32.sp,
              color: Colors.grey[400],
            ),
            SizedBox(height: 8.h),
            Text(
              'No staff members found',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Staff members need to register with "Staff" role',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Column(
        children: [
          // Dropdown Header
          GestureDetector(
            onTap: () {
              setState(() {
                _isDropdownOpen = !_isDropdownOpen;
              });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    color: const Color(0xFF8B5CF6),
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      _selectedStaffIds.isEmpty
                          ? 'Select Staff Members'
                          : '${_selectedStaffIds.length} staff member${_selectedStaffIds.length == 1 ? '' : 's'} selected',
                      style: TextStyle(
                        color: _selectedStaffIds.isEmpty
                            ? Colors.grey[400]
                            : Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    _isDropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey[400],
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),

          // Dropdown Content
          if (_isDropdownOpen) ...[
            Divider(
              color: Colors.grey[700],
              height: 1,
              thickness: 1,
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 200.h,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _availableStaff.length,
                itemBuilder: (context, index) {
                  final staff = _availableStaff[index];
                  final isSelected = _selectedStaffIds.contains(staff.id);

                  return _buildStaffCheckboxItem(staff, isSelected);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStaffCheckboxItem(StaffEntity staff, bool isSelected) {
    return GestureDetector(
      onTap: () => _toggleStaffSelection(staff.id),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF8B5CF6).withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
                border: Border.all(
                  color:
                      isSelected ? const Color(0xFF8B5CF6) : Colors.grey[600]!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14.sp,
                    )
                  : null,
            ),
            SizedBox(width: 12.w),

            // Staff Avatar
            CircleAvatar(
              radius: 16.r,
              backgroundColor: const Color(0xFF8B5CF6),
              backgroundImage: staff.profileImageUrl != null
                  ? NetworkImage(staff.profileImageUrl!)
                  : null,
              child: staff.profileImageUrl == null
                  ? Text(
                      staff.name.isNotEmpty ? staff.name[0].toUpperCase() : 'S',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12.w),

            // Staff Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    staff.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    staff.email,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedStaffCard(StaffEntity staff) {
    final role = _staffRoles[staff.id] ?? StaffRole.staff;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1B3D),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Row(
        children: [
          // Staff Avatar
          CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xFF8B5CF6),
            backgroundImage: staff.profileImageUrl != null
                ? NetworkImage(staff.profileImageUrl!)
                : null,
            child: staff.profileImageUrl == null
                ? Text(
                    staff.name.isNotEmpty ? staff.name[0].toUpperCase() : 'S',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
          SizedBox(width: 16.w),

          // Staff Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  staff.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  staff.email,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          // Role Selector
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1A0B2E),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey[600]!, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<StaffRole>(
                value: role,
                isDense: true,
                dropdownColor: const Color(0xFF1A0B2E),
                icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey[400], size: 16.sp),
                items: StaffRole.values.map((r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(
                      r.displayName,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  );
                }).toList(),
                onChanged: (newRole) {
                  if (newRole != null) {
                    _updateStaffRole(staff.id, newRole);
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // Remove Button
          GestureDetector(
            onTap: () => _toggleStaffSelection(staff.id),
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                Icons.close,
                color: Colors.red[400],
                size: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Data class for staff assignment
class StaffAssignmentData {
  final String staffId;
  final String staffEmail;
  final String staffName;
  final StaffRole role;
  final List<StaffPermission> permissions;

  const StaffAssignmentData({
    required this.staffId,
    required this.staffEmail,
    required this.staffName,
    required this.role,
    required this.permissions,
  });

  StaffAssignmentData copyWith({
    String? staffId,
    String? staffEmail,
    String? staffName,
    StaffRole? role,
    List<StaffPermission>? permissions,
  }) {
    return StaffAssignmentData(
      staffId: staffId ?? this.staffId,
      staffEmail: staffEmail ?? this.staffEmail,
      staffName: staffName ?? this.staffName,
      role: role ?? this.role,
      permissions: permissions ?? this.permissions,
    );
  }
}