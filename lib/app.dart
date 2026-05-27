import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';

class VoxNavApp extends StatelessWidget {
  const VoxNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoxNav',
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}