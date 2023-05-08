import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel extends ChangeNotifier {
  Position? _userLocation;

  Position? get user => _userLocation;

  void setUser(Position? userLocation) {
    if (userLocation == _userLocation) return;
    _userLocation = userLocation;
  }
}
