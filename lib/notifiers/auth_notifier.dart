import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../models/auth_model.dart';
import '../providers/auth_provider.dart';

class AuthNotifier extends StateNotifier<AuthStateModel> {
  AuthNotifier(this.ref) : super(const AuthStateModel(isAuthenticating: false));

  final Ref ref;
  void isAuthenticating() {
     state = state.copyWith(isAuthenticating: !state.isAuthenticating);
  }

  Future<void> loginWithCredentials(String email, String password) async {
    try {
      final _authService = ref.read(authServiceProvider);
      final userNotifier = ref.read(userProvider.notifier);
      UserModel userModel = await _authService.loginWithCredentials(email, password);
      userNotifier.updateUser(UserModel(
        uid: userModel.uid,
        email: userModel.email,
        name: userModel.name,
        photoUrl: userModel.photoUrl,
      ));
      isAuthenticating();
    } catch(e) {
      print(e);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final _authService = ref.read(authServiceProvider);
      final userNotifier = ref.read(userProvider.notifier);
      isAuthenticating();
      UserModel userModel = await _authService.loginWithGoogle();
      userNotifier.updateUser(UserModel(
        uid: userModel.uid,
        email: userModel.email,
        name: userModel.name,
        photoUrl: userModel.photoUrl,
      ));
      isAuthenticating();
    } catch(e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    try {
      final _authService = ref.read(authServiceProvider);
      await _authService.logOut();
    } catch (e) {
      print(e);
    }
  }

}