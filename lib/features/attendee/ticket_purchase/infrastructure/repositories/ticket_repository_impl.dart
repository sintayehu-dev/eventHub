import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/repositories/ticket_repository.dart';
import 'package:eventhub/features/attendee/ticket_purchase/infrastructure/datasources/firebase_ticket_data_source.dart';

@Injectable(as: TicketRepository)
class TicketRepositoryImpl implements TicketRepository {
  final FirebaseTicketDataSource _firebaseDataSource;

  TicketRepositoryImpl(this._firebaseDataSource);

  @override
  Future<Either<NetworkExceptions, PurchaseResult>> purchaseTickets({
    required String userId,
    required PurchaseTicketRequest request,
  }) async {
    try {
      final result = await _firebaseDataSource.purchaseTickets(
        userId: userId,
        request: request,
      );
      return right(result);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> getUserTickets({
    required String userId,
    TicketStatus? status,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(
        userId: userId,
        status: status,
      );
      return right(tickets);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TicketEntity>> getTicketById({
    required String ticketId,
    required String userId,
  }) async {
    try {
      final ticket = await _firebaseDataSource.getTicketById(
        ticketId: ticketId,
        userId: userId,
      );
      return right(ticket);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TicketEntity>> cancelTicket({
    required String ticketId,
    required String userId,
    required String reason,
  }) async {
    try {
      final ticket = await _firebaseDataSource.cancelTicket(
        ticketId: ticketId,
        userId: userId,
        reason: reason,
      );
      return right(ticket);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, TicketEntity>> checkInTicket({
    required String qrCode,
    required String eventId,
  }) async {
    try {
      final ticket = await _firebaseDataSource.checkInTicket(
        qrCode: qrCode,
        eventId: eventId,
      );
      return right(ticket);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
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
      return right(tickets);
    } catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Stream<Either<NetworkExceptions, List<TicketEntity>>> watchUserTickets({
    required String userId,
  }) {
    try {
      return _firebaseDataSource
          .watchUserTickets(userId: userId)
          .map((tickets) => right<NetworkExceptions, List<TicketEntity>>(tickets))
          .handleError((error) {
        return Stream.value(left<NetworkExceptions, List<TicketEntity>>(
          NetworkExceptions.getDioException(error),
        ));
      });
    } catch (e) {
      return Stream.value(left<NetworkExceptions, List<TicketEntity>>(
        NetworkExceptions.getDioException(e),
      ));
    }
  }
}