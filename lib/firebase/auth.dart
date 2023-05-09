import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> authenticateWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  try {
    await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'account-exists-with-different-credential') {
      debugPrint("The account already exists with a different credential");
    } else if (e.code == 'invalid-credential') {
      debugPrint("Error occurred while accessing credentials. Try again.");
    }
  } catch (e) {
    debugPrint("Error occurred using Google Sign In. Try again.");
  }
}
