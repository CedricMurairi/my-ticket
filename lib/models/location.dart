import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';

class LocationModel extends ChangeNotifier {
  List<Placemark>? _userLocation;

  List<Placemark>? get userLocation => _userLocation;

  void setUserLocation(List<Placemark>? userLocation) {
    if (userLocation == _userLocation) return;
    _userLocation = userLocation;
  }
}
