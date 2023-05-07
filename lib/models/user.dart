import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    if (user == _user) return;
    _user = user;
  }
}
