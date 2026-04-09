import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/home/staff_assignment_widget.dart';

abstract class StaffAssignmentService {
  Future<void> createStaffAssignments({
    required String eventId,
    required String organizerId,
    required List<StaffAssignmentData> assignments,
  });

  Future<void> updateStaffAssignments({
    required String eventId,
    required String organizerId,
    required List<StaffAssignmentData> assignments,
  });

  Future<void> removeStaffAssignment({
    required String assignmentId,
    required String organizerId,
  });

  Future<List<StaffEventAssignmentEntity>> getEventStaffAssignments({
    required String eventId,
    required String organizerId,
  });
}
