import "package:flutter/material.dart";
import '../../shared/text_button.dart';

class AuthenticationLayout extends StatelessWidget {
  final bool leadingIsButton;
  final String leadingText;
  final String leadingRoute;
  final Widget child;

  const AuthenticationLayout(
      {Key? key,
      required this.child,
      required this.leadingIsButton,
      required this.leadingText,
      this.leadingRoute = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            leadingIsButton
                ? Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 40.0),
              // BackButton(color: Colors.black, onPressed: (){},),
                    child: CustomTextButton(
                      text: leadingText,
                      customFontSize: 20,
                      action: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                    child: Text(
                      leadingText,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
            Center(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
