import 'package:flutter/material.dart';
import 'package:textfield_darsi/login_screen.dart';

void main() {
  runApp(const TextFieldDarsi());
}

class TextFieldDarsi extends StatelessWidget {
  const TextFieldDarsi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField darsi',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
