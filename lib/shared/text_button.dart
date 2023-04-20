import "package:flutter/material.dart";

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function action;
  final double customFontSize;
  const CustomTextButton({Key? key, required this.text, required this.action, this.customFontSize=13}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.all(
              const Color.fromRGBO(217, 231, 203, 1))),
      child: Text(text,
          style: TextStyle(
            fontSize: customFontSize,
              decoration: TextDecoration.underline, color: Colors.black)),
      onPressed: () => action()
    );
  }
}
