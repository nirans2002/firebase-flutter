import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser; // getter for current user

  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges(); // stream of auth changes


//  email and password

// sign in with email and password

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

// sign up with email and password

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }


// sign out
  
    Future<void> signOut() async {
      await _firebaseAuth.signOut();
    }
}
