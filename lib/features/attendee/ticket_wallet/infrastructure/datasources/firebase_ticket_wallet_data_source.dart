import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

abstract class FirebaseTicketWalletDataSource {
  /// Get all tickets for a user
  Future<List<TicketEntity>> getUserTickets({required String userId});
  
  /// Stream user tickets for real-time updates
  Stream<List<TicketEntity>> watchUserTickets({required String userId});
  
  /// Get tickets by status
  Future<List<TicketEntity>> getTicketsByStatus({
    required String userId,
    required TicketStatus status,
  });
  
  /// Search tickets by query
  Future<List<TicketEntity>> searchTickets({
    required String userId,
    required String query,
  });
}

@Injectable(as: FirebaseTicketWalletDataSource)
class FirebaseTicketWalletDataSourceImpl implements FirebaseTicketWalletDataSource {
  final FirebaseFirestore _firestore;

  FirebaseTicketWalletDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<TicketEntity>> getUserTickets({required String userId}) async {
    try {
      final querySnapshot = await _firestore
          .collection('tickets')
          .where('userId', isEqualTo: userId)
          .orderBy('eventDateTime', descending: false)
          .get();

      return querySnapshot.docs
          .map((doc) => TicketEntity.fromFirestoreData(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get user tickets: $e');
    }
  }

  @override
  Stream<List<TicketEntity>> watchUserTickets({required String userId}) {
    return _firestore
        .collection('tickets')
        .where('userId', isEqualTo: userId)
        .orderBy('eventDateTime', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TicketEntity.fromFirestoreData(doc.data()))
            .toList());
  }

  @override
  Future<List<TicketEntity>> getTicketsByStatus({
    required String userId,
    required TicketStatus status,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection('tickets')
          .where('userId', isEqualTo: userId)
          .where('status', isEqualTo: status.name)
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => TicketEntity.fromFirestoreData(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get tickets by status: $e');
    }
  }

  @override
  Future<List<TicketEntity>> searchTickets({
    required String userId,
    required String query,
  }) async {
    try {
      // Get all user tickets first, then filter in memory
      // This avoids complex Firestore queries that require indexes
      final allTickets = await getUserTickets(userId: userId);
      
      final searchQuery = query.toLowerCase();
      return allTickets
          .where((ticket) =>
              ticket.eventTitle.toLowerCase().contains(searchQuery) ||
              ticket.eventLocation.toLowerCase().contains(searchQuery) ||
              ticket.ticketTypeName.toLowerCase().contains(searchQuery))
          .toList();
    } catch (e) {
      throw Exception('Failed to search tickets: $e');
    }
  }
}