import 'package:flutter/material.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';
import 'package:my_ticket/auth/widgets/auth_message.dart';
import 'package:my_ticket/models/user.dart';
import 'package:my_ticket/shared/rounded_styled_button.dart';
import 'package:my_ticket/shared/text_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:my_ticket/firebase/auth.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context, listen: true);

    return AuthenticationLayout(
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
            action: () {
              authenticateWithGoogle().then((value) {
                user.getUser().then((value) => null);
                if (user.user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registered in with Google'),
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
