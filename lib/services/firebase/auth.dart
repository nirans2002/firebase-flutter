import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/screens/login_paage.dart';

String verfID = '';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser; // getter for current user

  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges(); // stream of auth changes

  Stream<User?> get idTokenChanges =>
      _firebaseAuth.idTokenChanges(); // stream of id token changes

  Stream<User?> get userChanges =>
      _firebaseAuth.userChanges(); // stream of user changes

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

  // verify phone no
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        verfID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyCode({required String OTP}) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verfID, smsCode: OTP);

    // Sign the user in (or link) with the credential
    await _firebaseAuth.signInWithCredential(credential);
  }

// sign out

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
