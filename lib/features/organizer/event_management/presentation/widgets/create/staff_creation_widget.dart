import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

class StaffCreationWidget extends StatefulWidget {
  final List<StaffCreationData> initialStaffMembers;
  final Function(List<StaffCreationData>) onStaffMembersChanged;

  const StaffCreationWidget({
    super.key,
    required this.initialStaffMembers,
    required this.onStaffMembersChanged,
  });

  @override
  State<StaffCreationWidget> createState() => _StaffCreationWidgetState();
}

class _StaffCreationWidgetState extends State<StaffCreationWidget> {
  List<StaffCreationData> _staffMembers = [];

  @override
  void initState() {
    super.initState();
    _staffMembers = List.from(widget.initialStaffMembers);
  }

  void _addStaffMember() {
    setState(() {
      _staffMembers.add(StaffCreationData(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: '',
        email: '',
        password: _generatePassword(), // Generate random password
        role: StaffRole.scanner,
        permissions: StaffRole.scanner.defaultPermissions,
      ));
    });
    _updateStaffMembers();
  }

  String _generatePassword() {
    // Generate a simple 8-character password
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(8, (index) => chars[(random + index) % chars.length]).join();
  }

  void _removeStaffMember(int index) {
    setState(() {
      _staffMembers.removeAt(index);
    });
    _updateStaffMembers();
  }

  void _updateStaffMember(int index, StaffCreationData updatedMember) {
    setState(() {
      _staffMembers[index] = updatedMember;
    });
    _updateStaffMembers();
  }

  void _updateStaffMembers() {
    widget.onStaffMembersChanged(_staffMembers);
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
              'Staff Members',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${_staffMembers.length} member${_staffMembers.length == 1 ? '' : 's'}',
              style: TextStyle(
                color: const Color(0xFF8B5CF6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        
        Text(
          'Create staff members with login credentials for your event',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 16.h),

        // Add Staff Button
        GestureDetector(
          onTap: _addStaffMember,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1B3D),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: const Color(0xFF8B5CF6),
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Add Staff Member',
                  style: TextStyle(
                    color: const Color(0xFF8B5CF6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // Staff Members List
        if (_staffMembers.isNotEmpty) ...[
          ..._staffMembers.asMap().entries.map((entry) {
            final index = entry.key;
            final staffMember = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _buildStaffMemberCard(index, staffMember),
            );
          }),
        ],
      ],
    );
  }

  Widget _buildStaffMemberCard(int index, StaffCreationData staffMember) {
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
              GestureDetector(
                onTap: () => _removeStaffMember(index),
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
          SizedBox(height: 16.h),

          // Name Field
          _buildTextField(
            label: 'Full Name',
            value: staffMember.name,
            onChanged: (value) {
              _updateStaffMember(
                index,
                staffMember.copyWith(name: value),
              );
            },
            hint: 'Enter staff member name',
          ),
          SizedBox(height: 12.h),

          // Email Field
          _buildTextField(
            label: 'Email Address',
            value: staffMember.email,
            onChanged: (value) {
              _updateStaffMember(
                index,
                staffMember.copyWith(email: value),
              );
            },
            hint: 'Enter email address',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 12.h),

          // Password Field (Read-only, auto-generated)
          _buildPasswordField(
            label: 'Password (Auto-generated)',
            value: staffMember.password,
            onRegenerate: () {
              _updateStaffMember(
                index,
                staffMember.copyWith(password: _generatePassword()),
              );
            },
          ),
          SizedBox(height: 12.h),

          // Role Selector
          Row(
            children: [
              Text(
                'Role:',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A0B2E),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey[600]!, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<StaffRole>(
                      value: staffMember.role,
                      isExpanded: true,
                      dropdownColor: const Color(0xFF1A0B2E),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                        size: 16.sp,
                      ),
                      items: StaffRole.values.map((role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(
                            role.displayName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newRole) {
                        if (newRole != null) {
                          _updateStaffMember(
                            index,
                            staffMember.copyWith(
                              role: newRole,
                              permissions: newRole.defaultPermissions,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String value,
    required VoidCallback onRegenerate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: onRegenerate,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  'Regenerate',
                  style: TextStyle(
                    color: const Color(0xFF8B5CF6),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: const Color(0xFF1A0B2E),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[600]!, width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value.isEmpty ? 'Password will be generated' : value,
                  style: TextStyle(
                    color: value.isEmpty ? Colors.grey[500] : Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              if (value.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    // Copy to clipboard functionality can be added here
                  },
                  child: Icon(
                    Icons.copy,
                    color: Colors.grey[400],
                    size: 16.sp,
                  ),
                ),
            ],
          ),
        ),
        if (value.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              'Share this password with the staff member',
              style: TextStyle(
                color: Colors.orange[300],
                fontSize: 10.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required Function(String) onChanged,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: const Color(0xFF1A0B2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey[600]!, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey[600]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Color(0xFF8B5CF6), width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
        ),
      ],
    );
  }
}

// Data class for staff creation
class StaffCreationData {
  final String id;
  final String name;
  final String email;
  final String password;
  final StaffRole role;
  final List<StaffPermission> permissions;

  const StaffCreationData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.permissions,
  });

  StaffCreationData copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    StaffRole? role,
    List<StaffPermission>? permissions,
  }) {
    return StaffCreationData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      permissions: permissions ?? this.permissions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role.name,
      'permissions': permissions.map((p) => p.name).toList(),
    };
  }

  factory StaffCreationData.fromJson(Map<String, dynamic> json) {
    return StaffCreationData(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: StaffRole.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => StaffRole.scanner,
      ),
      permissions: (json['permissions'] as List<dynamic>)
          .map((p) => StaffPermission.values.firstWhere(
                (perm) => perm.name == p,
                orElse: () => StaffPermission.scan,
              ))
          .toList(),
    );
  }
}