import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:flutter/services.dart' show rootBundle;

class BusCompanies extends StatefulWidget {
  const BusCompanies({Key? key}) : super(key: key);

  @override
  State<BusCompanies> createState() => _BusCompaniesState();
}

class _BusCompaniesState extends State<BusCompanies> {
  List<Map<String, dynamic>> companies = [];

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/mocks/companies.json').then((value) {
      setState(() {
        companies =
            List<Map<String, dynamic>>.from(json.decode(value)['companies']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: companies.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    // leading: Image.network(
                    //   companies[index]['display_image'],
                    //   width: 50,
                    //   height: 50,
                    // ),
                    title: Text(companies[index]['company_name']),
                    subtitle: Text(companies[index]['description']),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
