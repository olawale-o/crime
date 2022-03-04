import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../screens/profile_screen.dart';

class ProfilePage extends ConsumerWidget {
  final UserModel userModel;
  const ProfilePage({Key? key, required this.userModel }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name ?? "Username", style: const TextStyle(color: Colors.black54),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: userModel.photoUrl != null ? CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userModel.photoUrl.toString()),
            ) : const CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/avatar.jpg"),),
          )
        ],
      ),
      body: SafeArea(
        child: ProfileScreen(userModel: userModel,),
      ),
    );
  }
}
