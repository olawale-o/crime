import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../providers/auth_provider.dart';
import '../models/user_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  final UserModel userModel;

  const ProfileScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Logged in as ${widget.userModel.email}"),
                TextButton(
                    onPressed: (){
                      ref.read(authProvider.notifier).logOut();
                      ref.read(userProvider.notifier).updateUser(const UserModel(uid: ''));
                    },
                    child: const Text('Log out'))
              ],
            ),
          );
  }
}
