import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/repositories/ticket_purchase_repository.dart';
import 'package:eventhub/features/attendee/ticket_purchase/infrastructure/datasources/firebase_ticket_data_source.dart';

@Injectable(as: TicketPurchaseRepository)
class TicketPurchaseRepositoryImpl implements TicketPurchaseRepository {
  final FirebaseTicketDataSource _firebaseDataSource;

  TicketPurchaseRepositoryImpl(this._firebaseDataSource);

  @override
  Future<Either<NetworkExceptions, PurchaseResult>> purchaseTickets({
    required PurchaseTicketRequest request,
    required String userId,
  }) async {
    try {
      final result = await _firebaseDataSource.purchaseTickets(
        request: request,
        userId: userId,
      );
      return Right(result);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> getUserTickets({
    required String userId,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(userId: userId);
      return Right(tickets);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> getEventTickets({
    required String userId,
    required String eventId,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getEventTickets(
        userId: userId,
        eventId: eventId,
      );
      return Right(tickets);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TicketEntity>> getTicketDetails({
    required String ticketId,
    required String userId,
  }) async {
    try {
      final ticket = await _firebaseDataSource.getTicketById(
        ticketId: ticketId,
        userId: userId,
      );
      return Right(ticket);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, bool>> cancelTicket({
    required String ticketId,
    required String userId,
  }) async {
    try {
      await _firebaseDataSource.cancelTicket(
        ticketId: ticketId,
        userId: userId,
        reason: 'User requested cancellation',
      );
      return const Right(true);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TicketEntity>> checkInTicket({
    required String ticketId,
    required String userId,
  }) async {
    try {
      // First fetch the ticket to get its qrCode and eventId
      final ticket = await _firebaseDataSource.getTicketById(
        ticketId: ticketId,
        userId: userId,
      );
      final checkedIn = await _firebaseDataSource.checkInTicket(
        qrCode: ticket.qrCode,
        eventId: ticket.eventId,
      );
      return Right(checkedIn);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TicketEntity>> validateTicketQR({
    required String qrCode,
  }) async {
    try {
      final ticket = await _firebaseDataSource.validateTicketQR(qrCode: qrCode);
      return Right(ticket);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Stream<Either<NetworkExceptions, List<TicketEntity>>> watchUserTickets({
    required String userId,
  }) {
    try {
      return _firebaseDataSource
          .watchUserTickets(userId: userId)
          .map((tickets) => Right<NetworkExceptions, List<TicketEntity>>(tickets))
          .handleError((error) {
        return Stream.value(Left<NetworkExceptions, List<TicketEntity>>(
          NetworkExceptions.getDioException(error),
        ));
      });
    } catch (e) {
      return Stream.value(Left<NetworkExceptions, List<TicketEntity>>(
        NetworkExceptions.getDioException(e),
      ));
    }
  }
}