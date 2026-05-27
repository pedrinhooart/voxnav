import 'package:flutter/material.dart';

import '../widgets/logo_widget.dart';
import '../widgets/microphone_circle.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

import 'name_setup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(),

              const SizedBox(height: 30),

              const Text(
                'Bem-vindo!',
                style: TextStyle(fontSize: 28),
              ),

              const SizedBox(height: 10),

              const Text(
                'Eu vou te ajudar a usar o celular',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              const MicrophoneCircle(),

              const SizedBox(height: 50),

              PrimaryButton(
                text: 'COMEÇAR',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NameSetupScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              SecondaryButton(
                text: 'SAIR',
                icon: Icons.close,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saindo do aplicativo'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}