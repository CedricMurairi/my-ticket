import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/bottom_navigation.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({required this.child, Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You are not logged in'),
          ),
        );
        Navigator.pushNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: widget.child,
    );
  }
}
