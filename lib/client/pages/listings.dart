import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../widgets/search_form.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List<Map<String, dynamic>> tickets = [];

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/mocks/tickets.json').then((value) {
      setState(() {
        tickets = List<Map<String, dynamic>>.from(json.decode(value));
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
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.topLeft,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/listings.png"),
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08, left: 20),
                child: const Text(
                  "Where to?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13),
                child: const SearchForm(),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              key: const PageStorageKey('tickets'),
              itemBuilder: ((context, index) => ListTile(
                    title: Text(tickets[index]['from']),
                    subtitle: Text(tickets[index]['to']),
                  )),
              itemCount: tickets.length,
            ),
          )
        ],
      ),
    ));
  }
}
