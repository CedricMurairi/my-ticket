import 'package:flutter/material.dart';

import '../../shared/form_field.dart';
import '../../shared/rounded_styled_button.dart';
import '../../shared/text_button.dart';
import '../layout/auth_layout.dart';
import '../widgets/auth_message.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final TextEditingController phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;

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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Text(
                      arguments['headerText'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomFormField(
                    controller: phoneNumberController,
                    keyboard: TextInputType.phone,
                    hint: "Phone number",
                    prefix: "+250",
                  ),
                  RoundedStyledButton(
                    color: const Color.fromRGBO(217, 231, 203, 1),
                    child: const Text(
                      'Send code',
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/verify-number',
                            arguments: {
                              "headerText":
                                  "Confirm with the code to reset your password",
                              "action": "reset-pass"
                            });
                      }
                    },
                  ),
                  AuthenticationMessage(
                    message: "No Account?",
                    leading: CustomTextButton(
                        text: "Register",
                        action: () {
                          Navigator.pushNamed(context, "/register");
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
