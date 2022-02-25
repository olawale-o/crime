import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../models/auth_model.dart';
import '../providers/auth_provider.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

class AuthNotifier extends StateNotifier<AuthStateModel> {
  AuthNotifier(this.ref) : super(const AuthStateModel(isAuthenticating: false));

  final Ref ref;
  void isAuthenticating() {
     state = state.copyWith(isAuthenticating: !state.isAuthenticating);
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(email: email, status: Formz.validate([email, state.password]));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(password: password, status: Formz.validate([password, state.email]));
  }

  Future<void> loginWithCredentials(String email, String password) async {
    try {
      final _firebaseAuthService = ref.read(firebaseAuthServiceProvider);
      final userNotifier = ref.read(userProvider.notifier);
      UserModel firebaseUser = await _firebaseAuthService.loginWithCredentials(email, password);
      UserModel user = await authenticate(
          UserModel(uid: '', email: firebaseUser.email, password: password)
      );
      userNotifier.updateUser(UserModel(
        uid: user.uid,
        email: user.email,
        name: user.name,
        photoUrl: user.photoUrl,
      ));
      isAuthenticating();
    } catch(e) {
      print(e);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final _firebaseAuthService = ref.read(firebaseAuthServiceProvider);
      final userNotifier = ref.read(userProvider.notifier);
      isAuthenticating();
      UserModel fireBaseUser = await _firebaseAuthService.loginWithGoogle();
      UserModel user = await thirdPartyAuthenticate(
          UserModel(uid: '', email: fireBaseUser.email, password: '')
      );
      userNotifier.updateUser(UserModel(
        uid: user.uid,
        email: user.email,
        name: user.name,
        photoUrl: user.photoUrl,
      ));
      isAuthenticating();
    } catch(e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    try {
      final userNotifier = ref.read(userProvider.notifier);
      final _authService = ref.read(firebaseAuthServiceProvider);
      await _authService.logOut();
      userNotifier.updateUser(const UserModel(uid: ''));
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel> authenticate(UserModel userModel) async {
    final authService = ref.read(authProvider.notifier);
    UserModel user = await authService.authenticate(userModel);
    return user;
  }

  Future<UserModel> thirdPartyAuthenticate(UserModel userModel) async {
    final authService = ref.read(authProvider.notifier);
    UserModel user = await authService.thirdPartyAuthenticate(userModel);
    return user;
  }
}