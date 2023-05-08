import 'package:flutter/material.dart';
import 'package:my_ticket/models/user.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticket extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const Ticket({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context).user;

    // TODO User should cancel and/or transfer ticket
    // TODO Ticket shoul include a stepper showing verification at each checkpoint

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Ticket ID'),
                    Text(
                      ticket['id'].toString(),
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Date'),
                    Text(
                      ticket['date_of_departure'],
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ticket['from'],
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '-',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  ticket["to"],
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Color(0xFFD9D9D9),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Passenger Name'),
                  ),
                  Text(
                    user?.displayName ?? '',
                    style: const TextStyle(
                        fontSize: 21.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Color(0xFFD9D9D9),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Departure Time'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "${ticket["time_of_departure"]} AM",
                        style: const TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD9D9D9)),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(5.0),
                    child: QrImage(
                      data: {
                        'ticket_id': ticket['id'],
                        'user_id': user?.uid,
                      }.toString(),
                      version: QrVersions.auto,
                      size: 100.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
