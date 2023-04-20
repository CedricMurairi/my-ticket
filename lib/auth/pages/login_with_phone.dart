import 'package:flutter/material.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';

import '../../shared/form_field.dart';
import '../../shared/rounded_styled_button.dart';
import '../../shared/text_button.dart';
import '../widgets/auth_message.dart';

class LoginWithPhone extends StatelessWidget {
  LoginWithPhone({Key? key}) : super(key: key);

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      leadingIsButton: true,
      leadingText: "Back",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomFormField(
                    controller: phoneNumberController,
                    keyboard: TextInputType.phone,
                    hint: "",
                    prefix: "+250",
                  ),
                  CustomFormField(
                    controller: passwordController,
                    keyboard: TextInputType.text,
                    obscure: true,
                    hint: "Password",
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomTextButton(
                          text: "Forgot password?",
                          action: () {
                            Navigator.pushNamed(context, "/forgot-password", arguments: {"headerText" : "Provide your number to reset your password",});
                          },
                        ),
                      ),
                    ],
                  ),
                  RoundedStyledButton(
                    color: const Color.fromRGBO(217, 231, 203, 1),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 5,
                            dismissDirection: DismissDirection.horizontal,
                            backgroundColor: Color.fromRGBO(217, 231, 203, 1),
                            content: Text(
                              'Phone Authentication Coming Soon',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  AuthenticationMessage(
                    message: "No account?",
                    leading: CustomTextButton(
                        text: "Register",
                        action: () {
                          Navigator.pushNamed(context, '/register');
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
