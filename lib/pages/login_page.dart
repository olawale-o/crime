import 'package:crime/providers/user_provider.dart';
import 'package:crime/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          child: LoginScreen(),
        )
    );
  }
}
