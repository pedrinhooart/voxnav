import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/logo_widget.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

import 'confirmation_screen.dart';

class NameSetupScreen extends StatelessWidget {
  const NameSetupScreen({super.key});

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

              const Text(
                'Como podemos te chamar?',
                style: TextStyle(fontSize: 22),
              ),

              const SizedBox(height: 30),

              const CustomTextField(
                hint: 'Digite seu nome aqui',
              ),

              const SizedBox(height: 30),

              const Text('OU'),

              const SizedBox(height: 30),

              SecondaryButton(
                text: 'Falar meu nome',
                onPressed: () {},
              ),

              const Spacer(),

              PrimaryButton(
                text: 'Continuar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ConfirmationScreen(),
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