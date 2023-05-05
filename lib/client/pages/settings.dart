import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Center(
        child: Text("Settings"),
      ),
    );
  }
}
