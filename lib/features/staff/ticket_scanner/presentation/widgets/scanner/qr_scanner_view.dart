import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/scanner/scanner_view_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/scanner/scanner_controls_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/scanner/scanner_status_indicator_widget.dart';
import 'package:eventhub/features/staff/ticket_scanner/presentation/widgets/scanner/ticket_validation_dialogs.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';

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
    
    final userService = getIt<UserService>();
    final currentUser = userService.getCurrentUser()!; // Safe to use ! since auth is checked at splash
    _staffId = currentUser.uid;
    
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
          if (state.isScanning) {
            _resumeScanning();
          } else if (state.isValidating) {
            _pauseScanning();
          } else if (state.isTicketValidated &&
              state.validationResult != null) {
            TicketValidationDialogs.showValidationResult(
              context,
              state.validationResult!,
              widget.eventId,
              _staffId!,
              _resetScanner,
            );
          } else if (state.isCheckInSuccessful && state.checkInResult != null) {
            TicketValidationDialogs.showCheckInSuccess(
              context,
              state.checkInResult!,
              _resetScanner,
            );
          } else if (state.isCheckInFailed && state.validationResult != null) {
            TicketValidationDialogs.showCheckInFailed(
              context,
              state.validationResult!,
              _resetScanner,
            );
          } else if (state.hasError && state.errorMessage.isNotEmpty) {
            TicketValidationDialogs.showError(
              context,
              state.errorMessage,
              _resetScanner,
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: _controller != null
                  ? BlocBuilder<TicketScannerBloc, TicketScannerState>(
                      builder: (context, state) {
                        return ScannerViewWidget(
                          controller: _controller!,
                          onQRCodeDetected: _onQRCodeDetected,
                          isScanning: _isScanning,
                          statusIndicator: ScannerStatusIndicatorWidget(state: state),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            Expanded(
              flex: 1,
              child: ScannerControlsWidget(
                onReset: _resetScanner,
                onGoToDashboard: _goToDashboard,
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