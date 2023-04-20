import 'package:flutter/material.dart';

void triggerBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    isDismissible: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}
