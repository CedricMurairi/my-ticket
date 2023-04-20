import 'package:flutter/material.dart';
import 'package:my_ticket/auth/layout/auth_layout.dart';
import 'package:my_ticket/helpers/trigger_bottom_sheet.dart';

import '../../shared/form_field.dart';
import '../../shared/rounded_styled_button.dart';
import '../../shared/text_button.dart';
import '../widgets/auth_message.dart';
import '../widgets/success_popup.dart';

class CodeConfirmation extends StatefulWidget {
  const CodeConfirmation({Key? key}) : super(key: key);

  @override
  State<CodeConfirmation> createState() => _CodeConfirmationState();
}

class _CodeConfirmationState extends State<CodeConfirmation> {
  final TextEditingController firstNumberController = TextEditingController();

  final TextEditingController secondNumberController = TextEditingController();

  final TextEditingController thirdNumberController = TextEditingController();

  final TextEditingController fourthNumberController = TextEditingController();

  bool showSuccessPopUp = false;

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
                        if (arguments["action"] == "register") {
                          triggerBottomSheet(
                              context,
                              const SuccessPopUp(
                                  message: "Account Registered\nSuccessfully",
                                  description:
                                      "Account registered successfully. Get up and running and verify your email later in settings.\nRedirecting to home page now."));
                        } else if (arguments["action"] == "reset-pass") {
                          Navigator.pushNamed(context, "/reset-password");
                        }
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
