import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void ShowAlert(BuildContext context, Function f) async {
  bool isUserDontwanttheLocation = false;

  SharedPreferences pref = await SharedPreferences.getInstance();
  isUserDontwanttheLocation = pref.getBool('LocationPref') ?? false;

  if (isUserDontwanttheLocation == false) {
    bool isPermissionDenied = false;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {}
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      isPermissionDenied = true;
      print("Permission denied yes");
    }

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () async {
        Navigator.of(context).pop();
        print("Requesting permmision");
        await Geolocator.requestPermission().then(
            (value) => value == LocationPermission.always ? f() : print(value));
      },
    );
    Widget cancelButton = TextButton(
      child: Text("No need"),
      onPressed: () async {
        f();
        pref.setBool('LocationPref', true);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Location Permmsion"),
      content:
          Text("Location Permmison is required to find the shops near to you"),
      actions: [okButton, cancelButton],
    );

    if (isPermissionDenied == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
