import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int targetPage = 0;
  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/welcome_icon.png',
      'title': 'Welcome to Itike',
      'text':
          'Plan your trip with ease and buy bus tickets in advance, all from the comfort of your own device.',
      'action': 'Continue'
    },
    {
      'image': 'assets/images/book_ticket.png',
      'title': 'Buy Bus Tickets',
      'text':
          'Purchase bus tickets securely and easily with various payment methods, including Mobile Money.',
      'action': 'Continue'
    },
    {
      'image': 'assets/images/real_time.png',
      'title': 'Real-Time Information',
      'text':
          'Access real-time information on ticket availability and travel schedules. Find and buy bus tickets now!',
      'action': 'Book Your Ticket Now'
    },
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
                onboardingData[targetPage]['image']!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                onboardingData[targetPage]['title']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
              child: Text(
                onboardingData[targetPage]['text']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                width: 50,
                height: 9,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[800]),
                  width: 16.6 * (targetPage + 1),
                  height: 8,
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
                child: Text(
                  onboardingData[targetPage]['action']!,
                  style: const TextStyle(color: Colors.black),
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
