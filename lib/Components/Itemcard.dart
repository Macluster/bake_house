import 'package:bake_house/Model/ItemModel.dart';
import 'package:bake_house/Pages/ItemDetailsPage.dart';
import 'package:bake_house/Services/Database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ItemCard extends StatefulWidget {
  ItemModel model = ItemModel("", "", "", "", 0, "", 0, "", 0);

  ItemCard(this.model);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.model.image + "1.png");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetailPage(widget.model)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(children: [
          Image.network(
            widget.model.image + "1.png",
            height: 90,
            width: 90,
          ),
          Text(
            widget.model.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Standard 1Kg"),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 223, 222, 214),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("3.5")
                  ],
                ),
              ),
              Text("${widget.model.price} Rs"),
            ],
          )
        ]),
      ),
    );
  }
}
