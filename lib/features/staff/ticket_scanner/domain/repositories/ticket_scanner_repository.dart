import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';

abstract class TicketScannerRepository {
  /// Validate a scanned QR code and return ticket information
  Future<Either<NetworkExceptions, TicketValidationResult>> validateTicket({
    required String qrCode,
    required String eventId,
    required String staffId,
  });

  /// Check in a validated ticket
  Future<Either<NetworkExceptions, CheckInEntity>> checkInTicket({
    required String ticketId,
    required String eventId,
    required String staffId,
    String? notes,
  });

  /// Get check-in statistics for an event
  Future<Either<NetworkExceptions, CheckInStats>> getCheckInStats({
    required String eventId,
    required String staffId,
  });

  /// Get recent check-ins for staff dashboard
  Future<Either<NetworkExceptions, List<CheckInEntity>>> getRecentCheckIns({
    required String eventId,
    required String staffId,
    int limit = 10,
  });
}