import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';

class BusCompanies extends StatefulWidget {
  const BusCompanies({super.key});

  @override
  State<BusCompanies> createState() => _BusCompaniesState();
}

class _BusCompaniesState extends State<BusCompanies> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      child: Center(
        child: Text("BusCompanies"),
      ),
    );
  }
}
