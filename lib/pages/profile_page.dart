import 'package:crime/models/user_model.dart';

import '../screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userModel;
  const ProfilePage({Key? key, required this.userModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name.toString(), style: const TextStyle(color: Colors.black54),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userModel.photoUrl.toString()),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ProfileScreen(userModel: userModel,),
      ),
    );
  }
}
