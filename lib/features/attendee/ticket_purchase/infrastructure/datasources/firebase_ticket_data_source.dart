import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

abstract class FirebaseTicketDataSource {
  Future<PurchaseResult> purchaseTickets({
    required String userId,
    required PurchaseTicketRequest request,
  });

  Future<List<TicketEntity>> getUserTickets({
    required String userId,
    TicketStatus? status,
  });

  Future<TicketEntity> getTicketById({
    required String ticketId,
    required String userId,
  });

  Future<TicketEntity> cancelTicket({
    required String ticketId,
    required String userId,
    required String reason,
  });

  Future<TicketEntity> checkInTicket({
    required String qrCode,
    required String eventId,
  });

  Future<List<TicketEntity>> getEventTickets({
    required String userId,
    required String eventId,
  });

  Stream<List<TicketEntity>> watchUserTickets({
    required String userId,
  });

  Future<TicketEntity> validateTicketQR({
    required String qrCode,
  });
}

@Injectable(as: FirebaseTicketDataSource)
class FirebaseTicketDataSourceImpl implements FirebaseTicketDataSource {
  final FirebaseFirestore _firestore;
  final Random _random = Random();

  FirebaseTicketDataSourceImpl(this._firestore);

  static const String _ticketsCollection = 'tickets';
  static const String _eventsCollection = 'events';

  /// Generate a simple unique ID
  String _generateId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = _random.nextInt(999999);
    return '${timestamp}_$randomNum';
  }

  /// Generate QR code string
  String _generateQRCode(String ticketId, String eventId) {
    return 'TICKET_${ticketId}_EVENT_${eventId}_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<PurchaseResult> purchaseTickets({
    required String userId,
    required PurchaseTicketRequest request,
  }) async {
    try {
      // Get event details
      final eventDoc = await _firestore
          .collection(_eventsCollection)
          .doc(request.eventId)
          .get();

      if (!eventDoc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Event not found',
        );
      }

      final event = EventEntity.fromFirestoreData(eventDoc.data()!);
      
      // Find the ticket type
      final ticketType = event.ticketTypes.firstWhere(
        (t) => t.id == request.ticketTypeId,
        orElse: () => throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Ticket type not found',
        ),
      );

      // Check availability
      if (ticketType.availableQuantity < request.quantity) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Not enough tickets available',
        );
      }

      final now = DateTime.now();
      final transactionId = _generateId();
      final tickets = <TicketEntity>[];

      // Create tickets
      for (int i = 0; i < request.quantity; i++) {
        final ticketId = _generateId();
        final qrCode = _generateQRCode(ticketId, request.eventId);

        final ticket = TicketEntity(
          id: ticketId,
          eventId: request.eventId,
          userId: userId,
          eventTitle: event.title,
          eventLocation: event.location,
          eventDateTime: event.dateTime,
          eventBannerUrl: event.bannerUrl,
          ticketTypeId: ticketType.id,
          ticketTypeName: ticketType.name,
          ticketTypeDescription: ticketType.description,
          ticketPrice: ticketType.price,
          status: TicketStatus.confirmed, // Mock payment always succeeds
          qrCode: qrCode,
          purchaseDate: now,
          metadata: request.metadata,
          createdAt: now,
          updatedAt: now,
        );

        tickets.add(ticket);

        // Save ticket to Firestore
        await _firestore
            .collection(_ticketsCollection)
            .doc(ticketId)
            .set(ticket.toFirestoreData());
      }

      // Update event ticket availability
      final updatedTicketTypes = event.ticketTypes.map((t) {
        if (t.id == request.ticketTypeId) {
          return t.copyWith(
            availableQuantity: t.availableQuantity - request.quantity,
          );
        }
        return t;
      }).toList();

      final updatedEvent = event.copyWith(
        ticketTypes: updatedTicketTypes,
        updatedAt: now,
      );

      await _firestore
          .collection(_eventsCollection)
          .doc(request.eventId)
          .update(updatedEvent.toFirestoreData());

      final totalAmount = ticketType.price * request.quantity;

      return PurchaseResult(
        transactionId: transactionId,
        tickets: tickets,
        totalAmount: totalAmount,
        paymentStatus: PaymentStatus.completed, // Mock payment
        paymentReference: 'MOCK_${transactionId}',
      );
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to purchase tickets: $e',
      );
    }
  }

  @override
  Future<List<TicketEntity>> getUserTickets({
    required String userId,
    TicketStatus? status,
  }) async {
    try {
      Query query = _firestore
          .collection(_ticketsCollection)
          .where('userId', isEqualTo: userId);

      final querySnapshot = await query.get();
      var tickets = querySnapshot.docs
          .map((doc) => TicketEntity.fromFirestoreData(doc.data() as Map<String, dynamic>))
          .toList();

      // Filter by status in memory if specified
      if (status != null) {
        tickets = tickets.where((ticket) => ticket.status == status).toList();
      }

      // Sort by purchase date (newest first)
      tickets.sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));

      return tickets;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get user tickets: $e',
      );
    }
  }

  @override
  Future<TicketEntity> getTicketById({
    required String ticketId,
    required String userId,
  }) async {
    try {
      final doc = await _firestore
          .collection(_ticketsCollection)
          .doc(ticketId)
          .get();

      if (!doc.exists) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Ticket not found',
        );
      }

      final ticket = TicketEntity.fromFirestoreData(doc.data()!);

      // Verify ownership
      if (ticket.userId != userId) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Unauthorized: Not your ticket',
        );
      }

      return ticket;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get ticket: $e',
      );
    }
  }

  @override
  Future<TicketEntity> cancelTicket({
    required String ticketId,
    required String userId,
    required String reason,
  }) async {
    try {
      final ticket = await getTicketById(ticketId: ticketId, userId: userId);

      if (ticket.status != TicketStatus.confirmed) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Ticket cannot be cancelled',
        );
      }

      final updatedTicket = ticket.copyWith(
        status: TicketStatus.cancelled,
        updatedAt: DateTime.now(),
        metadata: {
          ...?ticket.metadata,
          'cancellationReason': reason,
          'cancelledAt': DateTime.now().toIso8601String(),
        },
      );

      await _firestore
          .collection(_ticketsCollection)
          .doc(ticketId)
          .update(updatedTicket.toFirestoreData());

      return updatedTicket;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to cancel ticket: $e',
      );
    }
  }

  @override
  Future<TicketEntity> checkInTicket({
    required String qrCode,
    required String eventId,
  }) async {
    try {
      // Find ticket by QR code
      final querySnapshot = await _firestore
          .collection(_ticketsCollection)
          .where('qrCode', isEqualTo: qrCode)
          .where('eventId', isEqualTo: eventId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Invalid QR code or ticket not found',
        );
      }

      final ticketDoc = querySnapshot.docs.first;
      final ticket = TicketEntity.fromFirestoreData(ticketDoc.data());

      if (ticket.status != TicketStatus.confirmed) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Ticket is not valid for check-in',
        );
      }

      if (ticket.checkInDate != null) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Ticket already used',
        );
      }

      final updatedTicket = ticket.copyWith(
        status: TicketStatus.used,
        checkInDate: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_ticketsCollection)
          .doc(ticket.id)
          .update(updatedTicket.toFirestoreData());

      return updatedTicket;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to check in ticket: $e',
      );
    }
  }

  @override
  Future<List<TicketEntity>> getEventTickets({
    required String userId,
    required String eventId,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection(_ticketsCollection)
          .where('userId', isEqualTo: userId)
          .where('eventId', isEqualTo: eventId)
          .get();

      final tickets = querySnapshot.docs
          .map((doc) => TicketEntity.fromFirestoreData(doc.data()))
          .toList();

      tickets.sort((a, b) => a.purchaseDate.compareTo(b.purchaseDate));

      return tickets;
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get event tickets: $e',
      );
    }
  }

  @override
  Stream<List<TicketEntity>> watchUserTickets({
    required String userId,
  }) {
    return _firestore
        .collection(_ticketsCollection)
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) {
      final tickets = querySnapshot.docs
          .map((doc) => TicketEntity.fromFirestoreData(doc.data()))
          .toList();

      tickets.sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));
      return tickets;
    });
  }

  @override
  Future<TicketEntity> validateTicketQR({
    required String qrCode,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection(_ticketsCollection)
          .where('qrCode', isEqualTo: qrCode)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw FirebaseException(
          plugin: 'cloud_firestore',
          message: 'Invalid QR code: ticket not found',
        );
      }

      return TicketEntity.fromFirestoreData(querySnapshot.docs.first.data());
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to validate ticket QR: $e',
      );
    }
  }
}