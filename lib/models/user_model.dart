import 'package:flutter/cupertino.dart';

@immutable
class UserModel {
  final String uid;
  final String? email;
  final String? name;

  const UserModel({ required this.uid, this.email, this.name});

  UserModel copyWith({ String? uid, String? email, String? name }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}