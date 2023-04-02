// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flex(direction: Axis.horizontal, children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Name',
                floatingLabelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              validator: (String? value) {
                if (value == null) {
                  return "Enter name";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.always,
            ),
          ]),
        ],
      ),
    );
  }
}
