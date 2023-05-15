import 'package:flutter/material.dart';
import 'package:my_ticket/shared/ticket_widget.dart';
import 'dart:math';

import 'package:my_ticket/client/widgets/payment_form.dart';
import 'package:my_ticket/helpers/trigger_bottom_sheet.dart';

class TicketCard extends StatefulWidget {
  final Map<String, dynamic> ticket;
  final bool toBook;
  final String currency;
  const TicketCard({
    required this.ticket,
    this.currency = 'RWF',
    this.toBook = true,
    super.key,
  });

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
                  "${widget.toBook == true ? "Price" : "Paid"}: ${widget.currency}${widget.ticket['price']}",
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
                        widget.toBook == true
                            ? PaymentForm(
                                ticket: widget.ticket,
                              )
                            : Ticket(ticket: widget.ticket),
                        widget.toBook == true ? 0.70 : 0.55,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      widget.toBook == true ? "Book Now" : "View",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
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
