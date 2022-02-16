import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(this.ref) : super(const UserModel(uid: ''));

  final Ref ref;

  Future<void> updateUser(UserModel user) async {
    state = state.copyWith(
      uid: user.uid,
      email: user.email,
      name: user.name,
      photoUrl: user.photoUrl,
    );
  }
}