import 'package:flutter/cupertino.dart';

@immutable
class UserModel {
  final String uid;
  final String? email;
  final String? name;
  final String? photoUrl;

  const UserModel({
    required this.uid,
    this.email,
    this.name,
    this.photoUrl,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}