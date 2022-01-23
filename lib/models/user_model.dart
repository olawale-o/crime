import 'package:flutter/cupertino.dart';

@immutable
class UserModel {
  final String _uid;
  final String? _email;
  final String? _name;
  final String? _photoUrl;

  const UserModel({
    required String uid,
    String? email,
    String? name,
    String? photoUrl,
  })  : _uid = uid,
        _email = email,
        _name = name,
        _photoUrl = photoUrl;

  String get uid => _uid;
  String? get email => _email;
  String? get name => _name;
  String? get photoUrl => _photoUrl;

  UserModel copyWith(
      {String? uid, String? email, String? name, String? photoUrl}) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
