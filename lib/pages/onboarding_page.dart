import 'package:flutter/material.dart';
import '../screens/onboarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnboardingScreen(),
      ),
    );
  }
}
