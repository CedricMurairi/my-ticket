import 'package:flutter/material.dart';
import 'package:my_ticket/auth/pages/code_confirmation.dart';
import 'package:my_ticket/auth/pages/login_with_phone.dart';
import 'package:my_ticket/client/pages/bus_companies.dart';
import 'package:my_ticket/client/pages/dashboard.dart';
import 'package:my_ticket/client/pages/profile.dart';
import 'package:my_ticket/client/pages/settings.dart';
import 'package:my_ticket/shared/splash_screen.dart';
import 'package:my_ticket/shared/onboarding_screen.dart';
import 'package:my_ticket/auth/pages/register.dart';
import 'package:my_ticket/client/pages/listings.dart';
import 'package:my_ticket/shared/ticket_widget.dart';
import 'package:my_ticket/auth/pages/continue_with_phone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/pages/forgot_password.dart';
import 'auth/pages/login.dart';
import 'auth/pages/reset_password.dart';
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
        '/login': (context) => const Login(),
        '/continue-with-phone': (context) => ContinueWithPhone(),
        '/verify-number': (context) => const CodeConfirmation(),
        '/login-with-phone': (context) => LoginWithPhone(),
        '/forgot-password': (context) => ForgotPassword(),
        '/reset-password': (context) => ResetPassword(),
        '/listings': (context) => const Listings(),
        '/bus-companies': (context) => const BusCompanies(),
        '/dashboard': (context) => const Dashboard(),
        '/profile': (context) => const Profile(),
        '/settings': (context) => const Settings(),
        '/ticket': (context) => const TransportationTicket(),
      },
    );
  }
}
