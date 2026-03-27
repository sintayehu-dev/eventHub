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
  late List<StaffAssignmentData> _assignments;
  List<StaffEntity> _availableStaff = [];
  bool _isLoadingStaff = false;

  @override
  void initState() {
    super.initState();
    _assignments = List.from(widget.initialAssignments);
    _loadAvailableStaff();
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

  void _addStaffAssignment() {
    if (_availableStaff.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('No staff members available. Please add staff members first.'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      );
      return;
    }

    // Find staff not already assigned
    final assignedStaffIds = _assignments.map((a) => a.staffId).toSet();
    final availableStaff = _availableStaff.where((staff) => !assignedStaffIds.contains(staff.id)).toList();
    
    if (availableStaff.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('All available staff members are already assigned.'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      );
      return;
    }

    setState(() {
      _assignments.add(StaffAssignmentData(
        staffId: availableStaff.first.id,
        staffEmail: availableStaff.first.email,
        staffName: availableStaff.first.name,
        role: StaffRole.scanner,
        permissions: StaffRole.scanner.defaultPermissions,
      ));
    });
    widget.onAssignmentsChanged(_assignments);
  }

  void _removeStaffAssignment(int index) {
    setState(() {
      _assignments.removeAt(index);
    });
    widget.onAssignmentsChanged(_assignments);
  }

  void _updateStaffAssignment(int index, StaffAssignmentData assignment) {
    setState(() {
      _assignments[index] = assignment;
    });
    widget.onAssignmentsChanged(_assignments);
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
            TextButton.icon(
              onPressed: _addStaffAssignment,
              icon: Icon(Icons.add, size: 18.sp, color: const Color(0xFF8B5CF6)),
              label: Text(
                'Add Staff',
                style: TextStyle(
                  color: const Color(0xFF8B5CF6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Staff Assignment Cards
        if (_isLoadingStaff)
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1B3D),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[700]!, width: 1),
            ),
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: const Color(0xFF8B5CF6),
                  strokeWidth: 2,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Loading staff members...',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          )
        else if (_assignments.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1B3D),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[700]!, width: 1),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.people_outline,
                  size: 48.sp,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 12.h),
                Text(
                  'No staff assigned yet',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Add staff members who can scan tickets and manage attendees for this event',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          ...List.generate(_assignments.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _buildStaffAssignmentCard(
                context,
                index,
                _assignments[index],
              ),
            );
          }),
      ],
    );
  }

  Widget _buildStaffAssignmentCard(
    BuildContext context,
    int index,
    StaffAssignmentData assignment,
  ) {
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
          // Header with remove button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Staff Member ${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () => _removeStaffAssignment(index),
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red[400],
                  size: 20.sp,
                ),
                constraints: BoxConstraints(
                  minWidth: 32.w,
                  minHeight: 32.h,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Staff Selection Dropdown
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1A0B2E),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey[600]!, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: assignment.staffId.isNotEmpty ? assignment.staffId : null,
                hint: Text(
                  'Select Staff Member',
                  style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                ),
                isExpanded: true,
                dropdownColor: const Color(0xFF1A0B2E),
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
                items: _getAvailableStaffForAssignment(index).map((staff) {
                  return DropdownMenuItem(
                    value: staff.id,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          backgroundColor: const Color(0xFF8B5CF6),
                          child: Text(
                            staff.name.isNotEmpty ? staff.name[0].toUpperCase() : 'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                staff.name,
                                style: TextStyle(color: Colors.white, fontSize: 14.sp),
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
                  );
                }).toList(),
                onChanged: (staffId) {
                  if (staffId != null) {
                    final selectedStaff = _availableStaff.firstWhere((s) => s.id == staffId);
                    _updateStaffAssignment(
                      index,
                      assignment.copyWith(
                        staffId: selectedStaff.id,
                        staffEmail: selectedStaff.email,
                        staffName: selectedStaff.name,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Display selected staff info
          if (assignment.staffId.isNotEmpty) ...[
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: const Color(0xFF8B5CF6),
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          assignment.staffName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          assignment.staffEmail,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],

          // Role Selection
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1A0B2E),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey[600]!, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<StaffRole>(
                value: assignment.role,
                hint: Text(
                  'Select Role',
                  style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                ),
                isExpanded: true,
                dropdownColor: const Color(0xFF1A0B2E),
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
                items: StaffRole.values.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Row(
                      children: [
                        Icon(Icons.badge_outlined, color: Colors.grey[400], size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          role.displayName,
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (role) {
                  if (role != null) {
                    _updateStaffAssignment(
                      index,
                      assignment.copyWith(
                        role: role,
                        permissions: role.defaultPermissions,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Permissions Display
          Text(
            'Permissions:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: assignment.permissions.map((permission) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.5),
                  ),
                ),
                child: Text(
                  permission.displayName,
                  style: TextStyle(
                    color: const Color(0xFF8B5CF6),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  List<StaffEntity> _getAvailableStaffForAssignment(int assignmentIndex) {
    // Get all assigned staff IDs except for the current assignment
    final assignedStaffIds = _assignments
        .asMap()
        .entries
        .where((entry) => entry.key != assignmentIndex)
        .map((entry) => entry.value.staffId)
        .toSet();

    // Return staff that are not assigned to other assignments
    return _availableStaff.where((staff) => !assignedStaffIds.contains(staff.id)).toList();
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