import '../models/auth_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthStateModel> {
  AuthNotifier() : super(const AuthStateModel(isAuthenticating: false));

  void isAuthenticating() {
   state = state.copyWith(isAuthenticating: !state.isAuthenticating);
  }

}