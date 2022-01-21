import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(this.ref) : super(const UserModel(uid: ''));

  final Ref ref;

  Future<void> loginWithCredentials(String email, String password) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      UserCredential _userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      state = state.copyWith(
        uid: _userCredential.user!.uid,
        email: _userCredential.user!.email,
        name: _userCredential.user!.displayName,
      );
    } catch(e) {
      print(e);
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      state = state.copyWith(
          email: firebaseAuth.currentUser!.email,
          uid: firebaseAuth.currentUser!.uid,
          name: firebaseAuth.currentUser!.displayName
      );
    } catch(e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      await Future.wait([ firebaseAuth.signOut(), GoogleSignIn().signOut() ]);
    } catch (e) {
      print(e);
    }
  }
}