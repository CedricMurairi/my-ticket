import 'package:flutter/material.dart';

class RoundedStyledButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool border;
  final bool disabled;
  final Color borderColor;
  final Function action;

  const RoundedStyledButton(
      {Key? key,
      required this.child,
      required this.action,
      this.color = Colors.white,
      this.border = false,
      this.disabled = false,
      this.borderColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                side: border
                    ? BorderSide(color: borderColor, width: 0.5)
                    : const BorderSide(color: Colors.white, width: 0),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
            ),
            fixedSize: const MaterialStatePropertyAll(Size(320, 55)),
            backgroundColor: MaterialStatePropertyAll(color),
          ),
          onPressed: () => action(),
          child: child,
        ),
      ),
    );
  }
}
