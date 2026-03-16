import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/repositories/ticket_scanner_repository.dart';
import 'package:eventhub/features/staff/ticket_scanner/infrastructure/datasources/firebase_ticket_scanner_data_source.dart';

@LazySingleton(as: TicketScannerRepository)
class TicketScannerRepositoryImpl implements TicketScannerRepository {
  final FirebaseTicketScannerDataSource _dataSource;

  TicketScannerRepositoryImpl({
    required FirebaseTicketScannerDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<NetworkExceptions, TicketValidationResult>> validateTicket({
    required String qrCode,
    required String eventId,
    required String staffId,
  }) async {
    try {
      final result = await _dataSource.validateTicket(
        qrCode: qrCode,
        eventId: eventId,
        staffId: staffId,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, CheckInEntity>> checkInTicket({
    required String ticketId,
    required String eventId,
    required String staffId,
    String? notes,
  }) async {
    try {
      final result = await _dataSource.checkInTicket(
        ticketId: ticketId,
        eventId: eventId,
        staffId: staffId,
        notes: notes,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, CheckInStats>> getCheckInStats({
    required String eventId,
    required String staffId,
  }) async {
    try {
      final result = await _dataSource.getCheckInStats(
        eventId: eventId,
        staffId: staffId,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }

  @override
  Future<Either<NetworkExceptions, List<CheckInEntity>>> getRecentCheckIns({
    required String eventId,
    required String staffId,
    int limit = 10,
  }) async {
    try {
      final result = await _dataSource.getRecentCheckIns(
        eventId: eventId,
        staffId: staffId,
        limit: limit,
      );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(NetworkExceptions.unexpectedError());
    }
  }
}