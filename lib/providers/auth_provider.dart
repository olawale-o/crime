import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_model.dart';
import '../notifiers/auth_notifier.dart';
import '../services/authentication_service.dart';
import '../services/firebase_authentication_service.dart';
import '../services/http_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseAuthServiceProvider = Provider<FireAuthenticationService>((ref){
  return FireAuthenticationService(ref.read(firebaseAuthProvider));
});

final httpServiceProvider = Provider<HttpService>((_) => HttpService());

final authServiceProvider = Provider<AuthenticationService>((ref){
  return AuthenticationService(ref.read(httpServiceProvider));
});

final authStateProvider = StreamProvider<User?>((ref){
  return ref.watch(firebaseAuthServiceProvider).authStateChanges;
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthStateModel>((ref) => AuthNotifier(ref));