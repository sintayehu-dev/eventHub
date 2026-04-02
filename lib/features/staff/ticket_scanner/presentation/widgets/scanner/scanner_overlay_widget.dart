import 'package:flutter/material.dart';

class ScannerOverlayWidget extends StatelessWidget {
  final bool isScanning;

  const ScannerOverlayWidget({
    super.key,
    required this.isScanning,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Stack(
      children: [
        Positioned(
          top: 60,
          left: 60,
          child: _buildCornerBracket(context, isTopLeft: true),
        ),
        Positioned(
          top: 60,
          right: 60,
          child: _buildCornerBracket(context, isTopRight: true),
        ),
        Positioned(
          bottom: 60,
          left: 60,
          child: _buildCornerBracket(context, isBottomLeft: true),
        ),
        Positioned(
          bottom: 60,
          right: 60,
          child: _buildCornerBracket(context, isBottomRight: true),
        ),
        if (isScanning)
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

  Widget _buildCornerBracket(
    BuildContext context, {
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
}