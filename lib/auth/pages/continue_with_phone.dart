import 'package:flutter/material.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';
import 'package:my_ticket/auth/widgets/auth_message.dart';
import 'package:my_ticket/shared/form_field.dart';
import 'package:my_ticket/shared/rounded_styled_button.dart';
import 'package:my_ticket/shared/text_button.dart';

class ContinueWithPhone extends StatelessWidget {
  ContinueWithPhone({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void register() {
      Map<String, String> clientData = {
        "name": nameController.value.text,
        "phone": phoneNumberController.value.text,
        "password": passwordController.value.text,
      };
      debugPrint(clientData.toString());
      Navigator.pushNamed(context, "/verify-number", arguments: {
        "headerText": "Confirm with the code to register your account",
        "action": "register"
      });
    }

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
                    controller: nameController,
                    keyboard: TextInputType.name,
                    hint: "Name",
                  ),
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
                  RoundedStyledButton(
                    color: const Color.fromRGBO(217, 231, 203, 1),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        register();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
                  ),
                  AuthenticationMessage(
                    message: "Already have an account?",
                    leading: CustomTextButton(
                        text: "Login",
                        action: () {
                          Navigator.pushNamed(context, '/login');
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
