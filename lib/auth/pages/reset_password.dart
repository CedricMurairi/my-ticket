import 'package:flutter/material.dart';
import 'package:my_ticket/auth/widgets/success_popup.dart';
import 'package:my_ticket/helpers/trigger_bottom_sheet.dart';

import '../../shared/form_field.dart';
import '../../shared/rounded_styled_button.dart';
import '../layout/auth_layout.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

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
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Text(
                          "Reset your password now",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  CustomFormField(
                    controller: passwordController,
                    keyboard: TextInputType.text,
                    obscure: true,
                    hint: "New Password",
                  ),
                  CustomFormField(
                    controller: repeatPasswordController,
                    keyboard: TextInputType.text,
                    obscure: true,
                    hint: "Confirm Password",
                  ),
                  RoundedStyledButton(
                    color: const Color.fromRGBO(217, 231, 203, 1),
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        triggerBottomSheet(
                            context,
                            const SuccessPopUp(
                                message: "Password Reset\nSuccessfully",
                                description:
                                    "Your password was reset successfully.\nYou can now login with your new password. "));
                      }
                    },
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
