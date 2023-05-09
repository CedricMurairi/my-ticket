import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:convert';

class TicketModel extends ChangeNotifier {
  bool _searching = false;

  List<Map<String, dynamic>>? _tickets;

  List<Map<String, dynamic>>? get tickets => _tickets;

  bool get searching => _searching;

  void setSearching(bool searching) {
    if (searching == _searching) return;
    _searching = searching;
    notifyListeners();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> localFile() async {
    final path = await _localPath;

    return File('$path/tickets.json');
  }

  Future<File> writeTickets(String tickets) async {
    final file = await localFile();

    return file.writeAsString(tickets);
  }

  Future<List<Map<String, dynamic>>> readTickets() async {
    try {
      final file = await localFile();

      final contents = await file.readAsString();

      return List<Map<String, dynamic>>.from(json.decode(contents));
    } catch (e) {
      return [];
    }
  }

  Future<void> setTickets() async {
    _tickets = await readTickets();
    setSearching(false);
    notifyListeners();
  }

  void searchTickets(Map<String, String> query) {
    if (query.values.any((element) => element.isNotEmpty)) {
      final List<Map<String, dynamic>> searchResults = _tickets!
          .where((element) => query.entries.every((entry) =>
              entry.value.isEmpty ||
              (element.containsKey(entry.key) &&
                  element[entry.key]
                      .toString()
                      .toLowerCase()
                      .contains(entry.value.toLowerCase()))))
          .toList();
      _tickets = searchResults;
      setSearching(true);
      notifyListeners();
    } else {
      setTickets();
    }
  }

  void addTicket(Map<String, dynamic>? ticket) {
    if (ticket != null) {
      _tickets?.add(ticket);
      writeTickets(json.encode(_tickets));
      notifyListeners();
    }
  }

  void deleteTicket(int? ticketId) {
    if (ticketId != null) {
      _tickets?.removeWhere((element) => element['id'] == ticketId);
      writeTickets(json.encode(_tickets));
      notifyListeners();
    }
  }
}
