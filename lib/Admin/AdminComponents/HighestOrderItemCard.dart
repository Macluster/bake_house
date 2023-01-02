import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Pages/ItemDetailsPage.dart';
import 'package:bake_house/Services/Database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HighesOrderItemCard extends StatefulWidget {
  ItemModel model = ItemModel("", "", "", "", 0, "", 0, "", 0);
  int total;
  int value;

  HighesOrderItemCard(this.model, this.total, this.value);

  @override
  State<HighesOrderItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<HighesOrderItemCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.model.image + "1.png");
  }

  getPercantage() {
    double percent = ((widget.value / widget.total) * 100).toInt() as double;
    print("percent=" + percent.toString());
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
          margin: const EdgeInsets.all(10),
          width: 100,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(getPercantage().toString() + "%"),
              Container(
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                height: getPercantage(),
              ),
              Container(
                width: 150,
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          widget.model.image + "3.png",
                          height: 50,
                          width: 50,
                        )),
                    Text(widget.model.name)
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
