import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseAuthService {
  Future<User?> signInWithGoogle();

  Future<User?> signInWithFacebook();

  Future<User?> signInWithApple();

  Future<bool> signOut();

  bool isUserSignedIn();

  String? getCurrentSignedInUserEmail();
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  @override
  Future<User?> signInWithGoogle() async {
    try {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        UserCredential userCredentialResult = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredentialResult.user;
      } catch (e, stackTrace) {
        if (kDebugMode) {
          print('Error signInWithGoogle: $e, $stackTrace');
        }
        return null;
    }
  }

  @override
  Future<User?> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<User?> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error signInWithGoogle: $e, $stackTrace');
      }
      return false;
    }
  }

  @override
  String? getCurrentSignedInUserEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }

  @override
  bool isUserSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
