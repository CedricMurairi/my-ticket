import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:my_ticket/models/user.dart';
import 'package:my_ticket/shared/text_button.dart';

class AuthenticationLayout extends StatefulWidget {
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
  State<AuthenticationLayout> createState() => _AuthenticationLayoutState();
}

class _AuthenticationLayoutState extends State<AuthenticationLayout> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkUser();
  }

  void checkUser() {
    final user = Provider.of<UserModel>(context, listen: false);
    if (user.user != null) {
      Navigator.pushReplacementNamed(context, '/listings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            widget.leadingIsButton
                ? Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                    child: CustomTextButton(
                      text: widget.leadingText,
                      customFontSize: 20,
                      action: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                    child: Text(
                      widget.leadingText,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
            Center(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
