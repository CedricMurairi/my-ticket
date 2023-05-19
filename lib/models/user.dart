import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends ChangeNotifier {
  User? _user;
  bool? _notify;

  User? get user => _user;

  Future<void> getUser() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == _user) return;
      _user = user;
      notifyListeners();
    });
  }

  bool? get notify => _notify;

  void setNotify(bool? notify) {
    if (notify == _notify) return;
    _notify = notify;
    notifyListeners();
  }
}
