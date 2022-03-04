import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/login_page.dart';
import '../providers/loading_provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loadingProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        state.loading ?
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 50.0),
            child: const Center(child: CircularProgressIndicator())
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [LoginButton(), GoogleButton()],
        )
      ],
    );
  }
}

class BaseButton extends StatelessWidget {
  final String text;
  final String logo;
  final VoidCallback voidCallback;
  const BaseButton({Key? key, required this.text, required this.logo, required this.voidCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
      child: TextButton(
        onPressed: () => voidCallback(),
        child: Row(
          children: [
            Image(
              image: AssetImage(logo),
              height: 35,
              width: 35,
            ),
            const SizedBox(width: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(text),
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
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required}) : super(key: key);

@override
Widget build(BuildContext context) {
  return BaseButton(
      text: "Email and password",
      logo: "assets/avatar.jpg",
      voidCallback: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage())
        );
      }
  );
}
}

class GoogleButton extends ConsumerWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseButton(
      text: 'Google',
      logo:'assets/google_logo.png',
      voidCallback: ref.read(authProvider.notifier).loginWithGoogle,);
  }
}

class FaceBookButton extends ConsumerWidget {
  const FaceBookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseButton(
      text: 'Facebook',
      logo:'assets/google_logo.png',
      voidCallback: ref.read(authProvider.notifier).loginWithGoogle,);
  }
}
