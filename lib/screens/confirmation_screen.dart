import 'package:flutter/material.dart';

import '../widgets/logo_widget.dart';
import '../widgets/microphone_circle.dart';
import '../widgets/primary_button.dart';

import 'listening_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

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

              const SizedBox(height: 50),

              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFE7F8EB),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 50,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Tudo pronto!',
                style: TextStyle(fontSize: 26),
              ),

              const SizedBox(height: 10),

              const Text('É só falar:'),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  '“Olá VoxNav”',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const MicrophoneCircle(),

              const Spacer(),

              PrimaryButton(
                text: 'Testar Agora',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ListeningScreen(),
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