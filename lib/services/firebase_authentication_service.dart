import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class FireAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  const FireAuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<String> get currentUserToken => _firebaseAuth.currentUser!.getIdToken() ;


  Future<UserModel> loginWithCredentials(String email, String password) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return UserModel(
        uid: _userCredential.user!.uid,
        email: _userCredential.user!.email,
        name: _userCredential.user!.displayName,
      );
    } catch(e) {
      print(e);
      return const UserModel(uid: '');
    }
  }

  Future<UserModel> createAccountWithCredentials(String email, String password) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return UserModel(
        uid: _userCredential.user!.uid,
        email: _userCredential.user!.email,
        name: _userCredential.user!.displayName,
      );
    } catch(e) {
      print(e);
      return const UserModel(uid: '');
    }
  }

  Future<UserModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return UserModel(
      uid: _firebaseAuth.currentUser!.uid,
      email: _firebaseAuth.currentUser!.email,
      name: _firebaseAuth.currentUser!.displayName,
      photoUrl: _firebaseAuth.currentUser!.photoURL,
    );
  }

  Future<void> logOut() async {
    try {
      await Future.wait([ _firebaseAuth.signOut(), GoogleSignIn().signOut() ]);
    } catch (e) {
      print(e);
    }
  }
}