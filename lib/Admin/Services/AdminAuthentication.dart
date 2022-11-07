import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bake_house/Config/config.dart';

class AdminAuthentication {
  Future<bool> LoginChecker() async {
    var pref = await SharedPreferences.getInstance();
    print("value of v" + pref.getBool('BakerLoggedIn').toString());
    var v = pref.getBool('BakerLoggedIn') ?? false;

    return v;
  }

  Login(String userName, String password) async {
    var pref = await SharedPreferences.getInstance();

    print("ASFaf=" + pref.get('bakerName').toString());
    var result = await http.post(
        Uri.parse('http://$Configip/bake_house/Server/BakerLogin.php'),
        body: {
          "userName": userName,
          "password": password
        },
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    var map = jsonDecode(result.body);

  //  print("resilt" + result.body);

    await pref.setBool("BakerLoggedIn", true);
   // print(pref.getBool('BakerLoggedIn'));
    await pref.setString("bakerName", map['bakerName']);
    await pref.setString("bakerEmail", userName);
    await pref.setString("bakerId", map['bakerId']);
  }

  SignUp(String name, String email, String number, String address,
      String password) async {
    print('sdasd');
    var result = await http.post(
        Uri.parse('http://$Configip/bake_house/Server/BakerSignUp.php'),
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
    await pref.setString("bakerName", name);
    await pref.setString("bakerEmail", email);
    await pref.setString("bakerId", result.body.toString());
  }
}
