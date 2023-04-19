import 'package:flutter/material.dart';

class SuccessPopUp extends StatelessWidget {
  final String message;
  final String description;

  const SuccessPopUp(
      {required this.message, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          Text(description),
        ],
      ),
    );
  }
}
