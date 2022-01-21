import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../providers/user_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _){
      final AsyncValue<User?> _user = ref.watch(authStateProvider);;
      return _user.when(
        data: (data) {
          if (data == null) {
            return const LoginPage();
          }
          return const ProfilePage();
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


// class _GoogleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, _) {
//
//     });
//   }
//
//
// }