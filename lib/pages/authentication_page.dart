import 'package:flutter/material.dart';
import '../screens/authentication_screen.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: const AuthenticationScreen(),
    );
  }
}
