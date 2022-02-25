import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import 'dart:async';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(this.ref) : super(const UserModel(uid: '')) {
    myController.sink.add(const UserModel(uid: ''));
  }

  final Ref ref;

  StreamController<UserModel?> myController = StreamController<UserModel>();

  Stream<UserModel?> get myStream => myController.stream;

  Future<void> updateUser(UserModel user) async {
    state = state.copyWith(
      uid: user.uid,
      email: user.email,
      name: user.name,
      photoUrl: user.photoUrl,
    );

    myController.sink.add(state);
  }

}