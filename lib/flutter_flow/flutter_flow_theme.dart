// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
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

  late Color choco100;
  late Color black100;
  late Color black50;
  late Color green100;
  late Color white100;
  late Color brown100;
  late Color brown4;
  late Color brown16;
  late Color green80;
  late Color green72;
  late Color green50;
  late Color green32;
  late Color green16;
  late Color green12;
  late Color green8;
  late Color green4;
  late Color red100;
  late Color red80;
  late Color red72;
  late Color red50;
  late Color red32;
  late Color red16;
  late Color red12;
  late Color red8;
  late Color red4;
  late Color neutral100;
  late Color neutral80;
  late Color neutral72;
  late Color neutral50;
  late Color neutral32;
  late Color neutral16;
  late Color neutral12;
  late Color neutral8;
  late Color neutral4;
  late Color brown80;
  late Color brown72;
  late Color brown50;
  late Color brown32;
  late Color brown12;
  late Color brown8;
  late Color black80;
  late Color black72;
  late Color black32;
  late Color black16;
  late Color black12;
  late Color black8;
  late Color black4;
  late Color choco80;
  late Color choco72;
  late Color choco50;
  late Color choco32;
  late Color choco16;
  late Color choco12;
  late Color choco8;
  late Color choco4;

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

  late Color primary = const Color(0xFF9D723B);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFF14181B);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color choco100 = const Color(0xFF9D723B);
  late Color black100 = const Color(0xFF151006);
  late Color black50 = const Color(0x80151006);
  late Color green100 = const Color(0xFF31AA2D);
  late Color white100 = const Color(0xFFFCFCFC);
  late Color brown100 = const Color(0xFF504239);
  late Color brown4 = const Color(0x09504239);
  late Color brown16 = const Color(0x28504239);
  late Color green80 = const Color(0xCD31AA2D);
  late Color green72 = const Color(0xB831AA2D);
  late Color green50 = const Color(0x8031AA2D);
  late Color green32 = const Color(0x5131AA2D);
  late Color green16 = const Color(0x2831AA2D);
  late Color green12 = const Color(0x1F31AA2D);
  late Color green8 = const Color(0x1531AA2D);
  late Color green4 = const Color(0x0B31AA2D);
  late Color red100 = const Color(0xFFAA3C2D);
  late Color red80 = const Color(0xCCAA3C2D);
  late Color red72 = const Color(0xB8AA3C2D);
  late Color red50 = const Color(0x80AA3C2D);
  late Color red32 = const Color(0x51AA3C2D);
  late Color red16 = const Color(0x2AAA3C2D);
  late Color red12 = const Color(0x1EAA3C2D);
  late Color red8 = const Color(0x15AA3C2D);
  late Color red4 = const Color(0x0BAA3C2D);
  late Color neutral100 = const Color(0xFFF8F7F7);
  late Color neutral80 = const Color(0xCDF8F7F7);
  late Color neutral72 = const Color(0xB7F8F7F7);
  late Color neutral50 = const Color(0x80F8F7F7);
  late Color neutral32 = const Color(0x52F8F7F7);
  late Color neutral16 = const Color(0x2AF8F7F7);
  late Color neutral12 = const Color(0x1FF8F7F7);
  late Color neutral8 = const Color(0x15F8F7F7);
  late Color neutral4 = const Color(0x0BF8F7F7);
  late Color brown80 = const Color(0xCD504239);
  late Color brown72 = const Color(0xB7504239);
  late Color brown50 = const Color(0x80504239);
  late Color brown32 = const Color(0x52504239);
  late Color brown12 = const Color(0x1F504239);
  late Color brown8 = const Color(0x14504239);
  late Color black80 = const Color(0xCC151006);
  late Color black72 = const Color(0xB8151006);
  late Color black32 = const Color(0x52151006);
  late Color black16 = const Color(0x29151006);
  late Color black12 = const Color(0x1F151006);
  late Color black8 = const Color(0x15151006);
  late Color black4 = const Color(0x0B151006);
  late Color choco80 = const Color(0xCB9E6F2E);
  late Color choco72 = const Color(0xB89E6F2E);
  late Color choco50 = const Color(0x809E6F2E);
  late Color choco32 = const Color(0x529E6F2E);
  late Color choco16 = const Color(0x299E6F2E);
  late Color choco12 = const Color(0x1E9E6F2E);
  late Color choco8 = const Color(0x159E6F2E);
  late Color choco4 = const Color(0x0B9E6F2E);
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

  String get displayLargeFamily => 'Proxima Nova';
  bool get displayLargeIsCustom => true;
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Proxima Nova';
  bool get displayMediumIsCustom => true;
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Proxima Nova';
  bool get displaySmallIsCustom => true;
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Proxima Nova';
  bool get headlineLargeIsCustom => true;
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Proxima Nova';
  bool get headlineMediumIsCustom => true;
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Proxima Nova';
  bool get headlineSmallIsCustom => true;
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Proxima Nova';
  bool get titleLargeIsCustom => true;
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Proxima Nova';
  bool get titleMediumIsCustom => true;
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Proxima Nova';
  bool get titleSmallIsCustom => true;
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Proxima Nova';
  bool get labelLargeIsCustom => true;
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Proxima Nova';
  bool get labelMediumIsCustom => true;
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Proxima Nova';
  bool get labelSmallIsCustom => true;
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Proxima Nova';
  bool get bodyLargeIsCustom => true;
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Proxima Nova';
  bool get bodyMediumIsCustom => true;
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Proxima Nova';
  bool get bodySmallIsCustom => true;
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Proxima Nova';
  bool get displayLargeIsCustom => true;
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Proxima Nova';
  bool get displayMediumIsCustom => true;
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Proxima Nova';
  bool get displaySmallIsCustom => true;
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Proxima Nova';
  bool get headlineLargeIsCustom => true;
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Proxima Nova';
  bool get headlineMediumIsCustom => true;
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Proxima Nova';
  bool get headlineSmallIsCustom => true;
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Proxima Nova';
  bool get titleLargeIsCustom => true;
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Proxima Nova';
  bool get titleMediumIsCustom => true;
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Proxima Nova';
  bool get titleSmallIsCustom => true;
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Proxima Nova';
  bool get labelLargeIsCustom => true;
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Proxima Nova';
  bool get labelMediumIsCustom => true;
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Proxima Nova';
  bool get labelSmallIsCustom => true;
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Proxima Nova';
  bool get bodyLargeIsCustom => true;
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Proxima Nova';
  bool get bodyMediumIsCustom => true;
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Proxima Nova';
  bool get bodySmallIsCustom => true;
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Proxima Nova';
  bool get displayLargeIsCustom => true;
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Proxima Nova';
  bool get displayMediumIsCustom => true;
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Proxima Nova';
  bool get displaySmallIsCustom => true;
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Proxima Nova';
  bool get headlineLargeIsCustom => true;
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Proxima Nova';
  bool get headlineMediumIsCustom => true;
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Proxima Nova';
  bool get headlineSmallIsCustom => true;
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Proxima Nova';
  bool get titleLargeIsCustom => true;
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Proxima Nova';
  bool get titleMediumIsCustom => true;
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Proxima Nova';
  bool get titleSmallIsCustom => true;
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Proxima Nova';
  bool get labelLargeIsCustom => true;
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Proxima Nova';
  bool get labelMediumIsCustom => true;
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Proxima Nova';
  bool get labelSmallIsCustom => true;
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Proxima Nova';
  bool get bodyLargeIsCustom => true;
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Proxima Nova';
  bool get bodyMediumIsCustom => true;
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Proxima Nova';
  bool get bodySmallIsCustom => true;
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Proxima Nova',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
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
