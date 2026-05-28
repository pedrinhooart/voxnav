import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? hintText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.hint,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // Aqui nós repassamos o controlador para o TextField original do Flutter
      controller: controller,
      decoration: InputDecoration(
        // Ele vai aceitar tanto "hint" quanto "hintText" para não quebrar outros lugares
        hintText: hintText ?? hint,
        
        // Dei uma pequena estilizada para ficar com cara de aplicativo moderno!
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}