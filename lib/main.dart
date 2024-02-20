import 'package:flutter/material.dart';
import 'package:photo_zone/feature/main_layout/main_layout.dart';
import 'package:photo_zone/feature/main_layout/src/main_layout_composer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainLayoutComposer.makeMainLayoutPage(),
    );
  }
}
