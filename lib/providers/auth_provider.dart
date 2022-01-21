import 'package:crime/models/auth_model.dart';
import 'package:crime/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthStateModel>((_) => AuthNotifier());