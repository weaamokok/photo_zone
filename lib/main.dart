import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photo_zone/deps.dart';
import 'package:photo_zone/firebase_options.dart';
import 'package:photo_zone/local_storage/src/hive_init.dart';
import 'package:photo_zone/ui/route.dart';
import 'package:photo_zone/utils/theme.dart';

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
      theme: AppTheme.appTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
