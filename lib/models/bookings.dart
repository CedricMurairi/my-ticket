import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class BookingsModel extends ChangeNotifier {
  List<Map<String, dynamic>>? _bookings;

  List<Map<String, dynamic>>? get bookings => _bookings;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> localFile() async {
    final path = await _localPath;

    return File('$path/bookings.json');
  }

  Future<File> writeBookings(String bookings) async {
    final file = await localFile();

    return file.writeAsString(bookings);
  }

  Future<List<Map<String, dynamic>>> readBookings() async {
    try {
      final file = await localFile();

      final contents = await file.readAsString();

      return List<Map<String, dynamic>>.from(json.decode(contents));
    } catch (e) {
      return [];
    }
  }

  void setBookings() async {
    _bookings = await readBookings();
    notifyListeners();
  }

  void addBooking(Map<String, dynamic>? booking) {
    if (booking != null) {
      _bookings?.add(booking);
      writeBookings(json.encode(_bookings));
      notifyListeners();
    }
  }

  void deleteBooking(int? bookingId) {
    if (bookingId != null) {
      _bookings?.removeWhere((element) => element['id'] == bookingId);
      writeBookings(json.encode(_bookings));
      notifyListeners();
    }
  }
}
