import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/scanner/qr_scanner_view.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/home/join_event_qr_scanner_widget.dart';

class QRScannerScreen extends StatelessWidget {
  final String? eventId;
  final String? eventTitle;
  final QRScannerMode mode;

  const QRScannerScreen({
    super.key,
    this.eventId,
    this.eventTitle,
    this.mode = QRScannerMode.ticketScan,
  });

  @override
  Widget build(BuildContext context) {
    if (mode == QRScannerMode.staffJoin) {
      return _StaffJoinQRScannerView();
    }

    return BlocProvider(
      create: (context) => getIt<TicketScannerBloc>()
        ..add(const TicketScannerEvent.started()),
      child: QRScannerView(
        eventId: eventId!,
        eventTitle: eventTitle!,
      ),
    );
  }
}

class _StaffJoinQRScannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Scan to Join Event',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _StaffJoinScannerBody(),
    );
  }
}

class _StaffJoinScannerBody extends StatefulWidget {
  @override
  State<_StaffJoinScannerBody> createState() => _StaffJoinScannerBodyState();
}

class _StaffJoinScannerBodyState extends State<_StaffJoinScannerBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'QR Scanner\nComing Soon',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Position the QR code within the frame',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // For demo purposes, simulate a successful scan
              Navigator.pop(context,
                  '{"type":"staff_join","eventId":"demo_event","staffMemberId":"demo_staff","email":"demo@example.com","timestamp":${DateTime.now().millisecondsSinceEpoch}}');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B5CF6),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Simulate Scan (Demo)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

