import 'dart:convert';

import 'package:bake_house/Admin/Models/BakerModel.dart';
import 'package:bake_house/Admin/Models/MessageModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;
import 'package:bake_house/Config/config.dart';

class FireBaseDatabase {
  var ipAdress = "";
  FireBaseDatabase() {
    ipAdress = Configip;
  }

  var ref = FirebaseDatabase.instance.ref('Chats');

  void AddMessage(int userid, String message, int bakerId) async {
    String count = "0";
    String time = "${DateTime.now().hour}:${DateTime.now().minute}";

    var snap = await ref
        .child(userid.toString())
        .child("A" + bakerId.toString())
        .child("count")
        .get();

    if (snap.value != null) count = snap.value as String;

    ref.child(userid.toString()).child("A" + bakerId.toString()).push().set({
      "message": message,
      "time": time,
      "sender": "baker",
      "messageId": (int.parse(count) + 1).toString()
    });

    ref
        .child(userid.toString())
        .child("A" + bakerId.toString())
        .child("count")
        .set((int.parse(count) + 1).toString());
  }
}
