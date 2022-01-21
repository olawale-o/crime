import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_model.dart';
import '../notifiers/auth_notifier.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthStateModel>((_) => AuthNotifier());