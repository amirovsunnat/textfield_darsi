import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.name,
    required this.password,
  });

  final String name;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME SCREEN"),
      ),
      body: Center(
        child: Text("$name va uning paroli: $password"),
      ),
    );
  }
}
