import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../pages/profile_page.dart';
import '../screens/firebase_auth_screen.dart';

class FirebaseAuthPage extends ConsumerWidget {
  const FirebaseAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: user.name == null ? const SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(8, 30, 8, 0),
          child: FirebaseAuthScreen()
      ): ProfilePage(
        userModel: UserModel(
          uid: user.uid,
          name: user.name,
          email: user.email,
          photoUrl: user.photoUrl,
        ),),
    );
  }
}
