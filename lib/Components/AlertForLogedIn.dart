

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/LoginPage.dart';

class AlertForLoggedIn 
{

   void ShowAlert(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Login Alert"),
      content: Text("you have not Logged in yet?. Go to Login Page"),
      actions: [okButton, cancelButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}