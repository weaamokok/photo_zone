import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/firebase_options.dart';
import 'package:photo_zone/local_storage/src/hive_init.dart';
import 'package:photo_zone/ui/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await initializeHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      // Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
      theme: FlexThemeData.light(
        bottomAppBarElevation: 0, fontFamily: 'Cairo',
        colors: const FlexSchemeColor(
          primary: Color(0xff1145a4),
          primaryContainer: Color(0xffacc7f6),
          secondary: Color(0xffb61d1d),
          secondaryContainer: Color(0xffec9f9f),
          tertiary: Color(0xff376bca),
          tertiaryContainer: Color(0xffcfdbf2),
          appBarColor: Color(0xffcfdbf2),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorBorderWidth: 1,defaultRadius:25 ,
          inputDecoratorRadius: 25,
          outlinedButtonRadius: 25,
          bottomSheetRadius: 0,
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
      ),
      darkTheme: FlexThemeData.dark(
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
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
