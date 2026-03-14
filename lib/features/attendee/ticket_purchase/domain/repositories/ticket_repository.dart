import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

abstract class TicketRepository {
  /// Purchase tickets for an event
  Future<Either<NetworkExceptions, PurchaseResult>> purchaseTickets({
    required String userId,
    required PurchaseTicketRequest request,
  });

  /// Get all tickets for a user
  Future<Either<NetworkExceptions, List<TicketEntity>>> getUserTickets({
    required String userId,
    TicketStatus? status,
  });

  /// Get ticket by ID
  Future<Either<NetworkExceptions, TicketEntity>> getTicketById({
    required String ticketId,
    required String userId,
  });

  /// Cancel a ticket
  Future<Either<NetworkExceptions, TicketEntity>> cancelTicket({
    required String ticketId,
    required String userId,
    required String reason,
  });

  /// Check in with QR code
  Future<Either<NetworkExceptions, TicketEntity>> checkInTicket({
    required String qrCode,
    required String eventId,
  });

  /// Get tickets for a specific event
  Future<Either<NetworkExceptions, List<TicketEntity>>> getEventTickets({
    required String userId,
    required String eventId,
  });

  /// Stream user tickets (real-time)
  Stream<Either<NetworkExceptions, List<TicketEntity>>> watchUserTickets({
    required String userId,
  });
}