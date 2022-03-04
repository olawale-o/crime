import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../models/user_model.dart';
import '../providers/loading_provider.dart';
import '../providers/profile_provider.dart';
import '../providers/user_provider.dart';
import '../models/auth_model.dart';
import '../providers/auth_provider.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';
import '../validators/username_validator.dart';

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

  void onUsernameChanged(String value) {
    final username = Username.dirty(value);
    state = state.copyWith(username: username, status: Formz.validate([username, state.password]));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(password: password, status: Formz.validate([password, state.username]));
  }

  Future<void> loginWithCredentials(String email, String password) async {
    final loadingController = ref.read(loadingProvider.notifier);
    loadingController.onLoading();
    try {
      final _firebaseAuthService = ref.read(firebaseAuthServiceProvider);
      final userNotifier = ref.read(userProvider.notifier);
      loadingController.onLoading();
      UserModel firebaseUser = await _firebaseAuthService.loginWithCredentials(email, password);
      UserModel user = await _createProfile(
          UserModel(uid: firebaseUser.uid, email: firebaseUser.email, password: password)
      );
      userNotifier.updateUser(UserModel(
        uid: user.uid,
        email: user.email,
        name: user.name,
        photoUrl: user.photoUrl,
      ));
      loadingController.onLoading();
    } catch(e) {
      print(e);
      loadingController.onLoading();
    }
  }

  Future<void> loginWithGoogle() async {
    final loadingController = ref.read(loadingProvider.notifier);
    loadingController.onLoading();
    try {
      final _firebaseAuthService = ref.read(firebaseAuthServiceProvider);
      final userNotifier = ref.read(userProvider.notifier);
      UserModel fireBaseUser = await _firebaseAuthService.loginWithGoogle();
      userNotifier.updateUser(UserModel(
        uid: fireBaseUser.uid,
        email: fireBaseUser.email,
      ));
      loadingController.onLoading();
    } catch(e) {
      print(e);
      loadingController.onLoading();
    }
  }

  Future<void> logOut() async {
    try {
      isAuthenticating();
      final _authService = ref.read(firebaseAuthServiceProvider);
      await _authService.logOut();
      isAuthenticating();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUserProfile(UserModel userModel) async {
    try {
      final userNotifier = ref.read(userProvider.notifier);
      isAuthenticating();
      UserModel user = await _createProfile(userModel);
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

  Future<UserModel> _createProfile(UserModel userModel) async  {
    final profileService = ref.read(profileServiceProvider);
    final currentUserToken = await ref.read(firebaseAuthServiceProvider).currentUserToken;
    var map = {'json': userModel.toJson(), 'token': currentUserToken};
    UserModel user = await profileService.createProfile(map);
    return user;
  }
}