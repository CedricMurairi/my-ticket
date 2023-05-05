import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';
import 'package:my_ticket/auth/widgets/auth_message.dart';
import 'package:my_ticket/shared/rounded_styled_button.dart';
import 'package:my_ticket/shared/text_button.dart';
import 'package:flutter_svg/svg.dart';
import '../../firebase/auth.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(q
      leadingIsButton: false,
      leadingText: 'Register',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/man_on_bike.svg'),
          RoundedStyledButton(
            disabled: true,
            color: const Color.fromRGBO(217, 231, 203, 1),
            child: const Text(
              "Continue as a Guest",
              style: TextStyle(color: Colors.black),
            ),
            action: () {},
          ),
          RoundedStyledButton(
            color: const Color.fromRGBO(255, 224, 136, 0.7),
            child: const Text(
              "Continue with Phone",
              style: TextStyle(color: Colors.black),
            ),
            action: () {
              Navigator.pushNamed(context, '/continue-with-phone');
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
              action: () async {
                User? user = await authenticateWithGoogle();
                if (user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Signed as ${user.email}'),
                    ),
                  );
                  Navigator.pushNamed(context, '/listings');
                }
              }),
          AuthenticationMessage(
            message: "Already have an account?",
            leading: CustomTextButton(
                text: 'Login',
                action: () {
                  Navigator.pushNamed(context, '/login');
                }),
          ),
        ],
      ),
    );
  }
}
