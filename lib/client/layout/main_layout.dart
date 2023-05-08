import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:my_ticket/models/location.dart';
import 'package:my_ticket/models/user.dart';
import 'package:provider/provider.dart';

import '../../helpers/get_location.dart';
import '../../shared/bottom_navigation.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({required this.child, Key? key}) : super(key: key);

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    super.initState();
    checkCurrentUser();
    getLocation();
  }

  void checkCurrentUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      Provider.of<UserModel>(context, listen: false).setUser(currentUser);
    }
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
