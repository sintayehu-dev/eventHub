import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';
import 'package:eventhub/features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart';
import 'package:eventhub/features/attendee/ticket_purchase/infrastructure/datasources/firebase_ticket_data_source.dart';

@Injectable(as: TicketWalletRepository)
class TicketWalletRepositoryImpl implements TicketWalletRepository {
  final FirebaseTicketDataSource _firebaseDataSource;

  TicketWalletRepositoryImpl({
    required FirebaseTicketDataSource firebaseDataSource,
  }) : _firebaseDataSource = firebaseDataSource;

  @override
  Future<Either<NetworkExceptions, TicketWalletData>> getWalletTickets({
    required String userId,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(userId: userId);
      final walletData = TicketWalletData.fromTickets(tickets);
      return Right(walletData);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> getUpcomingTickets({
    required String userId,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(userId: userId);
      final now = DateTime.now();
      final upcomingTickets = tickets
          .where((t) => t.isActive && t.eventDateTime.isAfter(now))
          .toList()
        ..sort((a, b) => a.eventDateTime.compareTo(b.eventDateTime));
      
      return Right(upcomingTickets);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> getPastTickets({
    required String userId,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(userId: userId);
      final now = DateTime.now();
      final pastTickets = tickets
          .where((t) => t.eventDateTime.isBefore(now))
          .toList()
        ..sort((a, b) => b.eventDateTime.compareTo(a.eventDateTime));
      
      return Right(pastTickets);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> getTicketsByStatus({
    required String userId,
    required TicketStatus status,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(userId: userId);
      final filteredTickets = tickets
          .where((t) => t.status == status)
          .toList()
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      
      return Right(filteredTickets);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, List<TicketEntity>>> searchTickets({
    required String userId,
    required String query,
  }) async {
    try {
      final tickets = await _firebaseDataSource.getUserTickets(userId: userId);
      final searchResults = tickets
          .where((t) => 
            t.eventTitle.toLowerCase().contains(query.toLowerCase()) ||
            t.eventLocation.toLowerCase().contains(query.toLowerCase()) ||
            t.ticketTypeName.toLowerCase().contains(query.toLowerCase())
          )
          .toList()
        ..sort((a, b) => b.eventDateTime.compareTo(a.eventDateTime));
      
      return Right(searchResults);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Stream<Either<NetworkExceptions, TicketWalletData>> watchWalletTickets({
    required String userId,
  }) {
    return _firebaseDataSource.watchUserTickets(userId: userId).map((tickets) {
      try {
        final walletData = TicketWalletData.fromTickets(tickets);
        return Right(walletData);
      } catch (e) {
        return Left(NetworkExceptions.getDioException(e));
      }
    });
  }
}