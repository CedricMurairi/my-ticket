import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      // index: NavigatorState.,
      child: Center(
        child: Text("Listings"),
      ),
    );
  }
}
