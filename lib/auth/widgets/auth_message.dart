import "package:flutter/material.dart";

class AuthenticationMessage extends StatelessWidget {
  final String message;
  final Widget leading;

  const AuthenticationMessage(
      {Key? key, required this.message, required this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          leading,
        ],
      ),
    );
  }
}
