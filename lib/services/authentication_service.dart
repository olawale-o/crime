import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  const AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();


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
}