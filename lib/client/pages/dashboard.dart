import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
