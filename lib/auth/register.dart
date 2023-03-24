import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextButton(
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        fixedSize: MaterialStatePropertyAll(Size(320, 55)),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(217, 231, 203, 1)),
                      ),
                      child: const Text(
                        "Continue as a Guest",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/client-home');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextButton(
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        fixedSize: MaterialStatePropertyAll(Size(320, 55)),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () async {
                        // User? user = await signInWithGoogle();
                        // if (user != null) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text('Signed as ${user.email}'),
                        //     ),
                        //   );
                        //   Navigator.pushReplacementNamed(
                        //       context, '/client-home');
                        // }
                        Navigator.pushReplacementNamed(context, '/client-home');
                      },
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
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextButton(
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        fixedSize: MaterialStatePropertyAll(Size(320, 55)),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/register-with-email');
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/email.png'),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Continue with Email',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: RichText(
                      text: const TextSpan(
                          text: 'Already have an account?',
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ]),
                    ),
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
