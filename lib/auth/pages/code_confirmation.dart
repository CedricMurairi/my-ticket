import 'package:flutter/material.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';

import '../../shared/form_field.dart';
import '../../shared/rounded_styled_button.dart';
import '../../shared/text_button.dart';
import '../widgets/auth_message.dart';

class CodeConfirmation extends StatelessWidget {
  final String headerText;
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  final TextEditingController thirdNumberController = TextEditingController();
  final TextEditingController fourthNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  CodeConfirmation({this.headerText = "", Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings?.arguments ??
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
                        horizontal: 8.0, vertical: 5),
                    child: Text(
                      arguments['headerText'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomFormField(
                          controller: firstNumberController,
                          hint: "",
                          keyboard: TextInputType.number,
                              radius: 10,
                              alignment: TextAlign.center,
                        )),
                        Expanded(
                            child: CustomFormField(
                          controller: secondNumberController,
                          hint: "",
                          keyboard: TextInputType.number,
                              radius: 10,
                              alignment: TextAlign.center,
                        )),
                        Expanded(
                            child: CustomFormField(
                          controller: thirdNumberController,
                          hint: "",
                          keyboard: TextInputType.number,
                              radius: 10,
                              alignment: TextAlign.center,
                        )),
                        Expanded(
                            child: CustomFormField(
                          controller: fourthNumberController,
                          hint: "",
                          keyboard: TextInputType.number,
                              radius: 10,
                              alignment: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                  RoundedStyledButton(
                    color: const Color.fromRGBO(217, 231, 203, 1),
                    child: const Text(
                      'Verify',
                      style: TextStyle(color: Colors.black),
                    ),
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
                  ),
                  AuthenticationMessage(
                    message: "Did not receive code?",
                    leading: CustomTextButton(
                        text: "Resend",
                        action: () {
                          return;
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
