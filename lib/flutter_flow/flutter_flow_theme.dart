// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primaryBtnText;
  late Color lineColor;
  late Color customColor1;
  late Color titulo;
  late Color resaltado;
  late Color backgroundComponents;
  late Color resaltadoAmarillo;
  late Color overlay;
  late Color btnText;
  late Color customColor3;
  late Color customColor4;
  late Color white;
  late Color background;
  late Color primary600;
  late Color secondary600;
  late Color tertiary600;
  late Color darkBGstatic;
  late Color secondary30;
  late Color overlay0;
  late Color primary30;
  late Color grayIcon;
  late Color gray200;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color textColor;
  late Color customVerde;
  late Color colorPromovido;
  late Color colorPromotor;
  late Color barra;
  late Color defensa;

  FFDesignTokens get designToken => FFDesignTokens(this);

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF6A1B1F);
  late Color secondary = const Color(0xFF123857);
  late Color tertiary = const Color(0xFFA96D51);
  late Color alternate = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF121820);
  late Color secondaryText = const Color(0xFF5A6573);
  late Color primaryBackground = const Color(0xFFF8F6F4);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1A3D84);

  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFFE2E6EA);
  late Color customColor1 = const Color(0xFF2FB73C);
  late Color titulo = const Color(0xFFFFFFFF);
  late Color resaltado = const Color(0xFFE02F27);
  late Color backgroundComponents = const Color(0xFF1D2428);
  late Color resaltadoAmarillo = const Color(0xFFFEFC42);
  late Color overlay = const Color(0xB3FFFFFF);
  late Color btnText = const Color(0xFFFFFFFF);
  late Color customColor3 = const Color(0xFFDF3F3F);
  late Color customColor4 = const Color(0xFF090F13);
  late Color white = const Color(0xFFFFFFFF);
  late Color background = const Color(0xFF1D2429);
  late Color primary600 = const Color(0xFF336A4A);
  late Color secondary600 = const Color(0xFFAB8A4F);
  late Color tertiary600 = const Color(0xFF0C2533);
  late Color darkBGstatic = const Color(0xFF0D1E23);
  late Color secondary30 = const Color(0x4D928163);
  late Color overlay0 = const Color(0x00FFFFFF);
  late Color primary30 = const Color(0x4D4B986C);
  late Color grayIcon = const Color(0xFF8892A0);
  late Color gray200 = const Color(0xFFDBE2E7);
  late Color gray600 = const Color(0xFF262D34);
  late Color black600 = const Color(0xFF090F13);
  late Color tertiary400 = const Color(0xFF39D2C0);
  late Color textColor = const Color(0xFF1E2429);
  late Color customVerde = const Color(0xFF62B9C3);
  late Color colorPromovido = const Color(0xFF6EC7CF);
  late Color colorPromotor = const Color(0xFFEFAA9C);
  late Color barra = const Color(0xFF411055);
  late Color defensa = const Color(0xFF6B0002);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Outfit';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 57.0,
        height: 1.05,
        letterSpacing: -0.6,
      );
  String get displayMediumFamily => 'Outfit';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 45.0,
        height: 1.08,
        letterSpacing: -0.5,
      );
  String get displaySmallFamily => 'Outfit';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 34.0,
        height: 1.1,
        letterSpacing: -0.35,
      );
  String get headlineLargeFamily => 'Outfit';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
        height: 1.15,
        letterSpacing: -0.35,
      );
  String get headlineMediumFamily => 'Outfit';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        height: 1.2,
        letterSpacing: -0.25,
      );
  String get headlineSmallFamily => 'Outfit';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        height: 1.25,
      );
  String get titleLargeFamily => 'Outfit';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        height: 1.25,
        letterSpacing: -0.15,
      );
  String get titleMediumFamily => 'Outfit';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        height: 1.3,
      );
  String get titleSmallFamily => 'Outfit';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        height: 1.35,
      );
  String get labelLargeFamily => 'Outfit';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        letterSpacing: 0.2,
      );
  String get labelMediumFamily => 'Outfit';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        letterSpacing: 0.15,
      );
  String get labelSmallFamily => 'Outfit';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 11.0,
        letterSpacing: 0.12,
      );
  String get bodyLargeFamily => 'Outfit';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.45,
        letterSpacing: 0.1,
      );
  String get bodyMediumFamily => 'Outfit';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.45,
        letterSpacing: 0.08,
      );
  String get bodySmallFamily => 'Outfit';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.outfit(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.45,
        letterSpacing: 0.08,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Outfit';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 57.0,
        height: 1.05,
        letterSpacing: -0.6,
      );
  String get displayMediumFamily => 'Outfit';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 45.0,
        height: 1.08,
        letterSpacing: -0.5,
      );
  String get displaySmallFamily => 'Outfit';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 34.0,
        height: 1.1,
        letterSpacing: -0.35,
      );
  String get headlineLargeFamily => 'Outfit';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
        height: 1.15,
        letterSpacing: -0.35,
      );
  String get headlineMediumFamily => 'Outfit';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        height: 1.2,
        letterSpacing: -0.25,
      );
  String get headlineSmallFamily => 'Outfit';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        height: 1.25,
      );
  String get titleLargeFamily => 'Outfit';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        height: 1.25,
        letterSpacing: -0.15,
      );
  String get titleMediumFamily => 'Outfit';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        height: 1.3,
      );
  String get titleSmallFamily => 'Outfit';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        height: 1.35,
      );
  String get labelLargeFamily => 'Outfit';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        letterSpacing: 0.2,
      );
  String get labelMediumFamily => 'Outfit';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        letterSpacing: 0.15,
      );
  String get labelSmallFamily => 'Outfit';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 11.0,
        letterSpacing: 0.12,
      );
  String get bodyLargeFamily => 'Outfit';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.45,
        letterSpacing: 0.1,
      );
  String get bodyMediumFamily => 'Outfit';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.45,
        letterSpacing: 0.08,
      );
  String get bodySmallFamily => 'Outfit';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.outfit(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.45,
        letterSpacing: 0.08,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Outfit';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 57.0,
        height: 1.05,
        letterSpacing: -0.6,
      );
  String get displayMediumFamily => 'Outfit';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 45.0,
        height: 1.08,
        letterSpacing: -0.5,
      );
  String get displaySmallFamily => 'Outfit';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 34.0,
        height: 1.1,
        letterSpacing: -0.35,
      );
  String get headlineLargeFamily => 'Outfit';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
        height: 1.15,
        letterSpacing: -0.35,
      );
  String get headlineMediumFamily => 'Outfit';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        height: 1.2,
        letterSpacing: -0.25,
      );
  String get headlineSmallFamily => 'Outfit';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        height: 1.25,
      );
  String get titleLargeFamily => 'Outfit';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        height: 1.25,
        letterSpacing: -0.15,
      );
  String get titleMediumFamily => 'Outfit';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        height: 1.3,
      );
  String get titleSmallFamily => 'Outfit';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        height: 1.35,
      );
  String get labelLargeFamily => 'Outfit';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        letterSpacing: 0.2,
      );
  String get labelMediumFamily => 'Outfit';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        letterSpacing: 0.15,
      );
  String get labelSmallFamily => 'Outfit';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 11.0,
        letterSpacing: 0.12,
      );
  String get bodyLargeFamily => 'Outfit';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.45,
        letterSpacing: 0.1,
      );
  String get bodyMediumFamily => 'Outfit';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.outfit(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.45,
        letterSpacing: 0.08,
      );
  String get bodySmallFamily => 'Outfit';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.outfit(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.45,
        letterSpacing: 0.08,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF732629);
  late Color secondary = const Color(0xFF1B4868);
  late Color tertiary = const Color(0xFFA96D51);
  late Color alternate = const Color(0xFF232F3C);
  late Color primaryText = const Color(0xFFF3F4F6);
  late Color secondaryText = const Color(0xFFB8C2CC);
  late Color primaryBackground = const Color(0xFF111D28);
  late Color secondaryBackground = const Color(0xFF0E151B);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1A3D84);

  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFF22282F);
  late Color customColor1 = const Color(0xFF2FB73C);
  late Color titulo = const Color(0xFFFFFFFF);
  late Color resaltado = const Color(0xFFE02F27);
  late Color backgroundComponents = const Color(0xFF1D2428);
  late Color resaltadoAmarillo = const Color(0xFFBED43D);
  late Color overlay = const Color(0xB314181B);
  late Color btnText = const Color(0xFFFFFFFF);
  late Color customColor3 = const Color(0xFFDF3F3F);
  late Color customColor4 = const Color(0xFF090F13);
  late Color white = const Color(0xFFFFFFFF);
  late Color background = const Color(0xFF1D2429);
  late Color primary600 = const Color(0xFF336A4A);
  late Color secondary600 = const Color(0xFFAB8A4F);
  late Color tertiary600 = const Color(0xFF0C2533);
  late Color darkBGstatic = const Color(0xFF0D1E23);
  late Color secondary30 = const Color(0x4D928163);
  late Color overlay0 = const Color(0x000B191E);
  late Color primary30 = const Color(0x4D4B986C);
  late Color grayIcon = const Color(0xFF9CA8B4);
  late Color gray200 = const Color(0xFFDBE2E7);
  late Color gray600 = const Color(0xFF262D34);
  late Color black600 = const Color(0xFF090F13);
  late Color tertiary400 = const Color(0xFF39D2C0);
  late Color textColor = const Color(0xFF1E2429);
  late Color customVerde = const Color(0xFF62B9C3);
  late Color colorPromovido = const Color(0xFF6EC7CF);
  late Color colorPromotor = const Color(0xFFEFAA9C);
  late Color barra = const Color(0xFF411055);
  late Color defensa = const Color(0xFF6B0002);
}

class FFDesignTokens {
  const FFDesignTokens(this.theme);
  final FlutterFlowTheme theme;
  FFSpacing get spacing => const FFSpacing();
  FFRadius get radius => const FFRadius();
  FFShadows get shadow => FFShadows(theme);
}

class FFSpacing {
  const FFSpacing();
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
}

class FFRadius {
  const FFRadius();
  double get sm => 10.0;
  double get md => 14.0;
  double get lg => 20.0;
  double get full => 9999.0;
}

class FFShadows {
  const FFShadows(this.theme);
  final FlutterFlowTheme theme;
  BoxShadow get sm => const BoxShadow(
      blurRadius: 10.0,
      color: Color(0x14000000),
      offset: Offset(0.0, 2.0),
      spreadRadius: 0.0);
  BoxShadow get md => const BoxShadow(
      blurRadius: 18.0,
      color: Color(0x18000000),
      offset: Offset(0.0, 6.0),
      spreadRadius: 0.0);
  BoxShadow get lg => const BoxShadow(
      blurRadius: 28.0,
      color: Color(0x1A000000),
      offset: Offset(0.0, 12.0),
      spreadRadius: 0.0);
  BoxShadow get xl => const BoxShadow(
      blurRadius: 36.0,
      color: Color(0x1F000000),
      offset: Offset(0.0, 18.0),
      spreadRadius: 0.0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
