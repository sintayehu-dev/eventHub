import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    const scheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.accent,
      onSecondary: AppColors.ink,
      secondaryContainer: AppColors.peach,
      onSecondaryContainer: AppColors.ink,
      tertiary: AppColors.primaryLight,
      onTertiary: AppColors.white,
      tertiaryContainer: AppColors.mint,
      onTertiaryContainer: AppColors.ink,
      surface: AppColors.surface,
      onSurface: AppColors.ink,
      surfaceContainerHighest: AppColors.field,
      onSurfaceVariant: AppColors.inkSoft,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: Color(0xFFFCE4E4),
      onErrorContainer: AppColors.error,
      outline: AppColors.grey400,
      outlineVariant: AppColors.line,
      shadow: AppColors.primaryDark,
      scrim: AppColors.black,
      inverseSurface: AppColors.primaryDark,
      onInverseSurface: AppColors.white,
      inversePrimary: AppColors.accent,
      surfaceTint: Colors.transparent,
    );
    return _build(
      scheme: scheme,
      scaffold: AppColors.background,
      fieldFill: AppColors.field,
      ink: AppColors.ink,
    );
  }

  static ThemeData darkTheme() {
    final c = AppColors.dark();
    final scheme = ColorScheme.dark(
      primary: c['primary'] as Color,
      onPrimary: const Color(0xFF0E232B),
      primaryContainer: c['primaryContainer'] as Color,
      onPrimaryContainer: c['brown'] as Color,
      secondary: c['softGold'] as Color,
      onSecondary: const Color(0xFF0E232B),
      secondaryContainer: c['surface'] as Color,
      onSecondaryContainer: c['brown'] as Color,
      tertiary: c['lightIndigo'] as Color,
      onTertiary: const Color(0xFF0E232B),
      tertiaryContainer: c['surface'] as Color,
      onTertiaryContainer: c['brown'] as Color,
      surface: c['surface'] as Color,
      onSurface: c['brown'] as Color,
      surfaceContainerHighest: c['grey100'] as Color,
      onSurfaceVariant: c['grey600'] as Color,
      error: c['error'] as Color,
      onError: const Color(0xFF0E232B),
      errorContainer: c['surface'] as Color,
      onErrorContainer: c['error'] as Color,
      outline: c['grey400'] as Color,
      outlineVariant: c['grey300'] as Color,
      shadow: AppColors.black,
      scrim: AppColors.black,
      inverseSurface: c['brown'] as Color,
      onInverseSurface: c['surface'] as Color,
      inversePrimary: c['softGold'] as Color,
      surfaceTint: Colors.transparent,
    );
    return _build(
      scheme: scheme,
      scaffold: c['white'] as Color,
      fieldFill: c['grey100'] as Color,
      ink: c['brown'] as Color,
    );
  }

  static ThemeData _build({
    required ColorScheme scheme,
    required Color scaffold,
    required Color fieldFill,
    required Color ink,
  }) {
    final textTheme = _textTheme(ink, scheme.onSurfaceVariant);

    OutlineInputBorder border(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffold,
      canvasColor: scaffold,
      textTheme: textTheme,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        foregroundColor: scheme.onSurface,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: scheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, space: 1),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: fieldFill,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        hintStyle: textTheme.bodyMedium
            ?.copyWith(color: scheme.onSurfaceVariant.withValues(alpha: 0.7)),
        prefixIconColor: scheme.onSurfaceVariant,
        suffixIconColor: scheme.onSurfaceVariant,
        border: border(Colors.transparent),
        enabledBorder: border(Colors.transparent),
        focusedBorder: border(scheme.primary, 1.5),
        errorBorder: border(scheme.error),
        focusedErrorBorder: border(scheme.error, 1.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          iconColor: scheme.onPrimary,
          elevation: 0,
          minimumSize: const Size(64, 52),
          shape: const StadiumBorder(),
          textStyle:
              textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          iconColor: scheme.onPrimary,
          minimumSize: const Size(64, 52),
          shape: const StadiumBorder(),
          textStyle:
              textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          minimumSize: const Size(64, 52),
          side: BorderSide(color: scheme.outlineVariant, width: 1.5),
          shape: const StadiumBorder(),
          textStyle:
              textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle:
              textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: const StadiumBorder(),
        side: BorderSide.none,
        backgroundColor: scheme.surface,
        selectedColor: scheme.primary,
        labelStyle: textTheme.labelLarge,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle:
            textTheme.bodyMedium?.copyWith(color: scheme.onInverseSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(color: scheme.outline, width: 1.5),
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? scheme.primary : null,
        ),
      ),
    );
  }

  static TextTheme _textTheme(Color ink, Color muted) {
    final base = GoogleFonts.plusJakartaSansTextTheme();
    TextStyle? s(TextStyle? t, double size, FontWeight w,
            {double h = 1.3, double ls = 0, Color? color}) =>
        t?.copyWith(
          fontSize: size,
          fontWeight: w,
          height: h,
          letterSpacing: ls,
          color: color ?? ink,
        );
    return base.copyWith(
      displayLarge: s(base.displayLarge, 48, FontWeight.w800, h: 1.1),
      displayMedium: s(base.displayMedium, 40, FontWeight.w800, h: 1.12),
      displaySmall: s(base.displaySmall, 32, FontWeight.w800, h: 1.15),
      headlineLarge: s(base.headlineLarge, 30, FontWeight.w800, h: 1.2),
      headlineMedium: s(base.headlineMedium, 26, FontWeight.w800, h: 1.2),
      headlineSmall: s(base.headlineSmall, 22, FontWeight.w700, h: 1.25),
      titleLarge: s(base.titleLarge, 20, FontWeight.w700, h: 1.25),
      titleMedium: s(base.titleMedium, 16, FontWeight.w700, h: 1.3),
      titleSmall: s(base.titleSmall, 14, FontWeight.w600, h: 1.35),
      bodyLarge: s(base.bodyLarge, 16, FontWeight.w500, h: 1.5),
      bodyMedium: s(base.bodyMedium, 14, FontWeight.w500, h: 1.45),
      bodySmall:
          s(base.bodySmall, 12, FontWeight.w500, h: 1.4, color: muted),
      labelLarge: s(base.labelLarge, 14, FontWeight.w600, h: 1.3),
      labelMedium: s(base.labelMedium, 12, FontWeight.w600, h: 1.3),
      labelSmall: s(base.labelSmall, 11, FontWeight.w600, h: 1.3, ls: 0.2),
    );
  }
}

// Extension to add shimmer colors to ThemeData
extension ShimmerTheme on ThemeData {
  Color get shimmerBaseColor {
    return brightness == Brightness.light
        ? AppColors.shimmerBase
        : AppColors.shimmerBaseDark;
  }

  Color get shimmerHighlightColor {
    return brightness == Brightness.light
        ? AppColors.shimmerHighlight
        : AppColors.shimmerHighlightDark;
  }

  List<Color> get shimmerGradientColors {
    return [
      shimmerBaseColor,
      shimmerHighlightColor,
      shimmerBaseColor,
    ];
  }
}
