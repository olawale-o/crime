import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:crime/providers/loading_provider.dart';
import 'package:crime/providers/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(this.ref) : super(const UserModel(uid: ''));
    //myController.sink.add(UserModel(uid: _user.value!.uid, email: _user.value!.email));

  final Ref ref;

  StreamController<UserModel?> myController = StreamController<UserModel>();

  Stream<UserModel?> get myStream => myController.stream;

  void updateUser(UserModel user) {
    state = state.copyWith(
      uid: user.uid,
      email: user.email,
      name: user.name,
      photoUrl: user.photoUrl,
    );
    // myController.sink.add(state);
  }

  Future<void> getMyProfile(String email) async {
    final loadingController = ref.watch(loadingProvider.notifier);
    final currentUserToken = await ref.watch(firebaseAuthServiceProvider).currentUserToken;
    final profileService = ref.read(profileServiceProvider);
    var map = {'email': email, 'token': currentUserToken};
    loadingController.onLoading();
    updateUser(await profileService.getMyProfile(map));
    loadingController.onLoading();
  }
}