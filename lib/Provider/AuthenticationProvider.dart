import 'package:flutter/cupertino.dart';

class AuthenticationProvider extends ChangeNotifier {
  String name = "";
  String email = "";
  String id = "";
  bool loggedin = false;

  String get userName => name;
  String get userEmail => email;
  String get userId => id;
  bool get loggedIn => loggedin;

  setUserName(String name) {
    this.name = name;
    notifyListeners();
  }

  setUserEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setUserId(String id) {
    this.id = id;
    notifyListeners();
  }

  setLoggedIn(bool value) {
    loggedin = value;
    notifyListeners();
  }
}
