import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import '../Config/config.dart';

class Authentication {
  Future<bool> LoginChecker() async {
    var pref = await SharedPreferences.getInstance();
    print("value of v" + pref.getBool('LoggedIn').toString());
    var v = pref.getBool('LoggedIn') ?? false;

    return v;
  }

  Login(String userName, String password) async {
    var pref = await SharedPreferences.getInstance();

    print("ASFaf=" + pref.get('userName').toString());
    var result = await http
        .post(Uri.parse('http://$Configip/bake_house/Server/Login.php'), body: {
      "userName": userName,
      "password": password
    }, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });

    var map = jsonDecode(result.body);

    print(result.body);

    await pref.setBool("LoggedIn", true);
    print(pref.getBool('LoggedIn'));
    await pref.setString("userName", map['userName']);
    await pref.setString("UserEmail", userName);
    await pref.setString("userId", map['userId']);
  }

  SignUp(String name, String email, String number, String address,
      String password) async {
    print('sdasd');
    var result = await http.post(
        Uri.parse('http://$Configip/bake_house/Server/SignUp.php'),
        body: {
          "name": name,
          "email": email,
          "number": number,
          "address": address,
          "password": password
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    print("Respone from authenticating server is ${result.body}");

    var pref = await SharedPreferences.getInstance();
    await pref.setBool("LoggedIn", true);
    await pref.setString("userName", name);
    await pref.setString("UserEmail", email);
    await pref.setString("userId", result.body.toString());
  }
}
