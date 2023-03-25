import 'package:flutter/material.dart';
// import 'package:my_ticket/shared/form.dart';
import 'package:my_ticket/shared/splash_screen.dart';
import 'package:my_ticket/shared/onbarding_screen.dart';
import 'package:my_ticket/auth/register.dart';
import 'package:my_ticket/client/pages/client_home.dart';
import 'package:my_ticket/auth/register_with_email.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_ticket/shared/widget_test.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Itike',
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
        '/widget-test': (context) => const WidgetTest(),
      },
    );
  }
}
