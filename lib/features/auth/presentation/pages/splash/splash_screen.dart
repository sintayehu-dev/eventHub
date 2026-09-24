import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_bloc.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_event.dart';
import 'package:eventhub/features/auth/application/splash/bloc/splash_state.dart';

/// Cinematic intro: a dark stage with drifting light, rings pulsing out from
/// the mark, a light sweep across the logo and a tracked-out title reveal.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  /// One-shot timeline for the intro (0 → 1 over 3 seconds).
  late final AnimationController _intro;

  /// Endless ambient motion (drifting light, pulsing rings).
  late final AnimationController _ambient;

  @override
  void initState() {
    super.initState();
    _intro = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    _ambient = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _intro.dispose();
    _ambient.dispose();
    super.dispose();
  }

  /// Progress of a slice of the intro timeline, eased.
  double _phase(double begin, double end, [Curve curve = Curves.easeOutCubic]) {
    final t = ((_intro.value - begin) / (end - begin)).clamp(0.0, 1.0);
    return curve.transform(t);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) {
        final splashBloc = SplashBloc();
        Future.delayed(
          const Duration(milliseconds: 3200),
          () => splashBloc.add(const SplashEvent.checkUserStatus()),
        );
        return splashBloc;
      },
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (!state.isLoading && !state.isError && state.routeName != null) {
            context.goNamed(state.routeName!);
          }

          if (state.isError) {
            AppHelpers.showErrorSnackBar(
                context, 'Something went wrong. Please restart the app.');
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: const Color(0xFF07161C),
            body: AnimatedBuilder(
              animation: Listenable.merge([_intro, _ambient]),
              builder: (context, _) {
                final logo = _phase(0.10, 0.45, Curves.easeOutBack);
                final sweep = _phase(0.42, 0.75, Curves.easeInOutCubic);
                final title = _phase(0.38, 0.80);
                final tagline = _phase(0.62, 0.92);
                final progress = _phase(0.15, 1.0, Curves.easeInOutCubic);
                final stageIn = _phase(0.0, 0.35);

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Stage: deep gradient + drifting light + pulsing rings
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _StagePainter(
                          ambient: _ambient.value,
                          reveal: stageIn,
                        ),
                      ),
                    ),
                    // Vignette pulls the eye to the centre
                    Positioned.fill(
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              radius: 1.05,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.55),
                              ],
                              stops: const [0.45, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _Logo(scale: logo, sweep: sweep),
                                SizedBox(height: 36.h),
                                // Title: tracked-out reveal
                                Opacity(
                                  opacity: title,
                                  child: Transform.translate(
                                    offset: Offset(0, 16 * (1 - title)),
                                    child: Text(
                                      'ETHIO EVENTS',
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 14 - 9 * title,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14.h),
                                // Hairline that grows out from the centre
                                Container(
                                  width: 120.w * tagline,
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        AppColors.accent
                                            .withValues(alpha: 0.9),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14.h),
                                Opacity(
                                  opacity: tagline,
                                  child: Text(
                                    'WHERE EXPERIENCES CONNECT',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: AppColors.white
                                          .withValues(alpha: 0.65),
                                      letterSpacing: 3.2,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Slim loading line
                          Padding(
                            padding: EdgeInsets.only(bottom: 44.h),
                            child: Opacity(
                              opacity: _phase(0.15, 0.4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: SizedBox(
                                  width: 96.w,
                                  height: 3.h,
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    backgroundColor:
                                        AppColors.white.withValues(alpha: 0.12),
                                    color: AppColors.accent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Orange mark with a glow and a diagonal light sweep passing over it.
class _Logo extends StatelessWidget {
  const _Logo({required this.scale, required this.sweep});

  final double scale;
  final double sweep;

  @override
  Widget build(BuildContext context) {
    final size = 104.w;
    final radius = BorderRadius.circular(32.r);

    return Opacity(
      opacity: scale.clamp(0.0, 1.0),
      child: Transform.scale(
        scale: 0.55 + 0.45 * scale,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFC069), AppColors.accentDark],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.55 * scale),
                blurRadius: 60,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 30,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.confirmation_number_rounded,
                  size: 50.sp,
                  color: AppColors.white,
                ),
                // Light sweep
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-2.2 + 4.4 * sweep, -1),
                          end: Alignment(-1.2 + 4.4 * sweep, 1),
                          colors: [
                            Colors.white.withValues(alpha: 0),
                            Colors.white.withValues(alpha: 0.55),
                            Colors.white.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Paints the dark stage: gradient, slow drifting light pools and rings that
/// pulse outward from the centre.
class _StagePainter extends CustomPainter {
  _StagePainter({required this.ambient, required this.reveal});

  final double ambient; // 0..1, loops
  final double reveal; // 0..1, intro fade of the lights

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Base gradient
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0E2A35), Color(0xFF07161C), Color(0xFF040C10)],
        ).createShader(rect),
    );

    final a = ambient * 2 * math.pi;

    // Teal light pool, drifting top-left
    _glow(
      canvas,
      Offset(size.width * (0.25 + 0.06 * math.sin(a)),
          size.height * (0.22 + 0.04 * math.cos(a))),
      size.width * 0.75,
      AppColors.primaryLight.withValues(alpha: 0.35 * reveal),
    );

    // Warm orange pool, drifting bottom-right
    _glow(
      canvas,
      Offset(size.width * (0.80 + 0.05 * math.cos(a)),
          size.height * (0.78 + 0.04 * math.sin(a))),
      size.width * 0.70,
      AppColors.accent.withValues(alpha: 0.20 * reveal),
    );

    // Rings pulsing outward from the mark
    final center = Offset(size.width / 2, size.height * 0.44);
    final maxRadius = size.longestSide * 0.55;
    for (var i = 0; i < 3; i++) {
      final t = (ambient + i / 3) % 1.0;
      final radius = 70 + (maxRadius - 70) * Curves.easeOutQuad.transform(t);
      final fade = (1 - t) * reveal;
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..color = Colors.white.withValues(alpha: 0.10 * fade),
      );
    }
  }

  void _glow(Canvas canvas, Offset c, double radius, Color color) {
    canvas.drawCircle(
      c,
      radius,
      Paint()
        ..shader = RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
        ).createShader(Rect.fromCircle(center: c, radius: radius)),
    );
  }

  @override
  bool shouldRepaint(covariant _StagePainter old) =>
      old.ambient != ambient || old.reveal != reveal;
}
