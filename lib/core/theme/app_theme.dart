import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        // Core EventHub colors
        primary: AppColors.primary, // EventHub purple
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryContainer, // Light purple container
        onPrimaryContainer: AppColors.onSurface,

        // Secondary colors (EventHub gold)
        secondary: AppColors.softGold, // EventHub gold
        onSecondary: AppColors.black,
        secondaryContainer: AppColors.grey100,
        onSecondaryContainer: AppColors.onSurface,

        // Tertiary colors (EventHub indigo)
        tertiary: AppColors.lightIndigo, // EventHub indigo
        onTertiary: AppColors.white,
        tertiaryContainer: AppColors.grey200,
        onTertiaryContainer: AppColors.onSurface,

        // Surface colors
        surface: AppColors.surface, // Light surface
        onSurface: AppColors.onSurface, // Dark text
        surfaceContainerHighest: AppColors.grey100,
        onSurfaceVariant: AppColors.grey600,

        // Error colors
        error: AppColors.error,
        onError: AppColors.white,
        errorContainer: AppColors.grey100,
        onErrorContainer: AppColors.error,

        // Outline colors
        outline: AppColors.grey400,
        outlineVariant: AppColors.grey300,

        // Other colors
        shadow: AppColors.black,
        scrim: AppColors.black,
        inverseSurface: AppColors.onSurface,
        onInverseSurface: AppColors.surface,
        inversePrimary: AppColors.softGold,
        surfaceTint: AppColors.primary,
      ),
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: const TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          height: 1.12,
        ),
        displayMedium: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.16,
        ),
        displaySmall: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.22,
        ),
        headlineLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.25,
        ),
        headlineMedium: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.29,
        ),
        headlineSmall: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.33,
        ),
        titleLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.27,
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.5,
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.5,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
        ),
        labelLarge: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
        ),
        labelMedium: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
        ),
        labelSmall: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
        ),
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  static ThemeData darkTheme() {
    // Get dark theme colors from AppColors.dark()
    final darkColors = AppColors.dark();
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        // Core EventHub colors for dark theme
        primary: darkColors['primary'], // Lighter purple for dark
        onPrimary: darkColors['black'],
        primaryContainer:
            darkColors['primaryContainer'], // Dark purple container
        onPrimaryContainer: darkColors['brown'],

        // Secondary colors (EventHub gold)
        secondary: darkColors['softGold'], // EventHub gold
        onSecondary: darkColors['black'],
        secondaryContainer: darkColors['surface'],
        onSecondaryContainer: darkColors['brown'],

        // Tertiary colors (EventHub indigo)
        tertiary: darkColors['lightIndigo'], // EventHub indigo
        onTertiary: darkColors['black'],
        tertiaryContainer: darkColors['surface'],
        onTertiaryContainer: darkColors['brown'],

        // Surface colors
        surface: darkColors['surface'], // Dark surface
        onSurface: darkColors['brown'], // Light text
        surfaceContainerHighest: darkColors['grey400'],
        onSurfaceVariant: darkColors['grey600'],

        // Error colors
        error: darkColors['error'],
        onError: darkColors['black'],
        errorContainer: darkColors['surface'],
        onErrorContainer: darkColors['error'],

        // Outline colors
        outline: darkColors['grey400'],
        outlineVariant: darkColors['grey300'],

        // Other colors
        shadow: darkColors['black'],
        scrim: darkColors['black'],
        inverseSurface: darkColors['brown'],
        onInverseSurface: darkColors['surface'],
        inversePrimary: darkColors['softGold'],
        surfaceTint: darkColors['primary'],
      ),
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          height: 1.12,
          color: darkColors['brown'],
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.16,
          color: darkColors['brown'],
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.22,
          color: darkColors['brown'],
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.25,
          color: darkColors['brown'],
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.29,
          color: darkColors['brown'],
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.33,
          color: darkColors['brown'],
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.27,
          color: darkColors['brown'],
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.5,
          color: darkColors['brown'],
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          color: darkColors['brown'],
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.5,
          color: darkColors['brown'],
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
          color: darkColors['brown'],
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
          color: darkColors['brown'],
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          color: darkColors['brown'],
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
          color: darkColors['brown'],
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
          color: darkColors['brown'],
        ),
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
