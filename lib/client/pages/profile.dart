import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Center(
        child: Text("Profile"),
      ),
    );
  }
}
