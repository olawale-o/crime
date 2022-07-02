import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final email = ref.read(authStateProvider).value!.email;
    return SingleChildScrollView(
      child: Column(
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
                ref.read(authProvider.notifier).createUserProfile(UserModel(
                    uid: '',
                    name: _usernameController.text,
                    email: email,
                    password: _passwordController.text))

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
      ),
    );
  }
}
