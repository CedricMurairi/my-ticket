import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  Map<String, String> currentUser = {
    "name": "",
    "email": "",
    "photoUrl": "",
    "uid": ""
  };

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
        Navigator.pushReplacementNamed(context, "/register");
      } else {
        setState(() {
          currentUser = {
            "name": user.displayName!,
            "email": user.email!,
            "photoUrl": user.photoURL!,
            "uid": user.uid
          };
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image(image: NetworkImage(currentUser["photoUrl"]!)),
            Text("Name: ${currentUser["name"]!}"),
            Text("Email: ${currentUser["email"]!}"),
            Text("UID: ${currentUser["uid"]!}"),
            TextButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.blueAccent))),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
