import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../models/user.dart';
import '../../shared/text_button.dart';

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
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(Duration.zero, () {
        Provider.of<UserModel>(context, listen: false)
            .setUser(FirebaseAuth.instance.currentUser);
        Navigator.pushReplacementNamed(context, '/listings');
      });
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
