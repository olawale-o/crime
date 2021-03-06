import 'package:crime/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const SafeArea(
      child: Scaffold(
        body: SplashScreen(),
      ));
  }
}