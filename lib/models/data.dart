import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class DataModel extends ChangeNotifier {
  bool _notify = false;
  String? _phoneNumber;
  bool _savePhoneNumber = false;

  bool get notify => _notify;
  bool get savePhoneNumber => _savePhoneNumber;
  String? get phoneNumber => _phoneNumber;

  Future<File> localFile() async {
    final path = await _localPath;

    return File('$path/data.json');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> writeData(String data) async {
    final file = await localFile();

    return file.writeAsString(data);
  }

  Future<List<Map<String, dynamic>>> readData() async {
    try {
      final file = await localFile();

      final contents = await file.readAsString();

      return List<Map<String, dynamic>>.from(json.decode(contents));
    } catch (e) {
      return [];
    }
  }

  Future<void> setData() async {
    final List<Map<String, dynamic>> data = await readData();
    if (data.isNotEmpty) {
      _notify = data[0]['notify'];
      _phoneNumber = data[0]['phoneNumber'];
      _savePhoneNumber = data[0]['savePhoneNumber'];
    }
    notifyListeners();
  }

  Future<void> saveData() async {
    final List<Map<String, dynamic>> data = [
      {
        'notify': _notify,
        'phoneNumber': _phoneNumber,
        'savePhoneNumber': _savePhoneNumber
      }
    ];
    await writeData(json.encode(data));
    await setData();
  }

  void setNotify(bool notify) {
    if (notify == _notify) return;
    _notify = notify;
    notifyListeners();
  }

  void setSavePhoneNumber(bool savePhoneNumber) {
    if (savePhoneNumber == _savePhoneNumber) return;
    _savePhoneNumber = savePhoneNumber;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    if (phoneNumber == _phoneNumber) return;
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
