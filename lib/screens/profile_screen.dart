import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../models/user_model.dart';

class ProfileScreen extends ConsumerWidget {
  final UserModel userModel;
  const ProfileScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    return auth.isAuthenticating
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Logged in as ${userModel.email}"),
                TextButton(
                    onPressed: () => ref.read(authProvider.notifier).logOut(),
                    child: const Text('Log out'))
              ],
            ),
          );
  }
}
