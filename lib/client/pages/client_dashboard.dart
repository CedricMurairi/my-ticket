import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
              
            Hero(
              tag: 'imageHero',
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/dashboard.png'),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Stack(
    children: [
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  ),
              ),
            ),
              SizedBox(
                        height:
                            10),
            Text(
              'Filter by Company: Ritico',
                      style: TextStyle(
                        fontSize: 14.0,
                       
                      ),
                       textAlign: TextAlign.left,
                    ),
                    SizedBox(
                        height:
                            10),
            Expanded(
              child: ListView(
                children: [
                  TicketCard(
                    ticket: Ticket(
                      origin: 'Kigali',
                      destination: 'Gisenyi',
                      paidAmount: 4,
                      dateTime: DateTime(2023, 4, 20, 22),
                      operator: 'Ritico Ltd',
                    ),
                  ),
                  TicketCard(
                    ticket: Ticket(
                      origin: 'Kigali',
                      destination: 'Butare',
                      paidAmount: 5,
                      dateTime: DateTime(2023, 4, 21, 10),
                      operator: 'Volcano Express',
                    ),
                  ),
                  TicketCard(
                    ticket: Ticket(
                      origin: 'Kigali',
                      destination: 'Musanze',
                      paidAmount: 3,
                      dateTime: DateTime(2023, 4, 22, 18),
                      operator: 'Expo Express',
                    ),
                  ),
                ],
              ),
            ),

              SizedBox(
                        height:
                            10),
            Text(
              'Archived Tickets',
                      style: TextStyle(
                        fontSize: 14.0,
                        
                      ),
                      textAlign: TextAlign.right,
                    ),

            Expanded(
              child: ListView(
                children: [
                  TicketCard(
                    ticket: Ticket(
                      origin: 'Kigali',
                      destination: 'Gisenyi',
                      paidAmount: 4,
                      dateTime: DateTime(2023, 4, 20, 22),
                      operator: 'Ritico Ltd',
                    ),
                  ),
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class Ticket {
  final String origin;
  final String destination;
  final double paidAmount;
  final DateTime dateTime;
  final String operator;

  Ticket({
    required this.origin,
    required this.destination,
    required this.paidAmount,
    required this.dateTime,
    required this.operator,
  });
}

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${ticket.origin} - ${ticket.destination}'),
                      SizedBox(
                          height:
                              5), // Add some space between the texts and the column

                      Text('${ticket.dateTime.day}/${ticket.dateTime.month}/${ticket.dateTime.year} | ${ticket.dateTime.hour}:${ticket.dateTime.minute}'),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Paid: ${ticket.paidAmount}\$'),
                    ],
                  )
                ],
            ),

              SizedBox(height: 20.0),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Operator: ${ticket.operator}'),
                    ],
                  
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                         ElevatedButton(
              onPressed: () {
                // TODO: Implement view ticket details functionality
              },
               style: ElevatedButton.styleFrom(
    primary: Colors.white,
  ),
              child: 
              Text('View', style: TextStyle( color: Colors.black, ),),
            ),
                    ],
               
                )
                
                
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
