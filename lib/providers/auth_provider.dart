import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_model.dart';
import '../notifiers/auth_notifier.dart';
import '../services/firebase_authentication_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = Provider<FireAuthenticationService>((ref){
  return FireAuthenticationService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref){
  return ref.watch(authServiceProvider).authStateChanges;
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthStateModel>((ref) => AuthNotifier(ref));