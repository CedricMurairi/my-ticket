import 'package:flutter/material.dart';
import 'dart:math';

import '../client/widgets/payment_form.dart';
import '../helpers/trigger_bottom_sheet.dart';

class TicketCard extends StatefulWidget {
  final Map<String, dynamic> ticket;
  final String currency;
  const TicketCard({required this.ticket, required this.currency, super.key});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    List<int> ticketColors = [0xFFD9E7CB, 0xFFFFDCC1, 0xFFFFE088, 0xFFD9D9D9];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Color(ticketColors[Random().nextInt(ticketColors.length)]),
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
                      "${widget.ticket['from']} - ${widget.ticket['to']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                          "${widget.ticket['date_of_departure']} | ${widget.ticket['time_of_departure']}"),
                    ),
                  ],
                ),
                Text(
                  "Price: ${widget.currency}${widget.ticket['price']}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Operator:${widget.ticket['bus_operator']}",
                  style: const TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      triggerBottomSheet(
                        context,
                        PaymentForm(
                          ticketPrice: widget.ticket["price"],
                        ),
                        0.70,
                      );
                    },
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
    );
  }
}
