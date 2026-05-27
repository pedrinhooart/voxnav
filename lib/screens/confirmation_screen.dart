import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/microphone_circle.dart';
import '../widgets/primary_button.dart';
import 'listening_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext ThemeData) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  SizedBox(height: 20),
                  LogoWidget(),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Tudo pronto!',
                    style: Theme.of(ThemeData).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'É só falar:',
                    style: Theme.of(ThemeData).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      '“Olá VoxNav, meu nome é Pedro”',
                      style: Theme.of(ThemeData).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const MicrophoneCircle(),
                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    text: 'Testar Agora',
                    onPressed: () {
                      Navigator.push(
                        ThemeData,
                        MaterialPageRoute(builder: (context) => const ListeningScreen()),
                      );
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