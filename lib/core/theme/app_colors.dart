import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  
  // Core palette (used in EventHub app)
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color surface = Color(0xFFF8F9FF);
  static const Color brown = Color(0xFF191C20);
  static const Color darkBrown = Color(0xFF000000);
  static const Color lightBrown = Color(0xFF43474E);
  static const Color accentPurple = Color(0xFF9575CD);
  static const Color lightIndigo = Color(0xFF7986CB);
  static const Color chartGreen = Color(0xFF4CAF50);
  static const Color chartOrange = Color(0xFFFF9800);
  static const Color chartYellow = Color(0xFFEAB308);
  static const Color error = Color(0xFFBA1A1A);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color primaryIndigo = Color(0xFF3F51B5);
  static const Color onSurface = Color(0xFF191C20);
  static const Color primary = Color(0xFF4A2A91);
  static const Color softGold = Color(0xFFEAB308);

  static const LinearGradient chartGreenGradient = LinearGradient(
    colors: [
      chartGreen,
      Color(0xCC4CAF50),
      chartGreen,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient chartOrangeGradient = LinearGradient(
    colors: [
      chartOrange,
      Color(0xCCFF9800),
      chartOrange,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color metricCardBorder = white;
  static const Color metricCardShadow =
      Color(0x14000000); // Black with 8% opacity
  static const Color vitalsCardBorder = white;
  static const Color vitalsIconBgHeart = Color(0xFFE91E63);
  static const Color vitalsIconBgBP = Color(0xFF2196F3);
  static const Color vitalsIconBgSleep = Color(0xFF9C27B0);
  static const Color vitalsDivider = Color(0x337986CB); // lightIndigo 20%
  static const Color darkIndigo = Color(0xFF303F9F);
  static const Color primaryContainer = Color(0xFFE9DDFF);
  
  // Shimmer effect colors
  static const Color shimmerBase = Color.fromARGB(255, 201, 202, 211);
  static const Color shimmerHighlight = Color(0xFFFFFFFF);
  static const Color shimmerBaseDark = Color.fromARGB(255, 62, 2, 131);
  static const Color shimmerHighlightDark = Color(0xFF1A0B2E);

  /// Returns a map of all colors used in the light theme for easy reference.
  static Map<String, dynamic> light() => {
        'white': Color(0xFFFFFFFF), // Pure white background
        'black': Color(0xFF000000), // Pure black for text/icons
        'surface': Color(0xFFF8F9FF), // Light surface for cards/surfaces
        'brown': Color(0xFF191C20), // Dark text color
        'darkBrown': Color(0xFF000000), // Pure black for strong emphasis
        'lightBrown': Color(0xFF43474E), // Grey for secondary text
        'accentPurple': Color(0xFF9575CD), // EventHub purple accent
        'lightIndigo': Color(0xFF7986CB), // EventHub indigo accent
        'chartGreen': Color(0xFF4CAF50), // Green for charts
        'chartOrange': Color(0xFFFF9800), // Orange for charts
        'chartYellow': Color(0xFFEAB308), // EventHub gold/yellow
        'error': Color(0xFFBA1A1A), // Error red
        'grey100': Color(0xFFF5F5F5), // Lightest grey
        'grey200': Color(0xFFEEEEEE),
        'grey300': Color(0xFFE0E0E0),
        'grey400': Color(0xFFBDBDBD),
        'grey600': Color(0xFF757575),
        'primaryIndigo': Color(0xFF3F51B5), // Primary indigo
        'onSurface': Color(0xFF191C20), // Text on surfaces
        'primary': Color(0xFF4A2A91), // EventHub primary purple
        'softGold': Color(0xFFEAB308), // EventHub gold
        'chartGreenGradient': chartGreenGradient,
        'chartOrangeGradient': chartOrangeGradient,
        'metricCardBorder': Color(0xFFFFFFFF),
        'metricCardShadow': Color(0x14000000),
        'vitalsCardBorder': Color(0xFFFFFFFF),
        'vitalsIconBgHeart': Color(0xFFE91E63),
        'vitalsIconBgBP': Color(0xFF2196F3),
        'vitalsIconBgSleep': Color(0xFF9C27B0),
        'vitalsDivider': Color(0x337986CB), // 20% indigo
        'darkIndigo': Color(0xFF303F9F),
        'primaryContainer': Color(0xFFE9DDFF),
        'shimmerBase': shimmerBase,
        'shimmerHighlight': shimmerHighlight,
      };

  /// Returns a map of all colors used in the dark theme for easy reference.
  static Map<String, dynamic> dark() => {
        'white': Color(0xFF1A0B2E), // EventHub dark background
        'black': Color(0xFFFFFFFF), // White for contrast
        'surface': Color(0xFF2A1B3D), // EventHub card/surface dark
        'brown': Color(0xFFFFFFFF), // White text for dark theme
        'darkBrown': Color(0xFFE1E2E8), // Light grey for emphasis
        'lightBrown': Color(0xFFBDBDBD), // Grey for secondary text
        'accentPurple': Color(0xFF9575CD), // EventHub purple accent
        'lightIndigo': Color(0xFF7986CB), // EventHub indigo accent
        'chartGreen': Color(0xFF4CAF50), // Green for charts
        'chartOrange': Color(0xFFFF9800), // Orange for charts
        'chartYellow': Color(0xFFEAB308), // EventHub gold/yellow
        'error': Color.fromARGB(255, 248, 25, 0), // Light error for dark theme
        'grey100': Color(0xFF2A1B3D), // Use surface for greys
        'grey200': Color(0xFF2A1B3D),
        'grey300': Color(0xFF2A1B3D),
        'grey400': Color(0xFF43474E), // Muted grey divider
        'grey600': Color(0xFFBDBDBD), // Light grey for icons
        'primaryIndigo': Color(0xFF7986CB), // Lighter indigo for dark
        'onSurface': Color(0xFFFFFFFF), // White text on dark surfaces
        'primary': Color(0xFF8B5CF6), // Lighter purple for dark theme
        'softGold': Color(0xFFEAB308), // EventHub gold
        'chartGreenGradient': chartGreenGradient,
        'chartOrangeGradient': chartOrangeGradient,
        'metricCardBorder': Color(0xFF2A1B3D),
        'metricCardShadow': Color(0x33000000),
        'vitalsCardBorder': Color(0xFF2A1B3D),
        'vitalsIconBgHeart': Color(0xFFE91E63),
        'vitalsIconBgBP': Color(0xFF2196F3),
        'vitalsIconBgSleep': Color(0xFF9C27B0),
        'vitalsDivider': Color(0x337986CB), // 20% indigo
        'darkIndigo': Color(0xFF7986CB),
        'primaryContainer': Color(0xFF2A1B3D),
        'shimmerBase': shimmerBaseDark,
        'shimmerHighlight': shimmerHighlightDark,
      };
}
