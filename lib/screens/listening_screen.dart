import 'package:flutter/material.dart';

import '../widgets/logo_widget.dart';
import '../widgets/microphone_circle.dart';

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const LogoWidget(),

              const SizedBox(height: 40),

              const Text(
                'Como podemos ajudar?',
                style: TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 10),

              const Text(
                'Diga “sair VoxNav” para sair.',
              ),

              const SizedBox(height: 40),

              const MicrophoneCircle(
                animated: true,
              ),

              const SizedBox(height: 30),

              const Text(
                'Estou ouvindo...',
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF2F66F3),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Você disse:',
                      style: TextStyle(fontSize: 18),
                    ),

                    SizedBox(height: 12),

                    Text(
                      '“Salvar contato no WhatsApp”',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}