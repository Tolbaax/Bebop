import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final double screenHeight;

  const LoginScreen({Key? key, required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
    );
  }
}
