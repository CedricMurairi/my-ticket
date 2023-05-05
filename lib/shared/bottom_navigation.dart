import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  final List<String> navigationList = [
    '/listings',
    '/bus-companies',
    '/dashboard',
    '/profile',
    '/settings'
  ];

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          Navigator.pushNamed(context, navigationList[index],
              arguments: {"index": index});
        });
      },
      selectedItemColor: const Color(0xff2f1500),
      unselectedItemColor: const Color(0xff97877a),
      backgroundColor: const Color(0xfffff8f3),
      showUnselectedLabels: true,
      currentIndex: arguments?['index'] ?? currentIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.sort_by_alpha), label: "Listing"),
        BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_outlined), label: "Bus Co"),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
