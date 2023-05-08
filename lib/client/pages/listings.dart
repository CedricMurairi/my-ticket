import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_ticket/shared/ticket_card.dart';
import 'package:provider/provider.dart';

import '../../models/location.dart';
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
    final location = Provider.of<LocationModel>(context).userLocation ?? [];

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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: 20),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                key: const PageStorageKey('tickets'),
                itemBuilder: ((context, index) => TicketCard(
                      ticket: tickets[index],
                      currency: location[0].isoCountryCode ?? 'RW',
                    )),
                itemCount: tickets.length,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
