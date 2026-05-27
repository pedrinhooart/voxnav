import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/microphone_circle.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import 'name_setup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext ThemeData) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Topo com a Logo
              const Column(
                children: [
                  SizedBox(height: 20),
                  LogoWidget(),
                ],
              ),

              // Centro com Boas-vindas e Microfone
              Column(
                children: [
                  Text(
                    'Bem-vindo!',
                    style: Theme.of(ThemeData).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Eu vou te ajudar a usar o celular',
                    style: Theme.of(ThemeData).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  const MicrophoneCircle(),
                ],
              ),

              // Botões de Ação Inferiores
              Column(
                children: [
                  PrimaryButton(
                    text: 'COMEÇAR',
                    onPressed: () {
                      Navigator.push(
                        ThemeData,
                        MaterialPageRoute(builder: (context) => const NameSetupScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  SecondaryButton(
                    text: 'SAIR',
                    onPressed: () {
                      // Fecha o aplicativo
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}