import "package:flutter/material.dart";

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String prefix;
  final String hint;
  final TextInputType keyboard;
  final bool obscure;
  const CustomFormField({required this.controller, required this.hint, required this.keyboard, this.obscure=false, this.prefix="", Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixText: prefix,
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
      ),
    );
  }
}
