import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:my_ticket/models/bookings.dart';
import 'package:my_ticket/models/tickets.dart';
import 'package:provider/provider.dart';

import 'package:my_ticket/shared/ticket_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<bool> _selectedTickets = [true, false, false];
  final List<Widget> ticketCategories = const <Widget>[
    Text('All'),
    Text('Active'),
    Text('Past'),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Provider.of<TicketModel>(context, listen: false)
        .setTickets()
        .then((value) => null);
    Provider.of<BookingsModel>(context, listen: false)
        .setBookings()
        .then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    final tickets =
        Provider.of<TicketModel>(context, listen: true).tickets ?? [];
    final bookings =
        Provider.of<BookingsModel>(context, listen: true).bookings ?? [];

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
                    border: Border(
                        bottom: BorderSide(color: Color(0xFFD9D9D9), width: 1)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/road_map.png"),
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08, left: 20),
                  child: const Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedTickets.length; i++) {
                      _selectedTickets[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                selectedBorderColor: const Color(0xFFFFDCC1),
                selectedColor: Colors.black,
                fillColor: const Color(0xFFD9D9D9),
                color: const Color(0xFFD9D9D9),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedTickets,
                children: ticketCategories,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: 20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  key: const PageStorageKey('tickets'),
                  itemBuilder: ((context, index) =>
                      tickets.isNotEmpty && bookings.isNotEmpty
                          ? TicketCard(
                              ticket: tickets.firstWhere((element) =>
                                  element["id"] == bookings[index]['ticketId']),
                              toBook: false,
                            )
                          : const Center(child: Text('No tickets booked yet'))),
                  itemCount: bookings.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
