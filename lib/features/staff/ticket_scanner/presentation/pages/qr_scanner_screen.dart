import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';
import 'package:eventhub/features/auth/application/auth_status/bloc/auth_status_bloc.dart';

class QRScannerScreen extends StatelessWidget {
  final String eventId;
  final String eventTitle;

  const QRScannerScreen({
    super.key,
    required this.eventId,
    required this.eventTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketScannerBloc>()
        ..add(const TicketScannerEvent.started()),
      child: QRScannerView(
        eventId: eventId,
        eventTitle: eventTitle,
      ),
    );
  }
}

class QRScannerView extends StatefulWidget {
  final String eventId;
  final String eventTitle;

  const QRScannerView({
    super.key,
    required this.eventId,
    required this.eventTitle,
  });

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  MobileScannerController? _controller;
  bool _isScanning = true;
  String? _staffId;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController();
    
    final authState = context.read<AuthStatusBloc>().state;
    _staffId = authState.user?.uid;
    
    context.read<TicketScannerBloc>().add(const TicketScannerEvent.started());
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QR Scanner',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              widget.eventTitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      body: BlocListener<TicketScannerBloc, TicketScannerState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            scanning: () => _resumeScanning(),
            validating: () => _pauseScanning(),
            ticketValidated: (validationResult) => _showValidationResult(validationResult),
            checkingIn: () {},
            checkInSuccess: (checkIn) => _showCheckInSuccess(checkIn),
            checkInFailed: (validationResult) => _showCheckInFailed(validationResult),
            statsLoaded: (stats, recentCheckIns) {},
            error: (error) => _showError(error.toString()),
          );
        },
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: _buildScannerView(),
            ),
            Expanded(
              flex: 1,
              child: _buildControlsSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannerView() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            if (_controller != null)
              MobileScanner(
                controller: _controller!,
                onDetect: _onQRCodeDetected,
              ),
            _buildScannerOverlay(),
            BlocBuilder<TicketScannerBloc, TicketScannerState>(
              builder: (context, state) {
                return Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: _buildStatusIndicator(state),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannerOverlay() {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Stack(
      children: [
        Positioned(
          top: 60,
          left: 60,
          child: _buildCornerBracket(isTopLeft: true),
        ),
        Positioned(
          top: 60,
          right: 60,
          child: _buildCornerBracket(isTopRight: true),
        ),
        Positioned(
          bottom: 60,
          left: 60,
          child: _buildCornerBracket(isBottomLeft: true),
        ),
        Positioned(
          bottom: 60,
          right: 60,
          child: _buildCornerBracket(isBottomRight: true),
        ),
        if (_isScanning)
          Center(
            child: Container(
              width: 200,
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCornerBracket({
    bool isTopLeft = false,
    bool isTopRight = false,
    bool isBottomLeft = false,
    bool isBottomRight = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.primary,
            width: isTopLeft || isTopRight ? 3 : 0,
          ),
          left: BorderSide(
            color: colorScheme.primary,
            width: isTopLeft || isBottomLeft ? 3 : 0,
          ),
          right: BorderSide(
            color: colorScheme.primary,
            width: isTopRight || isBottomRight ? 3 : 0,
          ),
          bottom: BorderSide(
            color: colorScheme.primary,
            width: isBottomLeft || isBottomRight ? 3 : 0,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(TicketScannerState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          state.when(
            initial: () => Icon(Icons.qr_code_scanner, color: colorScheme.primary, size: 16),
            loading: () => SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(colorScheme.primary),
              ),
            ),
            scanning: () => Icon(Icons.qr_code_scanner, color: Colors.green, size: 16),
            validating: () => SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(colorScheme.primary),
              ),
            ),
            ticketValidated: (_) => Icon(Icons.check_circle, color: Colors.green, size: 16),
            checkingIn: () => SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(colorScheme.primary),
              ),
            ),
            checkInSuccess: (_) => Icon(Icons.check_circle, color: Colors.green, size: 16),
            checkInFailed: (_) => Icon(Icons.error, color: colorScheme.error, size: 16),
            statsLoaded: (_, __) => Icon(Icons.qr_code_scanner, color: colorScheme.primary, size: 16),
            error: (_) => Icon(Icons.error, color: colorScheme.error, size: 16),
          ),
          const SizedBox(width: 8),
          Text(
            state.when(
              initial: () => 'Ready to scan',
              loading: () => 'Loading...',
              scanning: () => 'Scanning for QR codes',
              validating: () => 'Validating ticket...',
              ticketValidated: (_) => 'Ticket validated',
              checkingIn: () => 'Checking in...',
              checkInSuccess: (_) => 'Check-in successful',
              checkInFailed: (_) => 'Check-in failed',
              statsLoaded: (_, __) => 'Ready to scan',
              error: (_) => 'Error occurred',
            ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlsSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Align ticket QR code within the frame',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'The scanner will automatically detect and validate tickets',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildControlButton(
                icon: Icons.refresh,
                label: 'Reset',
                onTap: _resetScanner,
              ),
              _buildControlButton(
                icon: Icons.dashboard,
                label: 'Dashboard',
                onTap: _goToDashboard,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: colorScheme.primary,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRCodeDetected(BarcodeCapture capture) {
    if (!_isScanning || _staffId == null) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final qrCode = barcodes.first.rawValue;
      if (qrCode != null) {
        print('QR Code detected: $qrCode'); // Debug log
        context.read<TicketScannerBloc>().add(
          TicketScannerEvent.scanQRCode(
            qrCode: qrCode,
            eventId: widget.eventId,
            staffId: _staffId!,
          ),
        );
      }
    }
  }

  void _showValidationResult(TicketValidationResult result) {
    if (result.isValid) {
      _showValidTicketDialog(result);
    } else {
      _showInvalidTicketDialog(result);
    }
  }

  void _showValidTicketDialog(TicketValidationResult result) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Valid Ticket'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.ticketHolderName != null) ...[
              Text('Holder: ${result.ticketHolderName}'),
              const SizedBox(height: 4),
            ],
            if (result.ticketTypeName != null) ...[
              Text('Type: ${result.ticketTypeName}'),
              const SizedBox(height: 4),
            ],
            if (result.eventTitle != null) ...[
              Text('Event: ${result.eventTitle}'),
              const SizedBox(height: 4),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetScanner();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<TicketScannerBloc>().add(
                TicketScannerEvent.checkInTicket(
                  ticketId: result.ticketId,
                  eventId: widget.eventId,
                  staffId: _staffId!,
                ),
              );
            },
            child: const Text('Check In'),
          ),
        ],
      ),
    );
  }

  void _showInvalidTicketDialog(TicketValidationResult result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 8),
            Text(result.status.displayName),
          ],
        ),
        content: Text(result.errorMessage ?? result.status.description),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetScanner();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showCheckInSuccess(CheckInEntity checkIn) {
    // Navigate to success screen or show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Check-in successful!'),
        backgroundColor: Colors.green,
      ),
    );
    _resetScanner();
  }

  void _showCheckInFailed(TicketValidationResult result) {
    _showInvalidTicketDialog(result);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $message'),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
    _resetScanner();
  }

  void _resetScanner() {
    setState(() {
      _isScanning = true;
    });
    context.read<TicketScannerBloc>().add(const TicketScannerEvent.resetScanner());
  }

  void _pauseScanning() {
    setState(() {
      _isScanning = false;
    });
  }

  void _resumeScanning() {
    setState(() {
      _isScanning = true;
    });
  }

  void _goToDashboard() {
    // Navigate back or to a placeholder dashboard
    context.pop();
  }
}