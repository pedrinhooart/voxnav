import 'package:flutter/material.dart';
// Mantive seus pacotes antigos aqui para quando formos integrar o áudio real!
import 'package:flutter/services.dart';
import 'package:record/record.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Importando a tela inicial do seu novo design!
import 'screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // A inicialização do flutter_background_service deve ser feita aqui futuramente
  // initializeBackgroundService(); 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoxNav',
      debugShowCheckedModeBanner: false, // Remove a faixa "DEBUG" da tela
      theme: ThemeData(
        // Define o azul do VoxNav como cor principal do app
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F66F3)),
        useMaterial3: true,
        // Garante que o fundo de todas as telas seja branco
        scaffoldBackgroundColor: Colors.white,
      ),
      // Aqui está a mágica: Apontamos o início do app para a sua WelcomeScreen!
      home: const WelcomeScreen(),
    );
  }
}