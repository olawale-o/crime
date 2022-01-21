import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: () => ref.read(userProvider.notifier).loginWithGoogle(), //notifier.loginWithGoogle(),
            child: const Text(
              'Log in',
            ),
            style: TextButton.styleFrom(
              primary: Colors.blueAccent,
              backgroundColor: Colors.black12,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
