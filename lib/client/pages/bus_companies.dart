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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFD9E7CB),
                          Color(0xFFFFDCC1),
                          Color(0xFFFFE088),
                          Color(0xFFD9D9D9)
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.29,
                      height: MediaQuery.of(context).size.width * 0.29,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Bus Co. Details and Notifications",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: 30),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                  itemCount: companies.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xFFD9D9D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            companies[index]['company_name'],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            companies[index]['description'],
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.notifications,
                        ),
                      ),
                    ),
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
