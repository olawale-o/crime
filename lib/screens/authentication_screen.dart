import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, ref, _){
          final authState = ref.watch(authProvider);
          return Column(
            children: [
              TextField(
                controller: _emailController,
                onChanged: (value) => ref.read(authProvider.notifier).onEmailChanged(value),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    errorText: authState.email.invalid ? 'Invalid email' : null
                ),
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                onChanged: (value) => ref.read(authProvider.notifier).onPasswordChanged(value),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    errorText: authState.password.invalid ? 'Invalid password' : null
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
