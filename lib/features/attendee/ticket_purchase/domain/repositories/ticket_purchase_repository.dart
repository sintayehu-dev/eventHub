import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

abstract class TicketPurchaseRepository {
  /// Purchase tickets for an event
  Future<Either<NetworkExceptions, PurchaseResult>> purchaseTickets({
    required PurchaseTicketRequest request,
    required String userId,
  });

  /// Get user's tickets
  Future<Either<NetworkExceptions, List<TicketEntity>>> getUserTickets({
    required String userId,
  });

  /// Get tickets for a specific event
  Future<Either<NetworkExceptions, List<TicketEntity>>> getEventTickets({
    required String userId,
    required String eventId,
  });

  /// Get ticket details by ID
  Future<Either<NetworkExceptions, TicketEntity>> getTicketDetails({
    required String ticketId,
    required String userId,
  });

  /// Cancel ticket
  Future<Either<NetworkExceptions, bool>> cancelTicket({
    required String ticketId,
    required String userId,
  });

  /// Check in ticket (for QR code scanning)
  Future<Either<NetworkExceptions, TicketEntity>> checkInTicket({
    required String ticketId,
    required String userId,
  });

  /// Validate ticket QR code
  Future<Either<NetworkExceptions, TicketEntity>> validateTicketQR({
    required String qrCode,
  });

  /// Stream user tickets (real-time updates)
  Stream<Either<NetworkExceptions, List<TicketEntity>>> watchUserTickets({
    required String userId,
  });
}