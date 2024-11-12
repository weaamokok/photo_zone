import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get appTheme => FlexThemeData.light(
        bottomAppBarElevation: 0, fontFamily: 'Cairo',
        colors: const FlexSchemeColor(
          primary: Color(0xffE6A4B4),
          primaryContainer: Color(0xffacc7f6),
          secondary: Color(0xffBFD8AF),
          secondaryContainer: Color(0xffB7C9F2),
          tertiary: Color(0xff376bca),
          tertiaryContainer: Color(0xffcfdbf2),
          appBarColor: Color(0xffcfdbf2),
          error: Color(0xffb00020),
        ),

        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,

        subThemesData: const FlexSubThemesData(
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorFillColor: Colors.white,
          inputDecoratorBorderSchemeColor: SchemeColor.secondary,
          inputDecoratorBorderWidth: 1,
          defaultRadius: 15,
          inputDecoratorRadius: 15,
          outlinedButtonRadius: 15,
          bottomSheetRadius: 0,
          elevatedButtonRadius: 10,
          elevatedButtonSchemeColor: SchemeColor.error,
          elevatedButtonElevation: 0,
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        fontFamily: 'Cairo',
        colors: const FlexSchemeColor(
          primary: Color(0xffc4d7f8),
          primaryContainer: Color(0xff577cbf),
          secondary: Color(0xfff1bbbb),
          secondaryContainer: Color(0xffcb6060),
          tertiary: Color(0xffdde5f5),
          tertiaryContainer: Color(0xff7297d9),
          appBarColor: Color(0xffdde5f5),
          error: null,
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}
