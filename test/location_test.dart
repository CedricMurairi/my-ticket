// import 'package:test/test.dart';
import 'package:my_ticket/helpers/get_location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  group('Get user location', () {
    test(
        'returns Position when location service is enabled and permission is granted',
        () async {
      GeolocatorPlatform.instance = MockGeolocatorPlatform(
          enabled: true, permission: LocationPermission.always);

      final position = await getUserLocation();

      expect(position, isA<Position>());
    });

    test('throws an error when location service is disabled', () async {
      GeolocatorPlatform.instance = MockGeolocatorPlatform(enabled: false);

      expect(
          () => getUserLocation(), throwsA('Location services are disabled.'));
    });

    test('throws an error when location permission is denied', () async {
      GeolocatorPlatform.instance = MockGeolocatorPlatform(
          enabled: true, permission: LocationPermission.denied);

      expect(
          () => getUserLocation(), throwsA('Location permissions are denied'));
    });

    test('throws an error when location permission is denied forever',
        () async {
      GeolocatorPlatform.instance = MockGeolocatorPlatform(
          enabled: true, permission: LocationPermission.deniedForever);

      expect(
          () => getUserLocation(),
          throwsA(
              'Location permissions are denied permanently, we cannot request permissions.'));
    });
  });
}

class MockGeolocatorPlatform extends GeolocatorPlatform {
  final bool enabled;
  final LocationPermission permission;

  MockGeolocatorPlatform(
      {this.enabled = true, this.permission = LocationPermission.always});

  @override
  Future<bool> isLocationServiceEnabled() async {
    return enabled;
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return permission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return permission;
  }

  @override
  Future<Position> getCurrentPosition(
      {LocationSettings? locationSettings = const LocationSettings(
        timeLimit: Duration(seconds: 5),
        accuracy: LocationAccuracy.best,
        distanceFilter: 0,
      )}) async {
    return Position(
      latitude: 0.0,
      longitude: 0.0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
  }
}
