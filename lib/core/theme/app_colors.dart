import 'package:flutter/material.dart';

/// EventHub palette.
///
/// Deep teal-navy for structure, warm orange for the single accent, peach for
/// soft highlights and a cool pale canvas so white cards float on it.
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF1D4E5F);
  static const Color primaryDark = Color(0xFF143846);
  static const Color primaryLight = Color(0xFF2F6C80);
  static const Color accent = Color(0xFFFFA43B);
  static const Color accentDark = Color(0xFFF08A12);
  static const Color peach = Color(0xFFFFE9D2);
  static const Color peachDeep = Color(0xFFFFD9B0);
  static const Color mint = Color(0xFFDDEFEA);
  static const Color sky = Color(0xFFDCEAF2);

  // Canvas
  static const Color background = Color(0xFFEEF3F4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color field = Color(0xFFF1F5F6);
  static const Color primaryContainer = Color(0xFFDCEBEE);

  // Text
  static const Color ink = Color(0xFF14303A);
  static const Color inkSoft = Color(0xFF6B7F86);
  static const Color onSurface = ink;

  // Lines
  static const Color line = Color(0xFFDDE6E8);

  // Basics
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color error = Color(0xFFD64545);
  static const Color success = Color(0xFF2E9E75);

  // Legacy names kept so existing widgets keep compiling; they now point at
  // the new palette.
  static const Color brown = ink;
  static const Color darkBrown = ink;
  static const Color lightBrown = inkSoft;
  static const Color accentPurple = primaryLight;
  static const Color lightIndigo = primaryLight;
  static const Color primaryIndigo = primary;
  static const Color darkIndigo = primaryDark;
  static const Color softGold = accent;
  static const Color chartGreen = success;
  static const Color chartOrange = accent;
  static const Color chartYellow = Color(0xFFF5C044);
  static const Color grey100 = Color(0xFFF1F5F6);
  static const Color grey200 = Color(0xFFE6EDEF);
  static const Color grey300 = line;
  static const Color grey400 = Color(0xFFB4C2C7);
  static const Color grey600 = inkSoft;

  static const LinearGradient chartGreenGradient = LinearGradient(
    colors: [chartGreen, Color(0xCC2E9E75), chartGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient chartOrangeGradient = LinearGradient(
    colors: [chartOrange, Color(0xCCFFA43B), chartOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Hero gradient used on the big teal cards and auth headers.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary, primaryDark],
  );

  static const Color metricCardBorder = white;
  static const Color metricCardShadow = Color(0x14143846);
  static const Color vitalsCardBorder = white;
  static const Color vitalsIconBgHeart = Color(0xFFE91E63);
  static const Color vitalsIconBgBP = Color(0xFF2196F3);
  static const Color vitalsIconBgSleep = Color(0xFF9C27B0);
  static const Color vitalsDivider = Color(0x331D4E5F);

  // Shimmer effect colors
  static const Color shimmerBase = Color(0xFFDCE5E8);
  static const Color shimmerHighlight = Color(0xFFF7FAFB);
  static const Color shimmerBaseDark = Color(0xFF1F3A45);
  static const Color shimmerHighlightDark = Color(0xFF2B4B58);

  /// Soft shadow for white cards floating on the canvas.
  static List<BoxShadow> get softShadow => const [
        BoxShadow(
          color: Color(0x14143846),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ];

  /// Returns a map of all colors used in the light theme for easy reference.
  static Map<String, dynamic> light() => {
        'white': white,
        'black': black,
        'surface': surface,
        'brown': ink,
        'darkBrown': ink,
        'lightBrown': inkSoft,
        'accentPurple': accentPurple,
        'lightIndigo': lightIndigo,
        'chartGreen': chartGreen,
        'chartOrange': chartOrange,
        'chartYellow': chartYellow,
        'error': error,
        'grey100': grey100,
        'grey200': grey200,
        'grey300': grey300,
        'grey400': grey400,
        'grey600': grey600,
        'primaryIndigo': primaryIndigo,
        'onSurface': ink,
        'primary': primary,
        'softGold': accent,
        'chartGreenGradient': chartGreenGradient,
        'chartOrangeGradient': chartOrangeGradient,
        'metricCardBorder': white,
        'metricCardShadow': metricCardShadow,
        'vitalsCardBorder': white,
        'vitalsIconBgHeart': vitalsIconBgHeart,
        'vitalsIconBgBP': vitalsIconBgBP,
        'vitalsIconBgSleep': vitalsIconBgSleep,
        'vitalsDivider': vitalsDivider,
        'darkIndigo': darkIndigo,
        'primaryContainer': primaryContainer,
        'shimmerBase': shimmerBase,
        'shimmerHighlight': shimmerHighlight,
      };

  /// Returns a map of all colors used in the dark theme for easy reference.
  static Map<String, dynamic> dark() => {
        'white': const Color(0xFF0E232B),
        'black': const Color(0xFFFFFFFF),
        'surface': const Color(0xFF16323D),
        'brown': const Color(0xFFF1F6F7),
        'darkBrown': const Color(0xFFE1EAEC),
        'lightBrown': const Color(0xFFA9BCC2),
        'accentPurple': const Color(0xFF5FA3B8),
        'lightIndigo': const Color(0xFF5FA3B8),
        'chartGreen': chartGreen,
        'chartOrange': chartOrange,
        'chartYellow': chartYellow,
        'error': const Color(0xFFFF7A7A),
        'grey100': const Color(0xFF1D3F4C),
        'grey200': const Color(0xFF1D3F4C),
        'grey300': const Color(0xFF244B5A),
        'grey400': const Color(0xFF3B6070),
        'grey600': const Color(0xFFA9BCC2),
        'primaryIndigo': const Color(0xFF5FA3B8),
        'onSurface': const Color(0xFFF1F6F7),
        'primary': const Color(0xFF5FB0C7),
        'softGold': accent,
        'chartGreenGradient': chartGreenGradient,
        'chartOrangeGradient': chartOrangeGradient,
        'metricCardBorder': const Color(0xFF244B5A),
        'metricCardShadow': const Color(0x33000000),
        'vitalsCardBorder': const Color(0xFF244B5A),
        'vitalsIconBgHeart': vitalsIconBgHeart,
        'vitalsIconBgBP': vitalsIconBgBP,
        'vitalsIconBgSleep': vitalsIconBgSleep,
        'vitalsDivider': const Color(0x335FA3B8),
        'darkIndigo': const Color(0xFF5FA3B8),
        'primaryContainer': const Color(0xFF1D3F4C),
        'shimmerBase': shimmerBaseDark,
        'shimmerHighlight': shimmerHighlightDark,
      };
}
