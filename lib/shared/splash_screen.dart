import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

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
      () => {
        if (FirebaseAuth.instance.currentUser == null)
          {
            Navigator.pushReplacementNamed(context, '/onboarding'),
          }
        else
          {
            Provider.of<UserModel>(context, listen: false)
                .setUser(FirebaseAuth.instance.currentUser),
            Navigator.pushReplacementNamed(context, '/listings')
          }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
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
        ));
  }
}
