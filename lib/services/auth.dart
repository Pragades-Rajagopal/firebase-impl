import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Create user object based on firebase user
  UserModel _userFromFirebaseUser(User user) {
    return UserModel(user.uid);
  }

  // Auth change user stream
  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  // Sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      if (user != null) {
        return _userFromFirebaseUser(user);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Signin with email and password

  // Register with email and password

  // Signout
}
