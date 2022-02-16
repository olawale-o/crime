import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/user_notifier.dart';
import '../models/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier(ref);
});
