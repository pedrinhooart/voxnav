import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const CustomTextField(
                hint: 'Nome',
              ),

              const SizedBox(height: 20),

              const CustomTextField(
                hint: 'Sobrenome',
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 58,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('BR +55'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    flex: 4,
                    child: CustomTextField(
                      hint: 'Número',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• Clique na caixa'),
                    SizedBox(height: 10),
                    Text('• Digite o nome'),
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