import 'package:flutter/material.dart';
import 'package:spotify_app/core/config/theme/app_theme.dart';
import 'package:spotify_app/presentation/slash/pages/slash.dart';

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
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SlashPage(),
    );
  }
}
