import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/user_notifier.dart';
import '../models/user_model.dart';
import 'auth_provider.dart';
import 'profile_provider.dart';

final futureUserProvider = FutureProvider.family<UserModel, String?>((ref, email) async {
  final currentUserToken = await ref.watch(firebaseAuthServiceProvider).currentUserToken;
  final profileService = ref.read(profileServiceProvider);
  final userNotifier =  ref.read(userProvider.notifier);
  var map = {'email': email, 'token': currentUserToken};
  final futureUser = await profileService.getMyProfile(map);
  userNotifier.updateUser(UserModel(uid: futureUser.uid, name: futureUser.name, email: futureUser.email));
  return futureUser;
});

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier(ref);
});

final userStreamProvider = StreamProvider.autoDispose<UserModel?>((ref) {
  final provider = ref.read(userProvider.notifier);
  return provider.myStream;
});