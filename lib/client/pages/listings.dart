import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_ticket/models/tickets.dart';
import 'package:my_ticket/shared/ticket_card.dart';
import 'package:provider/provider.dart';

import 'package:my_ticket/client/widgets/search_form.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  void initState() {
    super.initState();
    getTickets();
  }

  void getTickets() {
    if (Provider.of<TicketModel>(context, listen: false).searching == true) {
      return;
    }
    rootBundle.loadString('assets/mocks/tickets.json').then((value) {
      final tickets = Provider.of<TicketModel>(context, listen: false);
      tickets
          .writeTickets(value)
          .then((value) => {tickets.setTickets().then((value) => null)});
    });
  }

  @override
  Widget build(BuildContext context) {
    final tickets =
        Provider.of<TicketModel>(context, listen: true).tickets ?? [];
    final isSearching =
        Provider.of<TicketModel>(context, listen: true).searching;
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
                    )),
                itemCount: tickets.length,
              ),
            ),
          ),
          isSearching && tickets.isEmpty
              ? const Center(
                  child: Center(child: Text("No tickets matching your search")),
                )
              : const Text(""),
          isSearching
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextButton.icon(
                    onPressed: () {
                      getTickets();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Color(0xFFD9D9D9),
                    ),
                    label: const Text(
                      "Clear Search",
                      style:
                          TextStyle(color: Color.fromARGB(255, 192, 190, 190)),
                    ),
                  ),
                )
              : const Text("")
        ],
      ),
    ));
  }
}
