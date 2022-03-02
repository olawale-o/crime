import 'package:crime/providers/profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import 'dart:async';

import '../providers/auth_provider.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(this.ref) : super(const UserModel(uid: ''));
  // myController.sink.add(const UserModel(uid: ''));

  final Ref ref;

  // StreamController<UserModel?> myController = StreamController<UserModel>();

  // Stream<UserModel?> get myStream => myController.stream;

  Future<void> updateUser(UserModel user) async {
    state = state.copyWith(
      uid: user.uid,
      email: user.email,
      name: user.name,
      photoUrl: user.photoUrl,
    );
    // myController.sink.add(state);
  }

  Future<void> getMyProfile(String email) async {
    final currentUserToken = await ref.watch(firebaseAuthServiceProvider).currentUserToken;
    final profileService = ref.read(profileServiceProvider);
    var map = {'email': email, 'token': currentUserToken};
    updateUser(await profileService.getMyProfile(map));
  }
}