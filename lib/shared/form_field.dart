import "package:flutter/material.dart";

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String prefix;
  final String hint;
  final TextInputType keyboard;
  final bool obscure;
  final double radius;
  final TextAlign alignment;
  final bool enabled;

  const CustomFormField(
      {required this.controller,
      required this.hint,
      required this.keyboard,
      this.obscure = false,
      this.prefix = "",
      this.radius = 25,
      this.enabled = true,
      this.alignment = TextAlign.left,
      Key? key})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool showPrefix = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      child: TextFormField(
        keyboardType: widget.keyboard,
        controller: widget.controller,
        obscureText: widget.obscure,
        textAlign: widget.alignment,
        readOnly: !widget.enabled,
        onTap: () {
          if (widget.prefix.isNotEmpty) {
            setState(() {
              showPrefix = true;
            });
          }
        },
        onChanged: (value) => setState(() {
          if (value.isNotEmpty) {
            showPrefix = true;
          }
        }),
        onEditingComplete: () => setState(() {
          if (widget.controller.text.isEmpty) {
            showPrefix = false;
          }
        }),
        decoration: InputDecoration(
          prefixText: showPrefix == true ? widget.prefix : null,
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
        ),
      ),
    );
  }
}
