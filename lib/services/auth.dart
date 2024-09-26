import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Create user object based on firebase user
  UserModel _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : UserModel();
  }

  // Auth change user stream
  Stream<UserModel> get user {
    // return _auth.authStateChanges().map((User? user) {
    //   if (user != null) {
    //     return _userFromFirebaseUser(user);
    //   } else {
    //     return UserModel();
    //   }
    // });
    return _auth.authStateChanges().map(_userFromFirebaseUser);
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
  Future signInWithEmailAndPass(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPass(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      await DatabaseService(uid: user?.uid)
          .updateUserData('0', 'New crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
