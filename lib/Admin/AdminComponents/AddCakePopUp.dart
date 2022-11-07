import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';

import 'package:bake_house/Admin/Database.dart';
import 'package:bake_house/Admin/Providers/PopUpProvider.dart';
import 'package:bake_house/Model/ItemModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCakePopPup extends StatefulWidget {
  @override
  State<AddCakePopPup> createState() => _AddCakePopPupState();
}

class _AddCakePopPupState extends State<AddCakePopPup> {
  String bakerId = " ";

  var cakeName = TextEditingController();

  var cakeFlavour = TextEditingController();

  var cakePrice = TextEditingController();

  var cakeIngredients = TextEditingController();

  var cakeCalories = TextEditingController();

  String image1 = " ";

  String image2 = " ";

  Uint8List unit1 = new Uint8List(10);
  Uint8List unit2 = new Uint8List(10);
  bool NoImage = true;
  bool NoImage2 = true;
  _AddCakePopPupState() {
    Startup();
  }

  void Startup() async {
    var pref = await SharedPreferences.getInstance();
    bakerId = pref.getString('bakerId') as String;
  }

  Widget PhotoPicker1() {
    return GestureDetector(
      onTap: () async {
        var file =
            await ImagePicker.platform.pickImage(source: ImageSource.gallery);

        if (file != null) {
          print(file.path);

          unit1 = await file.readAsBytes();
          image1 = base64.encode(unit1);
          NoImage = false;

          setState(() {});
        }
      },
      child: Container(
          height: 150,
          width: 100,
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(width: 1, color: Colors.grey),
                  bottom: BorderSide(width: 1, color: Colors.grey),
                  left: BorderSide(width: 1, color: Colors.grey),
                  right: BorderSide(width: 1, color: Colors.grey))),
          alignment: Alignment.center,
          child: NoImage == true
              ? const Icon(
                  Icons.add_a_photo_sharp,
                  size: 40,
                  color: Colors.grey,
                )
              : Image.memory(unit1)),
    );
  }

  Widget PhotoPicker2() {
    return GestureDetector(
      onTap: () async {
        var file =
            await ImagePicker.platform.pickImage(source: ImageSource.gallery);

        if (file != null) {
          print(file.path);

          unit2 = await file.readAsBytes();
          image2 = base64.encode(unit2);
          NoImage2 = false;

          setState(() {});
        }
      },
      child: Container(
          height: 150,
          width: 100,
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(width: 1, color: Colors.grey),
                  bottom: BorderSide(width: 1, color: Colors.grey),
                  left: BorderSide(width: 1, color: Colors.grey),
                  right: BorderSide(width: 1, color: Colors.grey))),
          alignment: Alignment.center,
          child: NoImage2 == true
              ? const Icon(
                  Icons.add_a_photo_sharp,
                  size: 40,
                  color: Colors.grey,
                )
              : Image.memory(unit2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 700,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey.shade200, spreadRadius: 10, blurRadius: 10)
      ]),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(
                onTap: () {
                  context.read<PopUpProvider>().setStatus(false);
                },
                child: const Icon(Icons.close))
          ]),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Add Cake Details",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  PhotoPicker1(),
                  PhotoPicker2(),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                        controller: cakeName,
                        decoration: InputDecoration(hintText: "Cake name")),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                        controller: cakeFlavour,
                        decoration: InputDecoration(hintText: "Cake Flavour")),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                        controller: cakePrice,
                        decoration: InputDecoration(hintText: "Cake price")),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                        controller: cakeIngredients,
                        decoration: InputDecoration(hintText: "Ingredients")),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                        controller: cakeCalories,
                        decoration: InputDecoration(hintText: "Calories")),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  AdminDatabase().addCakes(ItemModel(
                      " ",
                      cakeName.text,
                      cakeFlavour.text,
                      "http://localhost/bake_house/Server/assets/cakes/$bakerId/${cakeName.text}/",
                      int.parse(cakePrice.text),
                      bakerId,
                      0,
                      cakeIngredients.text,
                      int.parse(cakeCalories.text)));
                  print("ssssssssssssss");

                  AdminDatabase()
                      .uploadFile(image1, cakeName.text, bakerId, "1");
                  AdminDatabase()
                      .uploadFile(image2, cakeName.text, bakerId, "3");

                  context.read<PopUpProvider>().setStatus(false);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Submit"),
                  color: Colors.yellow,
                ),
              )),
        ],
      ),
    );
  }
}
