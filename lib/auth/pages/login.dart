import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:my_ticket/models/user.dart';
import 'package:provider/provider.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';
import 'package:my_ticket/firebase/auth.dart';
import 'package:my_ticket/shared/rounded_styled_button.dart';
import 'package:my_ticket/shared/text_button.dart';
import 'package:my_ticket/auth/widgets/auth_message.dart';

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
      child: Consumer<UserModel>(
        builder: (context, user, _) => Column(
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
              action: () {
                authenticateWithGoogle().then((value) {
                  user.getUser().then((value) => null);
                  if (user.user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Signed in with Google'),
                      ),
                    );
                    Navigator.pushReplacementNamed(context, '/listings');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('There was a problem, try again.'),
                      ),
                    );
                  }
                });
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
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
