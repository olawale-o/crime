import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

class FirebaseAuthScreen extends ConsumerStatefulWidget {
  const FirebaseAuthScreen({Key? key}) : super(key: key);

  @override
  _FirebaseAuthScreenState createState() => _FirebaseAuthScreenState();
}

class _FirebaseAuthScreenState extends ConsumerState<FirebaseAuthScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Column(
        children: [
          TextField(
            controller: _usernameController,
            onChanged: (value) =>
                ref.read(authProvider.notifier).onUsernameChanged(value),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Username',
                errorText:
                authState.username.invalid ? 'Invalid username' : null),
          ),
          TextField(
            controller: _emailController,
            onChanged: (value) =>
                ref.read(authProvider.notifier).onEmailChanged(value),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Email',
                errorText:
                authState.email.invalid ? 'Invalid email' : null),
          ),
          TextField(
            obscureText: true,
            controller: _passwordController,
            onChanged: (value) =>
                ref.read(authProvider.notifier).onPasswordChanged(value),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                errorText:
                authState.password.invalid ? 'Invalid password' : null),
          ),
          Container(
            margin:
            const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
            child: TextButton(
              onPressed: () => {
                ref.read(authProvider.notifier).loginWithCredentials(
                  _emailController.text, _passwordController.text, _usernameController.text
                )
              },
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Create'),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                primary: Colors.black38,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
  }
}
