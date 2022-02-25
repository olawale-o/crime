import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/user_notifier.dart';
import '../models/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier(ref);
});

final userStreamProvider = StreamProvider.autoDispose<UserModel?>((ref) {
  final provider = ref.read(userProvider.notifier);
  return provider.myStream;
});