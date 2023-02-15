import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int targetPage = 0;
  final List<List<String>> onboardingData = [
    [
      'assets/images/welcome_icon.png',
      'Welcome to Itike',
      'Plan your trip with ease and buy bus tickets in advance, all from the comfort of your own device.'
    ],
    [
      'assets/images/book_ticket.png',
      'Buy Bus Tickets',
      'Purchase bus tickets securely and easily with various payment methods, including Mobile Money.'
    ],
    [
      'assets/images/real_time.png',
      'Real-Time Information',
      'Access real-time information on ticket availability and travel schedules. Find and buy bus tickets now!'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                onboardingData[targetPage][0],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                onboardingData[targetPage][1],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 100),
              child: Text(
                onboardingData[targetPage][2],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(232, 43)),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(217, 231, 203, 1)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    if (targetPage < onboardingData.length - 1) {
                      targetPage++;
                    } else {
                      Navigator.pushReplacementNamed(context, '/register');
                    }
                  });
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
