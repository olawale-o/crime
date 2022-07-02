import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/landing_page.dart';
import '../models/user_model.dart';
import '../pages/login_page.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _){
      final AsyncValue<User?> _user = ref.watch(authStateProvider);
      return _user.when(
        data: (data) {
          if (data == null) {
            return const LoginPage();
          }
          return LandingPage(
            userModel: UserModel(
              uid: data.uid,
              name: data.displayName,
              email: data.email,
              photoUrl: data.photoURL,
            ),);
        },
        error: (e, trace) {
          return const Center(child: Text('error'),);
        },
        loading: () {
          return const Center(child: CircularProgressIndicator(),);
        },
      );
    });
  }
}
