import 'package:flutter/material.dart';
import 'package:my_ticket/shared/splash_screen.dart';
import 'package:my_ticket/shared/onbarding_screen.dart';
import 'package:my_ticket/auth/register.dart';
import 'package:my_ticket/client/pages/client_home.dart';
import 'package:my_ticket/client/pages/ticket.dart';
import 'package:my_ticket/auth/register_with_email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Itike App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const Onboarding(),
        '/register': (context) => const Register(),
        '/client-home': (context) => const ClientHome(),
        '/register-with-email': (context) => RegisterWithEmail(),
        '/ticket': (context) => TransportationTicket(),
      },
    );
  }
}
