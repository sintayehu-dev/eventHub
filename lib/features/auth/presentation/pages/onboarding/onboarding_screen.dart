import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/constants/app_constants.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/features/auth/domain/user/user_service.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:math';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventhub/core/utils/bloc/speech_bloc.dart';

class CircularVoiceWave extends StatefulWidget {
  final int barCount;
  final double size;
  final Color color;

  const CircularVoiceWave({
    this.barCount = 20,
    this.size = 120,
    this.color = Colors.blueAccent,
    super.key,
  });

  @override
  State<CircularVoiceWave> createState() => _CircularVoiceWaveState();
}

class _CircularVoiceWaveState extends State<CircularVoiceWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<double> _barHeights;

  @override
  void initState() {
    super.initState();
    _barHeights = List.generate(widget.barCount, (_) => 0.0);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {
          // Animate bar heights randomly for demo
          _barHeights = List.generate(
              widget.barCount, (_) => 20 + Random().nextDouble() * 40);
        });
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: _CircularWavePainter(
          barHeights: _barHeights,
          color: widget.color,
        ),
      ),
    );
  }
}

class _CircularWavePainter extends CustomPainter {
  final List<double> barHeights;
  final Color color;

  _CircularWavePainter({required this.barHeights, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2.2;
    final barWidth = 4.0;
    final barCount = barHeights.length;

    for (int i = 0; i < barCount; i++) {
      final angle = (2 * pi / barCount) * i;
      final barHeight = barHeights[i];
      final x1 = center.dx + radius * cos(angle);
      final y1 = center.dy + radius * sin(angle);
      final x2 = center.dx + (radius + barHeight) * cos(angle);
      final y2 = center.dy + (radius + barHeight) * sin(angle);

      final paint = Paint()
        ..color = color
        ..strokeWidth = barWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CircularWavePainter oldDelegate) =>
      oldDelegate.barHeights != barHeights;
}

// Modern, attractive animated circular waveform
class ModernCircularWave extends StatefulWidget {
  final int waveCount;
  final double size;
  final List<Color> waveColors;
  final Color centerColor;

  const ModernCircularWave({
    this.waveCount = 3,
    this.size = 180,
    this.waveColors = const [Color(0xFF6C63FF), Color(0xFF00C6FF)],
    this.centerColor = const Color(0xFF6C63FF),
    super.key,
  });

  @override
  State<ModernCircularWave> createState() => _ModernCircularWaveState();
}

class _ModernCircularWaveState extends State<ModernCircularWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _SolidCircleWavePainter(
              animationValue: _controller.value,
              waveCount: widget.waveCount,
              waveColors: widget.waveColors,
              centerColor: widget.centerColor,
            ),
            size: Size(widget.size, widget.size),
          );
        },
      ),
    );
  }
}

class _SolidCircleWavePainter extends CustomPainter {
  final double animationValue;
  final int waveCount;
  final List<Color> waveColors;
  final Color centerColor;

  _SolidCircleWavePainter({
    required this.animationValue,
    required this.waveCount,
    required this.waveColors,
    required this.centerColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final maxRadius = size.width / 2;
    final minRadius = size.width / 6;

    // Draw solid center circle
    final centerPaint = Paint()
      ..color = centerColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, minRadius, centerPaint);

    // Draw animated concentric waves
    for (int i = 0; i < waveCount; i++) {
      final progress = ((animationValue + i / waveCount) % 1.0);
      final radius = minRadius + (maxRadius - minRadius) * progress;
      final opacity = (1.0 - progress).clamp(0.0, 1.0);
      final color = waveColors[i % waveColors.length].withOpacity(opacity * 0.5);
      final wavePaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8.0 * (1 - progress) + 2.0;
      canvas.drawCircle(center, radius, wavePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SolidCircleWavePainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final OnboardingItem _item = OnboardingItem(
    description: "Hello and welcome to EventHub! We're excited to have you here. EventHub is your comprehensive platform for creating, managing, and coordinating events of all sizes. Whether you're planning a small gathering or a large conference, we provide the tools you need to make your events successful. Ready to begin organizing amazing events? Let's get started—just tap 'Register' to create your account and unlock your personalized event management experience.",
    icon: Icons.waving_hand,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpeechBloc(),
      child: _OnboardingContent(item: _item, onFinish: _onFinish),
    );
  }

  Future<void> _onFinish(BuildContext context) async {
    await LocalStorage.ensureInitialized();
    await LocalStorage.instance.setIsDoneOnboarding(true);
    context.goNamed(RouteName.login);
  }
}

class _OnboardingContent extends StatefulWidget {
  final OnboardingItem item;
  final Future<void> Function(BuildContext) onFinish;
  const _OnboardingContent({required this.item, required this.onFinish, Key? key}) : super(key: key);

  @override
  State<_OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<_OnboardingContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SpeechBloc>().add(SpeechEvent.speak(widget.item.description));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: BlocBuilder<SpeechBloc, SpeechState>(
                builder: (context, state) {
                  return ModernCircularWave(
                    waveCount: 3,
                    size: 180,
                    waveColors: [AppColors.primaryIndigo, AppColors.accentPurple],
                    centerColor: AppColors.primaryIndigo,
                  );
                },
              ),
            ),
            Positioned(
              top: 24,
              right: 24,
                child: TextButton(
                onPressed: () => widget.onFinish(context),
                  child: Text(
                    'Skip',
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryIndigo,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String description;
  final IconData icon;

  OnboardingItem({
    required this.description,
    required this.icon,
  });
} 
