import 'package:flutter/cupertino.dart';

@immutable
class UserModel {
  final String _uid;
  final String? _email;
  final String? _name;
  final String? _photoUrl;
  final String? _password;

  const UserModel({
    required String uid,
    String? email,
    String? name,
    String? photoUrl,
    String? password,
  })  : _uid = uid,
        _email = email,
        _name = name,
        _photoUrl = photoUrl,
        _password = password;

  String get uid => _uid;
  String? get email => _email;
  String? get name => _name;
  String? get photoUrl => _photoUrl;

  Map<String,dynamic> toJson() {
    final  Map<String,dynamic> data = {};
    if (name != null) data["name"] = name;
    if (email != null) data["email"] = email;
    if (_password != null) data["password"] = _password;
    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json["id"],
        email: json["email"],
        name: json["username"],
    );
  }

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
