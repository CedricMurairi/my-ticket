import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_ticket/shared/ticket_card.dart';

void main() {
  testWidgets('TicketCard widget test', (WidgetTester tester) async {
    Map<String, dynamic> ticket = {
      'from': 'City A',
      'to': 'City B',
      'date_of_departure': '2023-05-16',
      'time_of_departure': '09:00 AM',
      'price': 50,
      'bus_operator': 'Bus Company'
    };

    // Build the TicketCard widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(children: [
              Expanded(
                child: TicketCard(ticket: ticket),
              )
            ]),
          ),
        ),
      ),
    );

    // Verify that the widget displays the correct information
    expect(find.textContaining('City A - City B'), findsOneWidget);
    expect(find.textContaining('2023-05-16 | 09:00 AM'), findsOneWidget);
    expect(find.text('Book Now'), findsOneWidget);
  });
}
