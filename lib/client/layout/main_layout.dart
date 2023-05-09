import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:my_ticket/models/location.dart';
import 'package:my_ticket/models/user.dart';
import 'package:provider/provider.dart';

import 'package:my_ticket/helpers/get_location.dart';
import 'package:my_ticket/shared/bottom_navigation.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({required this.child, Key? key}) : super(key: key);

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkUser();
    getLocation();
  }

  void checkUser() {
    final user = Provider.of<UserModel>(context, listen: false);
    user.getUser().then((value) {
      if (user.user == null) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  void getLocation() {
    if (Provider.of<LocationModel>(context, listen: false).userLocation !=
        null) {
      return;
    }
    try {
      getUserLocation().then(
        (location) => {
          placemarkFromCoordinates(location.latitude, location.longitude).then(
            (placemarks) => {
              Provider.of<LocationModel>(context, listen: false)
                  .setUserLocation(placemarks),
            },
          )
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: widget.child,
    );
  }
}
