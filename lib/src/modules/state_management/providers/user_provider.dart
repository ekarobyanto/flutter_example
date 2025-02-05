import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/state_management/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
