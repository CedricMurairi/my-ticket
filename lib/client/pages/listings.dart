import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_ticket/shared/text_button.dart';

import '../widgets/search_form.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List<Map<String, dynamic>> tickets = [];
  List<int> ticketColors = [0xFFD9E7CB, 0xFFFFDCC1, 0xFFFFE088, 0xFFD9D9D9];

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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: 20),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                key: const PageStorageKey('tickets'),
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Color(ticketColors[
                              Random().nextInt(ticketColors.length)]),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${tickets[index]['from']} - ${tickets[index]['to']}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                          "${tickets[index]['date_of_departure']} | ${tickets[index]['time_of_departure']}"),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Price:${tickets[index]['price']}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Operator:${tickets[index]['bus_operator']}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text("Book Now",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
