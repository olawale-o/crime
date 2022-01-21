import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0),
          child: TextButton(
            onPressed: () => ref.read(userProvider.notifier).loginWithGoogle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                    image: AssetImage('assets/google_logo.png'),
                    height: 35,
                    width: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Login with google',),
                ),
              ],
            ),
            style: TextButton.styleFrom(
              primary: Colors.black38,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
