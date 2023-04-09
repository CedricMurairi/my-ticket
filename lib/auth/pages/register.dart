import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_ticket/auth/widgets/auth_message.dart';
import 'package:my_ticket/shared/rounded_styled_button.dart';
import 'package:my_ticket/shared/text_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  Future<User?> signInWithGoogle() async {
    User? user;
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
      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // return await FirebaseAuth.instance.signInWithCredential(credential);
      user = userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        debugPrint("The account already exists with a different credential");
      } else if (e.code == 'invalid-credential') {
        debugPrint("Error occurred while accessing credentials. Try again.");
      }
    } catch (e) {
      debugPrint("Error occurred using Google Sign In. Try again.");
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0, left: 40.0),
              child: Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/man_bike.png'),
                  RoundedStyledButton(
                    disabled: true,
                    color: const Color.fromRGBO(217, 231, 203, 1),
                    child: const Text(
                      "Continue as a Guest",
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      Navigator.pushNamed(context, '/client-home');
                    },
                  ),
                  RoundedStyledButton(
                    color: const Color.fromRGBO(255, 224, 136, 0.7),
                    child: const Text(
                      "Continue with Phone",
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      return null;
                    },
                  ),
                  RoundedStyledButton(
                      border: true,
                      borderColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/gmail.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Continue with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      action: () async {
                        User? user = await signInWithGoogle();
                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Signed as ${user.email}'),
                            ),
                          );
                          Navigator.pushNamed(context, '/client-home');
                        }
                      }),
                  AuthenticationMessage(
                    message: "Already have an account?",
                    leading: CustomTextButton(text: 'Login', action: () {Navigator.pushNamed(context, '/login');}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
