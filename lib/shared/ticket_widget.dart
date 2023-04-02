import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TransportationTicket extends StatelessWidget {
  const TransportationTicket({super.key});

  /*  final String ticketId;
  final DateTime date;
  final String fromCity;
  final String toCity;
  final String passengerName;
  final String departureTime;

    TransportationTicket({
    required this.ticketId,
    required this.date,
    required this.fromCity,
    required this.toCity,
    required this.passengerName,
    required this.departureTime,
  }); */

/* TransportationTicket(
  {
    ticketId: '123456',
    date: DateTime.now(),
    fromCity: 'New York - USA',
    toCity: 'London - UK',
    passengerName: 'John Doe',
    departureTime: '10:00 AM',
  }
); */

  @override
  Widget build(BuildContext context) {
    // Generate QR code for the scan code
    final qrCode = QrImage(
/*       data: ticketId,
 */
      data: 'TG1234',
      version: QrVersions.auto,
      size: 100.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ticket ID and date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ticket ID',
                          style: TextStyle(
                            fontSize: 14.0,
                          )),
                      SizedBox(
                          height:
                              10), // Add some space between the texts and the column

                      Text('TG1234',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date',
                          style: TextStyle(
                            fontSize: 14.0,
                          )),
                      SizedBox(
                          height:
                              10), // Add some space between the texts and the column

                      Text('20-03-2023',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),

              SizedBox(height: 25.0),

              // From and to destinations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kigali, Rwanda',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Add some space between the texts and the column

                      Text('KGL',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(
                    '-',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Goma, DR Congo',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Add some space between the texts and the column

                      Text(
                        'GMO',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 20.0),
              Divider(
                thickness: 3, // Set the thickness of the line
                color: Colors.black, // Set the color of the line
              ),
              SizedBox(height: 20.0),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Passenger Name',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Add some space between the texts and the column
                    Text(
                      'Serge Tassiga',
                      style: TextStyle(
                          fontSize: 21.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Divider(
                thickness: 3, // Set the thickness of the line
                color: Colors.black, // Set the color of the line
              ),

              SizedBox(height: 20.0),

              // Departure time and QR code
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Departure Time',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                          height:
                              5), // Add some space between the texts and the column
                      Text(
                        '10:00 AM',
                        style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.grey[800],
                            color: Colors.white),
                      ),
                    ],
                  ),
                  // Empty space for spacing out the widgets
                  SizedBox(height: 20.0),

                  Center(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      /*  decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                ), */

                      child: qrCode, // Your QR code widget
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
