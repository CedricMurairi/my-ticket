import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';
import '../../firebase/auth.dart';
import '../../shared/rounded_styled_button.dart';
import '../../shared/text_button.dart';
import '../widgets/auth_message.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int initialOption = 0;
  final List<String> loginOptions = ["Client", "Business", "Driver"];

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      leadingIsButton: false,
      leadingText: "Login",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/globe.svg'),
          RoundedStyledButton(
            color: const Color.fromRGBO(255, 224, 136, 0.7),
            child: const Text(
              "Continue with Phone",
              style: TextStyle(color: Colors.black),
            ),
            action: () {
              Navigator.pushNamed(context, '/login-with-phone');
            },
          ),
          RoundedStyledButton(
            border: true,
            borderColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/gmail-icon.svg'),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Continue with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            action:() async {
              User? user = await authenticateWithGoogle();
              if (user != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Signed as ${user.email}'),
                  ),
                );
                Navigator.pushNamed(context, '/client-home');
              }
            },
          ),
          AuthenticationMessage(
            message: "No account?",
            leading: CustomTextButton(
                text: 'Register',
                action: () {
                  Navigator.pushNamed(context, '/register');
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 35,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Color.fromRGBO(217, 231, 203, 0.3)),
              child: Row(
                children: [
                  for (int i = 0; i < loginOptions.length; i++)
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            initialOption = i;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: initialOption == i
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  color: Color.fromRGBO(217, 231, 203, 1),
                                )
                              : null,
                          child: Center(child: Text(loginOptions[i])),
                        ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
