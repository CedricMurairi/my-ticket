import 'package:flutter/foundation.dart';

class BookingsModel extends ChangeNotifier {
  List<Map<String, dynamic>>? _bookings;

  List<Map<String, dynamic>>? get bookings => _bookings;

  void setBookings(List<Map<String, dynamic>>? bookings) {
    _bookings = bookings;
  }

  void addBooking(Map<String, dynamic>? booking) {
    if (booking != null) {
      _bookings?.add(booking);
    }
  }

  void deleteBooking(int? bookingId) {
    if (bookingId != null) {
      _bookings?.removeWhere((element) => element['id'] == bookingId);
      notifyListeners();
    }
  }
}
