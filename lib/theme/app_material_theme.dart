import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tema Material global (SnackBars, diálogos, inputs nativos, etc.).
/// Las pantallas FlutterFlow siguen usando [FlutterFlowTheme]; esto unifica
/// componentes que dependen de [Theme.of].
ThemeData buildAppLightTheme() {
  const primary = Color(0xFF6A1B1F);
  const secondary = Color(0xFF123857);
  const surface = Color(0xFFF8F6F4);
  const onSurface = Color(0xFF1A1D21);

  final base = ThemeData(brightness: Brightness.light, useMaterial3: false);
  final textTheme = GoogleFonts.outfitTextTheme(base.textTheme).apply(
    bodyColor: onSurface,
    displayColor: onSurface,
  );

  return base.copyWith(
    primaryColor: primary,
    scaffoldBackgroundColor: surface,
    textTheme: textTheme,
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: secondary,
      surface: surface,
      error: Color(0xFFE21C3D),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: onSurface,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: surface,
      foregroundColor: onSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: primary.withValues(alpha: 0.06)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: Color(0x33000000)),
        textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondary,
        textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF0F1F4),
      hintStyle: GoogleFonts.outfit(
        color: const Color(0xFF6B7280),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: GoogleFonts.outfit(
        color: const Color(0xFF4B5563),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E6EA)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE21C3D)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      contentTextStyle: GoogleFonts.outfit(
        fontSize: 15,
        height: 1.45,
        color: const Color(0xFF4B5563),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFF1F2937),
      contentTextStyle: GoogleFonts.outfit(color: Colors.white, fontSize: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: const Color(0xFFE2E6EA),
      thickness: 1,
      space: 1,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: WidgetStateProperty.all(false),
      trackVisibility: WidgetStateProperty.all(false),
      interactive: true,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        final c = primary.withValues(alpha: 0.35);
        if (states.contains(WidgetState.dragged)) return primary.withValues(alpha: 0.55);
        if (states.contains(WidgetState.hovered)) return primary.withValues(alpha: 0.45);
        return c;
      }),
    ),
  );
}

ThemeData buildAppDarkTheme() {
  const primary = Color(0xFFE07A88);
  const secondary = Color(0xFF5BA3D0);
  const surface = Color(0xFF111D28);
  const card = Color(0xFF182433);
  const onSurface = Color(0xFFF3F4F6);

  final base = ThemeData(brightness: Brightness.dark, useMaterial3: false);
  final textTheme = GoogleFonts.outfitTextTheme(base.textTheme).apply(
    bodyColor: onSurface,
    displayColor: onSurface,
  );

  return base.copyWith(
    primaryColor: primary,
    scaffoldBackgroundColor: surface,
    textTheme: textTheme,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,
      error: Color(0xFFFF6B7A),
      onPrimary: Color(0xFF1A0508),
      onSecondary: Color(0xFF0A1620),
      onSurface: onSurface,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: surface,
      foregroundColor: onSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: card,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primary,
        foregroundColor: const Color(0xFF1A0508),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.22)),
        textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondary,
        textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E2A3A),
      hintStyle: GoogleFonts.outfit(color: const Color(0xFF9CA3AF), fontSize: 15),
      labelStyle: GoogleFonts.outfit(color: const Color(0xFFD1D5DB), fontWeight: FontWeight.w500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: card,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      contentTextStyle: GoogleFonts.outfit(
        fontSize: 15,
        height: 1.45,
        color: const Color(0xFFD1D5DB),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFF0F172A),
      contentTextStyle: GoogleFonts.outfit(color: onSurface, fontSize: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: card,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white.withValues(alpha: 0.1),
      thickness: 1,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: WidgetStateProperty.all(false),
      trackVisibility: WidgetStateProperty.all(false),
      interactive: true,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.dragged)) {
          return primary.withValues(alpha: 0.75);
        }
        if (states.contains(WidgetState.hovered)) {
          return primary.withValues(alpha: 0.55);
        }
        return primary.withValues(alpha: 0.4);
      }),
    ),
  );
}
