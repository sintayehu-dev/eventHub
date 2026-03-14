import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/ticket_purchase/domain/entities/ticket_entity.dart';

abstract class TicketWalletRepository {
  /// Get all user tickets organized by status
  Future<Either<NetworkExceptions, TicketWalletData>> getWalletTickets({
    required String userId,
  });

  /// Get upcoming tickets
  Future<Either<NetworkExceptions, List<TicketEntity>>> getUpcomingTickets({
    required String userId,
  });

  /// Get past tickets
  Future<Either<NetworkExceptions, List<TicketEntity>>> getPastTickets({
    required String userId,
  });

  /// Get tickets by status
  Future<Either<NetworkExceptions, List<TicketEntity>>> getTicketsByStatus({
    required String userId,
    required TicketStatus status,
  });

  /// Search tickets
  Future<Either<NetworkExceptions, List<TicketEntity>>> searchTickets({
    required String userId,
    required String query,
  });

  /// Stream wallet updates
  Stream<Either<NetworkExceptions, TicketWalletData>> watchWalletTickets({
    required String userId,
  });
}

class TicketWalletData {
  final List<TicketEntity> upcomingTickets;
  final List<TicketEntity> pastTickets;
  final List<TicketEntity> cancelledTickets;
  final int totalTickets;
  final int activeTickets;

  TicketWalletData({
    required this.upcomingTickets,
    required this.pastTickets,
    required this.cancelledTickets,
    required this.totalTickets,
    required this.activeTickets,
  });

  factory TicketWalletData.fromTickets(List<TicketEntity> tickets) {
    final now = DateTime.now();
    
    final upcoming = tickets
        .where((t) => t.isActive && t.eventDateTime.isAfter(now))
        .toList()
      ..sort((a, b) => a.eventDateTime.compareTo(b.eventDateTime));
    
    final past = tickets
        .where((t) => t.eventDateTime.isBefore(now))
        .toList()
      ..sort((a, b) => b.eventDateTime.compareTo(a.eventDateTime));
    
    final cancelled = tickets
        .where((t) => t.status == TicketStatus.cancelled || t.status == TicketStatus.refunded)
        .toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    
    final activeTickets = tickets.where((t) => t.isActive).length;

    return TicketWalletData(
      upcomingTickets: upcoming,
      pastTickets: past,
      cancelledTickets: cancelled,
      totalTickets: tickets.length,
      activeTickets: activeTickets,
    );
  }

  bool get hasUpcomingTickets => upcomingTickets.isNotEmpty;
  bool get hasPastTickets => pastTickets.isNotEmpty;
  bool get hasCancelledTickets => cancelledTickets.isNotEmpty;
  bool get isEmpty => totalTickets == 0;
}