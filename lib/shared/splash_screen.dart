import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_ticket/models/user.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => checkUser(),
    );
  }

  void checkUser() {
    final user = Provider.of<UserModel>(context, listen: false);
    user.getUser().then((value) {
      if (user.user != null) {
        Navigator.pushReplacementNamed(context, '/listings');
      } else {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
