import "package:flutter/material.dart";

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function action;
  final double customFontSize;
  final Alignment alignment;
  final Color color;
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.action,
    this.customFontSize = 13,
    this.color = Colors.black,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            alignment: alignment,
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.all(
                const Color.fromRGBO(217, 231, 203, 0))),
        child: Text(text,
            style: TextStyle(
                fontSize: customFontSize,
                decoration: TextDecoration.underline,
                color: color)),
        onPressed: () => action());
  }
}
